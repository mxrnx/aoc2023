$numbers = {
	"two" => "2",
	"one" => "1",
	"three" => "3",
	"four" => "4",
	"five" => "5",
	"six" => "6",
	"seven" => "7",
	"eight" => "8",
	"nine" => "9"
}

def foo(line, reverse)
	firstIndex = 999999
	firstNumber = "0"
	$numbers.each { |k, v|
		i = line.index(if reverse then k.reverse else k end)
		if !i.nil? && i < firstIndex then
			firstIndex = i
			firstNumber = v
		end
	}
	firstDigitIndex = line.index(/\d/)
	if firstDigitIndex < firstIndex
		line[firstDigitIndex]
	else
		firstNumber
	end
end

puts File.readlines('input/01A.txt', chomp: true).map { |line|
	first = foo(line, false)
	last = foo(line.reverse, true)
	(first + last).to_i
}.sum

