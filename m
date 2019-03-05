From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 2/2] watchdog: orion_wdt: use timer1 as a pretimeout
Date: Tue, 5 Mar 2019 01:26:08 +0000
Message-ID: <5605e7b7a0f540a7908a1eb5191bbe5e@svr-chch-ex1.atlnz.lc>
References: <20190227230707.GA28635@roeck-us.net>
 <20190304225152.26831-1-chris.packham@alliedtelesis.co.nz>
 <20190304225152.26831-3-chris.packham@alliedtelesis.co.nz>
 <20190305005710.GL26378@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "linux@roeck-us.net" <linux@roeck-us.net>, "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 5/03/19 1:57 PM, Andrew Lunn wrote:=0A=
> On Tue, Mar 05, 2019 at 11:51:52AM +1300, Chris Packham wrote:=0A=
>> The orion watchdog can either reset the CPU or generate an interrupt.=0A=
>> The interrupt would be useful for debugging as it provides panic()=0A=
>> output about the watchdog expiry, however if the interrupt is used the=
=0A=
>> watchdog can't reset the CPU in the event of being stuck in a loop with=
=0A=
>> interrupts disabled or if the CPU is prevented from accessing memory=0A=
>> (e.g. an unterminated DMA).=0A=
>>=0A=
>> All of the orion based CPU cores (at least back as far as Kirkwood) have=
=0A=
>> spare timers that aren't currently used by the Linux kernel.=0A=
=0A=
Actually this appears to be incorrect Kirkwood does configure timer1 as =0A=
a clockevent timer. So I can't just grab timer1 for all platforms.=0A=
=0A=
>> We can use=0A=
>> timer1 to provide a pre-timeout ahead of the watchdog timer and provide=
=0A=
>> the possibility of gathering debug before the reset triggers.=0A=
> =0A=
> Hi Chris=0A=
> =0A=
> I had a quick look at other drivers implementing pre-timeout. They=0A=
> seem to call watchdog_notify_pretimeout(). I don't see that here? What=0A=
> happens when timer1 fires?=0A=
> =0A=
=0A=
It invokes the regular orion_wdt_irq(). On Armada-385 prior to this =0A=
change the irq was not specified because the reset always kicked in so =0A=
there was no point.=0A=
=0A=
For correctness I could make the devicetree binding specify 2 =0A=
interrupts. One for the regular watchdog interrupt (which would never =0A=
usually get hit because the reset would kick in) and one for the =0A=
pretimeout/timer1.=0A=
=0A=
>> @@ -169,38 +174,46 @@ static int armadaxp_wdt_clock_init(struct platform=
_device *pdev,=0A=
>>   	}=0A=
>>   =0A=
>>   	/* Enable the fixed watchdog clock input */=0A=
>> -	atomic_io_modify(dev->reg + TIMER_CTRL,=0A=
>> -			 WDT_AXP_FIXED_ENABLE_BIT,=0A=
>> -			 WDT_AXP_FIXED_ENABLE_BIT);=0A=
>> +	val =3D WDT_AXP_FIXED_ENABLE_BIT | TIMER1_FIXED_ENABLE_BIT;=0A=
>> +	atomic_io_modify(dev->reg + TIMER_CTRL, val, val);=0A=
>>   =0A=
>>   	dev->clk_rate =3D clk_get_rate(dev->clk);=0A=
>> +=0A=
>> +=0A=
> =0A=
> One blank line is sufficient,=0A=
> =0A=
> =0A=
>>   	return 0;=0A=
>>   }=0A=
> =0A=
>     Andrew=0A=
> =0A=
=0A=
