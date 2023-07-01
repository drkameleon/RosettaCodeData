   5 10$(#~ achilles) 1+i.10000  NB. first 50 achilles numbers
  72  108  200  288  392  432  500  648  675  800
 864  968  972 1125 1152 1323 1352 1372 1568 1800
1944 2000 2312 2592 2700 2888 3087 3200 3267 3456
3528 3872 3888 4000 4232 4500 4563 4608 5000 5292
5324 5400 5408 5488 6075 6125 6272 6728 6912 7200

   20{.(#~ strong * achilles) 1+i.100000 NB. first twenty strong achilles numbers
500 864 1944 2000 2592 3456 5000 10125 10368 12348 12500 16875 19652 19773 30375 31104 32000 33275 37044 40500

   +/achilles (+i.)/1 9*10^<:2  NB. count of two digit achilles numbers
1
   +/achilles (+i.)/1 9*10^<:3
12
   +/achilles (+i.)/1 9*10^<:4
47
   +/achilles (+i.)/1 9*10^<:5
192
   +/achilles (+i.)/1 9*10^<:6
664