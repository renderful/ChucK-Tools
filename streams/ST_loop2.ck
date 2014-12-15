public class ST_loop extends Stream {    
    // ST_loop, generates a list of values using Source of Length, repeats that Repeats times.
    // After the list has been repeated, a new list of values gets generated using source etc...
    null @=> Stream @ st_source;
    null @=> Stream @ st_repeats;
    null @=> Stream @ st_length;

    float _source[0];
    0 => int _repeats;
    0 => int _length;
    
    fun static ST_loop make(Stream sourceArg,Stream repeatsArg,Stream lengthArg) {
        return (new ST_loop).init(sourceArg,repeatsArg,lengthArg);
    }

    fun ST_loop init(Stream sourceArg,Stream repeatsArg,Stream lengthArg) {
        source(sourceArg);
        repeats(repeatsArg);
        return length(lengthArg);
    }

    // setters
    fun ST_loop source(Stream arg) { arg @=> st_source; return this;}
    fun ST_loop length(Stream arg) { arg @=> st_length; return this; }
    fun ST_loop repeats(Stream arg) { arg @=> st_repeats; return this; }

    fun ST_loop source(float arg[]) { arg @=> _source; return this; }
    fun ST_loop length(float arg) { Math.floor(arg) $ int => _length; return this; }
    fun ST_loop repeats(float arg) { Math.floor(arg) $ int => _repeats; return this; }

    fun float next() {
        if (index >= _length) {
            0 => index;
            _repeats--;
            if (_repeats < 1) newLoop();
        }
        index => int tmpIdx;
        index + 1 => index;
        return _source[tmpIdx];
    }

    // resets for a new loop
    fun void newLoop() {
        if (st_repeats != null) st_repeats.nextInt() => _repeats;
        if (st_length != null) st_length.nextInt() => _length;

        // sanity check
        Math.max(1,_length) => _length;
        Math.max(1,_repeats) => _repeats;
        
        _source.size(_length);

        if (st_source != null) {
            for (int i;i<_length;++i) {
                st_source.next() @=> _source[i];
            }
        }
    }
}




   
    