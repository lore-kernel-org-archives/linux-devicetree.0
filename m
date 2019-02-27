From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 2/3] watchdog: orion: don't enable rstout if an interrupt
 is configured
Date: Wed, 27 Feb 2019 20:59:07 +0000
Message-ID: <636717314b294a5f9a4ed1ffa44625c4@svr-chch-ex1.atlnz.lc>
References: <20171011022958.31268-1-chris.packham@alliedtelesis.co.nz>
 <20171011022958.31268-3-chris.packham@alliedtelesis.co.nz>
 <227eed69-c4c8-01a1-3c6b-6cf95e84a9cd@roeck-us.net>
 <4f82b24c3b244d3eba0f8de8cb25049f@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, "wim@iguana.be" <wim@iguana.be>, "gregory.clement@free-electrons.com" <gregory.clement@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hijacking an old thread,=0A=
=0A=
On 11/10/17 5:30 PM, Chris Packham wrote:=0A=
> On 11/10/17 16:42, Guenter Roeck wrote:=0A=
>> On 10/10/2017 07:29 PM, Chris Packham wrote:=0A=
>>> The orion_wdt_irq invokes panic() so we are going to reset the CPU=0A=
>>> regardless.  By not setting this bit we get a chance to gather debug=0A=
>>> from the panic output before the system is reset.=0A=
>>>=0A=
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>>=0A=
>> Unless I am missing something, this assumes that the interrupt is=0A=
>> handled, ie that the system is not stuck with interrupts disabled.=0A=
>> This makes the watchdog less reliable. This added verbosity comes=0A=
>> at a significant cost. I'd like to get input from others if this=0A=
>> is acceptable.=0A=
>>=0A=
>> That would be different if there was a means to configure a pretimeout,=
=0A=
>> ie a means to tell the system to generate an irq first, followed by a=0A=
>> hard reset if the interrupt is not served. that does not seem to be=0A=
>> the case here, though.=0A=
>>=0A=
> =0A=
> As far as I can tell there is no pretimeout capability in the orion=0A=
> /armada WDT. I have got a work-in-progress patch that enables the RSTOUT=
=0A=
> in the interrupt handler which some-what mitigates your concern but=0A=
> still requires the interrupt to be handled at least once.=0A=
> =0A=
> Another option would be to use one of the spare global timers to provide=
=0A=
> the interrupt-driven aspect.=0A=
=0A=
So as Guenter rightly pointed out my original patch meant that we'd hang =
=0A=
if we got stuck in a loop with interrupts disabled. Shortly after that =0A=
that's exactly what happened on my test setup.=0A=
=0A=
I've now been able to follow-up on the idea of using one of the spare =0A=
global timers as a pretimeout indication and it's looking pretty =0A=
promising. The patch is below (beware MUA wrapping). I'll submit it =0A=
properly but I'm wondering if I should add the timer1 based watchdog as =0A=
a separate watchdog device or like I have below roll it into the =0A=
existing watchdog device.=0A=
=0A=
--- 8< ---=0A=
diff --git a/arch/arm/boot/dts/armada-38x.dtsi =0A=
b/arch/arm/boot/dts/armada-38x.dtsi=0A=
index 8530d3594ca2..abd45adb4728 100644=0A=
--- a/arch/arm/boot/dts/armada-38x.dtsi=0A=
+++ b/arch/arm/boot/dts/armada-38x.dtsi=0A=
@@ -421,6 +421,7 @@=0A=
                                 reg =3D <0x20300 0x34>, <0x20704 0x4>, =0A=
<0x18260 0x4>;=0A=
                                 clocks =3D <&coreclk 2>, <&refclk>;=0A=
                                 clock-names =3D "nbclk", "fixed";=0A=
+                               interrupts-extended =3D <&gic GIC_SPI 9 =0A=
IRQ_TYPE_LEVEL_HIGH>;=0A=
                         };=0A=
