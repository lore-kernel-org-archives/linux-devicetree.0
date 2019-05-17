From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH 1/1] arm64: dts: marvell: mcbin: enlarge PCI memory window
Date: Fri, 17 May 2019 23:26:10 +0200
Message-ID: <87h89szsb1.fsf@FE-laptop>
References: <20190517161123.9293-1-xypron.glpk@gmx.de> <87k1eozvxb.fsf@FE-laptop> <f633e7d1-264b-8a17-7bc0-452ab38883af@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f633e7d1-264b-8a17-7bc0-452ab38883af@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org


> On 5/17/19 10:08 PM, Gregory CLEMENT wrote:
>> Hi Heinrich Schuchardt,
>>
>>> Running a graphics adapter on the MACCHIATObin fails due to an
>>> insufficently sized memory window.
>> I think "insufficient" is enough or I miss something.
>
> Thanks for reviewing. Do I have to resend with corrected wording?

Actually I was said that using an adverbe was the thing to do, so I've
just fix the typo by adding the missing "i". you don't have to resend
it.

>
>>
>>>
>>> Enlarge the memory window for the PCIe slot to 512 MiB.
>>>
>>> With the patch I am able to use a GT710 graphics adapter with 1 GB onboard
>>> memory.
>>>
>>> These are the mapped memory areas that the graphics adapter is actually
>>> using:
>>>
>>> Region 0: Memory at cc000000 (32-bit, non-prefetchable) [size=16M]
>>> Region 1: Memory at c0000000 (64-bit, prefetchable) [size=128M]
>>> Region 3: Memory at c8000000 (64-bit, prefetchable) [size=32M]
>>> Region 5: I/O ports at 1000 [size=128]
>>> Expansion ROM at ca000000 [disabled] [size=512K]
>>
>>>From my point of view this patch is correct, I don't think it is a
>> problem to map more memory. So I applied on it mvebu/dt64.
>>
>
> To which repository are your referring?

I thought it was documented in the MAINTAINER file but I was wrong, so I
will fix it.

I referred to git://git.infradead.org/linux-mvebu.git

this branch will be merged in our for-next branch when 5.2-rc1 will be
released, so it will be part of linux-next.

Gregory

>
> Best regards
>
> Heinrich
>
>> But I add also Thomas in CC who know better the PCIe support on mvebu/
>>
>> Thanks,
>>
>> Gregory
>>
>>
>>>
>>> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>>> ---
>>>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
>>> index 329f8ceeebea..205071b45a32 100644
>>> --- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
>>> +++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
>>> @@ -184,6 +184,8 @@
>>>  	num-lanes = <4>;
>>>  	num-viewport = <8>;
>>>  	reset-gpios = <&cp0_gpio2 20 GPIO_ACTIVE_LOW>;
>>> +	ranges = <0x81000000 0x0 0xf9010000 0x0 0xf9010000 0x0 0x10000
>>> +		  0x82000000 0x0 0xc0000000 0x0 0xc0000000 0x0 0x20000000>;
>>>  	status = "okay";
>>>  };
>>>
>>> --
>>> 2.20.1
>>>
>>
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
