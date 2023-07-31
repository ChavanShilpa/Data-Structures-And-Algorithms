# https://leetcode.com/problems/longest-repeating-character-replacement/description/
# TC - O(n)
# sc - O(n)
# s = "ABAB" k = 2 output = 4

def character_replacement(s, k)
    return 0 if s.length == 0 || s.length == 1
    res, l = 0, 0

    longest_str = Hash.new(0)
    chars_str = s.chars
    (0...chars_str.length).each do |r|
        longest_str[chars_str[r]] += 1 
        while (r-l+1) - longest_str.values.max > k
            longest_str[chars_str[l]] -= 1 
            l += 1
        end
        res = [res, r-l+1].max
    end
    res
end
