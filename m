From: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 3/7] ARM: dts: imx: Add Advantech BA-16 Qseven module
Date: Wed, 2 Dec 2015 15:53:16 -0500
Message-ID: <565F5A3C.6080509@timesys.com>
References: <1449080180-31945-1-git-send-email-akshay.bhat@timesys.com>
 <1449080180-31945-4-git-send-email-akshay.bhat@timesys.com>
 <1647955.6yZUflBPcH@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1647955.6yZUflBPcH@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Martin Donnelly <martin.donnelly-JJi787mZWgc@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 12/02/2015 02:36 PM, Arnd Bergmann wrote:
> On Wednesday 02 December 2015 13:16:16 Akshay Bhat wrote:
>> +               brightness-levels = <  0   1   2   3   4   5   6   7   8   9
>> +                                     10  11  12  13  14  15  16  17  18  19
>> +                                     20  21  22  23  24  25  26  27  28  29
>> +                                     30  31  32  33  34  35  36  37  38  39
>> +                                     40  41  42  43  44  45  46  47  48  49
>> +                                     50  51  52  53  54  55  56  57  58  59
>> +                                     60  61  62  63  64  65  66  67  68  69
>> +                                     70  71  72  73  74  75  76  77  78  79
>> +                                     80  81  82  83  84  85  86  87  88  89
>> +                                     90  91  92  93  94  95  96  97  98  99
>> +                                    100 101 102 103 104 105 106 107 108 109
>> +                                    110 111 112 113 114 115 116 117 118 119
>> +                                    120 121 122 123 124 125 126 127 128 129
>> +                                    130 131 132 133 134 135 136 137 138 139
>> +                                    140 141 142 143 144 145 146 147 148 149
>> +                                    150 151 152 153 154 155 156 157 158 159
>> +                                    160 161 162 163 164 165 166 167 168 169
>> +                                    170 171 172 173 174 175 176 177 178 179
>> +                                    180 181 182 183 184 185 186 187 188 189
>> +                                    190 191 192 193 194 195 196 197 198 199
>> +                                    200 201 202 203 204 205 206 207 208 209
>> +                                    210 211 212 213 214 215 216 217 218 219
>> +                                    220 221 222 223 224 225 226 227 228 229
>> +                                    230 231 232 233 234 235 236 237 238 239
>> +                                    240 241 242 243 244 245 246 247 248 249
>> +                                    250 251 252 253 254 255>;
>>
>
> That is a lot of brightness levels. Why do you need so many of them?
>
> 	Arnd
>
Hi Arnd,

The product allows for a fine grained selection of the LCD brightness 
(analogy might be a laptop brightness slider), hence all possible levels 
have been included.

Thanks,
Akshay
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
