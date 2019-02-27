Return-Path: <SRS0=OE9M=RC=linux.intel.com=jarkko.nikula@kernel.org>
Subject: Re: [PATCH v4 1/2] dt: snps,designware-i2c: Add clock bindings
 documentation
References: <1550765459-14519-1-git-send-email-gareth.williams.jx@renesas.com>
 <1550765459-14519-2-git-send-email-gareth.williams.jx@renesas.com>
 <de2a72f3-6d2c-cc18-73f3-1e925bd5b88f@linux.intel.com>
 <20190226153921.GC839@kunai>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <8ad4aca6-cdbd-d2bf-81e2-5e2cd04a05c0@linux.intel.com>
Date: Wed, 27 Feb 2019 09:10:14 +0200
MIME-Version: 1.0
In-Reply-To: <20190226153921.GC839@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Gareth Williams <gareth.williams.jx@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Phil Edworthy <phil.edworthy@renesas.com>, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Luis Oliveira <Luis.Oliveira@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

On 2/26/19 5:39 PM, Wolfram Sang wrote:
> 
>>> + - clock-names : Contains the names of the clocks:
>>> +    "ic_clk", for the core clock used to generate the external I2C clock.
>>> +    "pclk", the peripheral clock, required for register accesses.
>>> +
>>
>> Actually it looks there is need to revert back to bus clock (or better) in
>> comments but keep the "pclk" property.
>>
>> The specification I have tells the ic_clk is the peripheral clock which runs
>> the logic and the pclk (exactly pclk) is for bus interface and where
>> registers are.
> 
> Can we make it "bus interface clock" then? I'd think this is a tad
> better.
> 
Yes, that makes it clear. Plain "interface clock" might work too. TI 
OMAPs are using that term for register access clock domains.

Luis: Does that make sense for HW point of view? You mention PCLK is 
called also as application clock but for me personally it is not as 
clear as interface clock when I see it. I'll let Luis have the final 
word here.

ic_clk - peripheral clock
pclk - (bus) interface/application clock

-- 
Jarkko
