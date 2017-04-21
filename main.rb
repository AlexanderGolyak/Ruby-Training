class MyClass

  #File.open("file1.txt").map { |line| line.split(', ') }
  attr_accessor :arr, :hae, :file_entered, :file_output

  def initialize
    # @arr = ['bird', 3, 'cat', 1, 'dog', 2.71, :xpath, '2', 'mouse', 3.14, :css, 3, 'horse', '4', 'bird2'
    @arr = Array.new
    @arr1 = []
    @hae = Hash.new
    @file_entered = String.new
    @file_output = String.new
  end

  #Request for input file name.
  # @file_entered = "123"

  def open_f
    puts "Enter name of a file to open:"
    @file_entered = gets.chomp
    # @arr = File.open("#{@file_entered}.txt").map { |line| line.split(', ') }
    @arr = File.open("#{@file_entered}.txt").readlines
    @arr.each do |x|

      if x =~ /'/
        @arr[@arr.index(x)] = x.gsub!(/'/, '')
      elsif x =~ /\d+./
        @arr[@arr.index(x)] = x.to_f
      elsif x =~ /:/
        @arr[@arr.index(x)] = x.gsub!(/:/, '').to_sym
      elsif (x =~ /\d+/) == (x.length)
        @arr[@arr.index(x)] = x.to_i
      end
      end
    @arr[-1]
  end

  #Request for output file name.
  # @file_output = "123"
  def write_f
    puts "Enter name of a file to write in:"
    @file_output = gets.chomp
  end

  #Input file is opened and array is created from info.
  #@arr = File.open("#{@file_entered}.txt").map { |line| line.split(', ') }

  #3a - can return any type, duplicate 4 times after adding output into file
  def check_class(hurray, value)
    File.open("#{@file_output}.txt", 'a').print("#{value}: ")
    hurray.each do |x|
      if x.class.to_s == value
        @arr << x #it will write text into file
      end
    end
    File.open("#{@file_output}.txt", 'a').print("#{@arr1}\n")
  end

  # 4a, b, c, d - returns n-th element, can be cloned into b,c,d with changing index
  def first_elem(hur)
    File.open("blabla.txt", 'a').print("First element of array is #{hur[0]}\n")
  end

  def second_elem(hur)
    File.open("blabla.txt", 'a').print("Second element of array is #{hur[1]}\n")
  end

  def last_elem(hur)
    File.open("blabla.txt", 'a').print("Last element of array is #{hur[-1]}\n")
  end

  def penultimate_elem(hur)
    File.open("blabla.txt", 'a').print("Penultimate element of array is #{hur[-2]}\n")
  end

  #4e - returns last n elements, n value should be negative to work properly
  # !CREATE SCRIPT TO TAKE N VALUE !
  def last_n_elems(hur, n)
    i=n
    File.open("blabla.txt", 'a').print("Last #{n} elements of array are: ")
    while i < 0 do
      # puts hur[i]
      File.open("blabla.txt", 'a').print("#{hur[i]} ")
      i += 1
    end
    File.open("blabla.txt", 'a').print("\n")
  end

  #4f - returns first n elements
  # !CREATE SCRIPT TO TAKE N VALUE !
  def first_n_elems(hur, n)
    i=0
    File.open("blabla.txt", 'a').print("First #{n} elements of array are: ")
    while i <= n do
      File.open("blabla.txt", 'a').print("#{hur[i]} ")
      i += 1
    end
    File.open("blabla.txt", 'a').print("\n")
  end

  #4g - returns elements with indexes from n to k
  def from_nk(hur, n, k)
    File.open("blabla.txt", 'a').print("Elements from #{n} to #{k} of array are: ")
    while n <= k do
      File.open("blabla.txt", 'a').print("#{hur[n]} ")
      n += 1
    end
    File.open("blabla.txt", 'a').print("\n")
  end

  #4k1 - returns every even value
  def even_vals(hur)
    i = 0
    File.open("blabla.txt", 'a').print("Even values of array are: ")
    while i < hur.length do
      if i.even?
        File.open("blabla.txt", 'a').print("#{hur[i]} ")
      end
      i += 1
    end
    File.open("blabla.txt", 'a').print("\n")
  end

  #4k2 - returns every odd value
  def odd_vals(hur)
    i = 0
    File.open("blabla.txt", 'a').print("Odd values of array are: ")
    while i < hur.length do
      if i.odd?
        File.open("blabla.txt", 'a').print("#{hur[i]} ")
      end
      i += 1
    end
    File.open("blabla.txt", 'a').print("\n")
  end

  #5 - creates hash from Array
  def artoh(hur)
    File.open("#{@file_output}.txt", 'a').print("Hash is ")
    b = 0
    hur.each do |x|
      @hae["i#{b}"] = x
      b+=1
    end
    File.open("#{@file_output}.txt", 'a').print("#{@hae}")
    File.open("#{@file_output}.txt", 'a').print("\n")
  end

  def art
    File.open("#{@file_output}.txt", 'a').print("Array is #{@arr}")
  end

end

a = MyClass.new
a.open_f
a.write_f

#a.check_class(a.arr, "Integer")
# a.check_class(a.arr, "Float")
 a.check_class(a.arr, "String")
# a.check_class(a.arr, "Symbol")
# a.first_elem(a.arr)
# a.second_elem(a.arr)
# a.last_elem(a.arr)
# a.penultimate_elem(a.arr)
# a.last_n_elems(a.arr, -3)
# a.first_n_elems(a.arr, 3)
# a.from_nk(a.arr, 3, 5)
# a.even_vals(a.arr)
# a.odd_vals(a.arr)
# puts a.arr
a.artoh(a.arr)
# a.art