=0A=
                         cpurst: cpurst@20800 {=0A=
diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c=0A=
index c6b8f4a43bde..89eae53b1b17 100644=0A=
--- a/drivers/watchdog/orion_wdt.c=0A=
+++ b/drivers/watchdog/orion_wdt.c=0A=
@@ -37,13 +37,16 @@=0A=
  #define TIMER_CTRL             0x0000=0A=
  #define TIMER_A370_STATUS      0x04=0A=
=0A=
+#define TIMER1_RELOAD_OFF      0x0018=0A=
+#define TIMER1_VAL_OFF         0x001c=0A=
+=0A=
  #define WDT_MAX_CYCLE_COUNT    0xffffffff=0A=
=0A=
  #define WDT_A370_RATIO_MASK(v) ((v) << 16)=0A=
  #define WDT_A370_RATIO_SHIFT   5 =0A=
 =0A=
 =0A=
=0A=
  #define WDT_A370_RATIO         (1 << WDT_A370_RATIO_SHIFT) =0A=
 =0A=
 =0A=
=0A=
 =0A=
 =0A=
 =0A=
=0A=
-#define WDT_AXP_FIXED_ENABLE_BIT BIT(10) =0A=
 =0A=
 =0A=
=0A=
+#define WDT_AXP_FIXED_ENABLE_BIT BIT(10) | BIT(12) =0A=
 =0A=
 =0A=
=0A=
  #define WDT_A370_EXPIRED       BIT(31) =0A=
 =0A=
 =0A=
=0A=
 =0A=
 =0A=
 =0A=
=0A=
  static bool nowayout =3D WATCHDOG_NOWAYOUT; =0A=
 =0A=
 =0A=
=0A=
@@ -183,6 +186,9 @@ static int orion_wdt_ping(struct watchdog_device =0A=
*wdt_dev) =0A=
 =0A=
=0A=
         /* Reload watchdog duration */ =0A=
 =0A=
 =0A=
=0A=
         writel(dev->clk_rate * wdt_dev->timeout, =0A=
 =0A=
 =0A=
=0A=
                dev->reg + dev->data->wdt_counter_offset); =0A=
 =0A=
 =0A=
=0A=
+       writel(dev->clk_rate * (wdt_dev->timeout/2), =0A=
 =0A=
 =0A=
=0A=
+              dev->reg + TIMER1_VAL_OFF); =0A=
 =0A=
 =0A=
=0A=
+ =0A=
 =0A=
 =0A=
=0A=
         return 0; =0A=
 =0A=
 =0A=
=0A=
  } =0A=
 =0A=
 =0A=
=0A=
 =0A=
 =0A=
 =0A=
=0A=
@@ -194,6 +200,8 @@ static int armada375_start(struct watchdog_device =0A=
*wdt_dev) =0A=
 =0A=
=0A=
         /* Set watchdog duration */ =0A=
 =0A=
 =0A=
=0A=
         writel(dev->clk_rate * wdt_dev->timeout, =0A=
 =0A=
 =0A=
=0A=
                dev->reg + dev->data->wdt_counter_offset); =0A=
 =0A=
 =0A=
=0A=
+       writel(dev->clk_rate * (wdt_dev->timeout/2), =0A=
 =0A=
 =0A=
=0A=
+              dev->reg + TIMER1_VAL_OFF); =0A=
 =0A=
 =0A=
=0A=
 =0A=
 =0A=
 =0A=
=0A=
         /* Clear the watchdog expiration bit */ =0A=
 =0A=
 =0A=
=0A=
         atomic_io_modify(dev->reg + TIMER_A370_STATUS, =0A=
WDT_A370_EXPIRED, 0); =0A=
 =0A=
