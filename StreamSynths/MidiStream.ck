public class MidiStream {
    MidiOut mout;
    MidiMsg msg;
    if (mout.open(0)) {
        <<<"port 0 is open">>>;
    } else {
        <<<"port failed">>>;
    }
    
    1 => int _channel;
    
    null @=> Stream @ st_pitch;
    null @=> Stream @ st_velo;
    null @=> Stream @ st_dura;
    null @=> Stream @ st_delta;
    
    0x90 => int _noteOn;
    0x80 => int _noteOff;
    
    0 => int play;
    
    fun MidiStream channel(int arg) {
        arg => _channel;
        return this;
    }
    
    fun MidiStream init(Stream pitchArg,Stream veloArg,Stream duraArg,Stream delta) {
        pitchArg @=> st_pitch;
        veloArg @=> st_velo;
        duraArg @=> st_dura;
        delta @=> st_delta;
        spork ~ midiSpork();
        return this;
    }
    
    fun void midiSpork() {
        1 => play;
        
        0x90 + _channel => _noteOn;
        0x80 + _channel => _noteOff;
        
        while(play) {
            spork ~ playNote();
            st_delta.next() * second => now;
        }
    }
    
    fun void playNote() {
        int currentPitch;
        
        _noteOn => msg.data1;
        st_pitch.nextInt() => currentPitch => msg.data2;
        st_velo.nextInt() => msg.data3;
        mout.send(msg);
        
        st_dura.next() * second => now;
        _noteOff => msg.data1;
        currentPitch => msg.data2;
        0 => msg.data3;
        mout.send(msg);
    }
    
    fun MidiStream stop() {
        0 => play;
        return this;
    }
}