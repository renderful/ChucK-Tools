public class Stream 
{    
    -1 => int size;
    0 => int index;
    "Stream" @=> string _type;
    
    fun Stream supercopy() {
        Stream clone;
        size => clone.size;
        index => clone.index;
        return clone;
    }
    
    fun string type() {
        return _type;
    } 
    
    fun Stream st() { 
        // this can be useful when you want to use make in literal arrays
        return this $ Stream;
    }
    
    fun float next() {
        return 0.;
    }
    
    fun int nextInt() {
        return (Math.floor(next()) $ int);
    }
    
    fun int more() {
        return false;
    }
    
    fun void reset() {
        0 => index;
    }
    
    fun float [] nextChunk(int chunkSize) {
        float output[chunkSize];
        for (int i;i<chunkSize;i++) {
            next() => output[i];
        }
        return output;
    }
    
    fun int [] nextIntChunk(int chunkSize) {
        int output[chunkSize];
        for (int i;i<chunkSize;i++) {
            nextInt() => output[i];
        }
        return output;
    }
    
    fun void test(dur T,dur testLength) {
        now + testLength => time then;
        while(now < then) {
            chout <= next();
            chout <= IO.newline();
            T => now;
        }
        chout <= IO.newline();
    } 
      
    fun void test() { test(.1::second,day); }   
    fun void test(dur T) { test(T,day); }
    
    fun void testInt(dur T, dur testLength) {
        now + testLength => time then;
        while(now < then) {
            chout <= nextInt();
            chout <= IO.newline();
            T => now;
        }
        chout <= IO.newline();   
    }   
    
    fun void testInt() { testInt(.1*second,day); }
    fun void testInt(dur T) { testInt(T,day); }
}