=0A=
@@ -443,7 +451,7 @@ static const struct orion_watchdog_data =0A=
armada375_data =3D { =0A=
 =0A=
=0A=
  static const struct orion_watchdog_data armada380_data =3D { =0A=
 =0A=
 =0A=
=0A=
         .rstout_enable_bit =3D BIT(8), =0A=
 =0A=
 =0A=
=0A=
         .rstout_mask_bit =3D BIT(10), =0A=
 =0A=
 =0A=
=0A=
-       .wdt_enable_bit =3D BIT(8), =0A=
 =0A=
 =0A=
=0A=
+       .wdt_enable_bit =3D BIT(8) | BIT(2), =0A=
 =0A=
 =0A=
=0A=
         .wdt_counter_offset =3D 0x34, =0A=
 =0A=
 =0A=
=0A=
         .clock_init =3D armadaxp_wdt_clock_init, =0A=
 =0A=
 =0A=
=0A=
         .enabled =3D armada375_enabled,=0A=
--- 8< ---=0A=
=0A=
> =0A=
> Of course if the irq isn't specified then the existing behaviour is=0A=
> retained which would make the 3/3 patch of this series the debatable part=
.=0A=
> =0A=
> =0A=
>> Guenter=0A=
>>=0A=
>>> ---=0A=
>>>     drivers/watchdog/orion_wdt.c | 25 +++++++++++++++++--------=0A=
>>>     1 file changed, 17 insertions(+), 8 deletions(-)=0A=
>>>=0A=
>>> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.=
c=0A=
>>> index ea676d233e1e..ce88f339ef7f 100644=0A=
>>> --- a/drivers/watchdog/orion_wdt.c=0A=
>>> +++ b/drivers/watchdog/orion_wdt.c=0A=
>>> @@ -71,6 +71,7 @@ struct orion_watchdog {=0A=
>>>     	unsigned long clk_rate;=0A=
>>>     	struct clk *clk;=0A=
>>>     	const struct orion_watchdog_data *data;=0A=
>>> +	int irq;=0A=
>>>     };=0A=
>>>     =0A=
>>>     static int orion_wdt_clock_init(struct platform_device *pdev,=0A=
>>> @@ -203,9 +204,11 @@ static int armada375_start(struct watchdog_device =
*wdt_dev)=0A=
>>>     						dev->data->wdt_enable_bit);=0A=
>>>     =0A=
>>>     	/* Enable reset on watchdog */=0A=
>>> -	reg =3D readl(dev->rstout);=0A=
>>> -	reg |=3D dev->data->rstout_enable_bit;=0A=
>>> -	writel(reg, dev->rstout);=0A=
>>> +	if (!dev->irq) {=0A=
>>> +		reg =3D readl(dev->rstout);=0A=
>>> +		reg |=3D dev->data->rstout_enable_bit;=0A=
>>> +		writel(reg, dev->rstout);=0A=
>>> +	}=0A=
>>>     =0A=
>>>     	atomic_io_modify(dev->rstout_mask, dev->data->rstout_mask_bit, 0);=
=0A=
>>>     	return 0;=0A=
>>> @@ -228,9 +231,12 @@ static int armada370_start(struct watchdog_device =
*wdt_dev)=0A=
>>>     						dev->data->wdt_enable_bit);=0A=
>>>     =0A=
>>>     	/* Enable reset on watchdog */=0A=
>>> -	reg =3D readl(dev->rstout);=0A=
>>> -	reg |=3D dev->data->rstout_enable_bit;=0A=
>>> -	writel(reg, dev->rstout);=0A=
>>> +	if (!dev->irq) {=0A=
>>> +		reg =3D readl(dev->rstout);=0A=
>>> +		reg |=3D dev->data->rstout_enable_bit;=0A=
>>> +		writel(reg, dev->rstout);=0A=
>>> +	}=0A=
>>> +=0A=
>>>     	return 0;=0A=
>>>     }=0A=
>>>     =0A=
>>> @@ -247,8 +253,9 @@ static int orion_start(struct watchdog_device *wdt_=
dev)=0A=
>>>     						dev->data->wdt_enable_bit);=0A=
>>>     =0A=
>>>     	/* Enable reset on watchdog */=0A=
>>> -	atomic_io_modify(dev->rstout, dev->data->rstout_enable_bit,=0A=
>>> -				      dev->data->rstout_enable_bit);=0A=
>>> +	if (!dev->irq)=0A=
>>> +		atomic_io_modify(dev->rstout, dev->data->rstout_enable_bit,=0A=
>>> +					      dev->data->rstout_enable_bit);=0A=
>>>     =0A=
>>>     	return 0;=0A=
>>>     }=0A=
>>> @@ -595,6 +602,8 @@ static int orion_wdt_probe(struct platform_device *=
pdev)=0A=
>>>     			dev_err(&pdev->dev, "failed to request IRQ\n");=0A=
>>>     			goto disable_clk;=0A=
>>>     		}=0A=
>>> +=0A=
>>> +		dev->irq =3D irq;=0A=
>>>     	}=0A=
>>>     =0A=
>>>     	watchdog_set_nowayout(&dev->wdt, nowayout);=0A=
>>>=0A=
>>=0A=
>>=0A=
> =0A=
> =0A=
=0A=
