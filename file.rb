class ComplexNumber
    $bulkaddType = "bulkadd()"
    $bulkMultiplyType = "bulkMultiply()"
    $add = "+()"
    $multiply = "*()"
    $bulkaddCount = 0
    $bulkMultiplyCount = 0
    $addCount = 0
    $multiplyCount=0 

    attr_reader :real, :imagno
    def initialize(real,imagno)
        @imagno=imagno
        @real=real
    end
   
    def +(other)
      $addCount=$addCount+1
      return ComplexNumber.new(real + other.real , imagno + other.imagno)
    end

    def *(other)
        $multiplyCount=$multiplyCount+1
        return ComplexNumber.new(((real * other.real) - (imagno * other.imagno)), ((imagno * other.real) + (real * other.imagno)))
    end

    def bulk_add(array)
        $bulkaddCount =$bulkaddCount+1
        sum_real = 0
        sum_img = 0
        for item in array 
            sum_real = sum_real + item.real
            sum_img = sum_img + item.imagno
        end
        return  ComplexNumber.new(sum_real,sum_img)
        
    end


    def bulk_multiply(array)
        $bulkMultiplyCount=$bulkMultiplyCount+1
        base = ComplexNumber.new(1,1)
        for item in array 
            base =  base*item        
        end
        return  base
        
    end

    def get_stats​()
        puts $bulkaddType + " ->called " + $bulkaddCount.to_s
        puts $bulkMultiplyType + " ->called " + $bulkMultiplyCount.to_s
        puts $add + " ->called " + $addCount.to_s
        puts $multiply + " ->called " + $multiplyCount.to_s

    end

end
c1=ComplexNumber.new(3,2i)
c2=ComplexNumber.new(1,7i)
c3=c1+c2
puts c3.real
puts c3.imagno
c4=ComplexNumber.new(3,2)
c5=ComplexNumber.new(1,7)
c6=c4*c5
puts c6.real
puts c6.imagno
c8=ComplexNumber.new(3,2i)
c9=ComplexNumber.new(1,7i)
c10=ComplexNumber.new(1,1i)
complexarr = []
complexarr<<c8
complexarr<<c9
complexarr<<c10
sumTotal=c1.bulk_add(complexarr)
puts sumTotal.real
puts sumTotal.imagno
multArray = c1.bulk_multiply(complexarr)
puts multArray.real
puts multArray.imagno
c1.get_stats​()