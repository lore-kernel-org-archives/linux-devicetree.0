From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 0/4] vf610-zii-dev updates
Date: Sun, 24 Dec 2017 19:47:47 +0100
Message-ID: <4759bf30f0702720160481440f65c862@agner.ch>
References: <20171220231108.GJ10595@n2100.armlinux.org.uk>
 <20171222141627.GP10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171222141627.GP10595-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-12-22 15:16, Russell King - ARM Linux wrote:
> On Wed, Dec 20, 2017 at 11:11:08PM +0000, Russell King - ARM Linux wrote:
>> Hi,
>>
>> These patches update the DT for the ZII VF610 boards.
>>
>> The first patch fixes complaints at boot about missing DMAs on rev C
>> boards, particularly for the SPI interface.  This is because edma1 is
>> not enabled.  This seems to be a regression from the 4.10 era.
>>
>> The second patch fixes an interrupt storm during boot on rev B boards,
>> which causes boot to take 80+ seconds - this seems to be a long
>> standing issue since the DT description was first added.  The PTB28
>> pin is definitely GPIO 98, and GPIO 98 is definitely part of the
>> gpio3 block, not the gpio2 block.  Since GPIO 66 (which is the
>> corresponding GPIO in gpio2) is low, and the IRQ trigger is level-low,
>> this causes an interrupt storm.
>>
>> The last two patches add an explicit description of the PHYs that are
>> actually connected to the switch - the 88e1545 is a quad PHY, and
>> without describing the MDIO bus, DSA assumes that any PHYs it can
>> discover are present for the switch.  As only the first three PHYs
>> are connected, this leads the 4th port to believe it is connected to
>> the 4th PHY when the fixed-link definition is (eventually) removed.
>>
>> Head this off by providing the proper descriptions, and as we have
>> them, also describe the interrupts for these PHYs.
>>
>> Note, however, that the interrupt description is not quite correct -
>> the 88e1545 PHYs all share one interrupt line, and there is a register
>> in the PHY which can be used to demux the interrupt to the specific
>> PHY.  However, in this description, we ignore the demux register, and
>> just share the interrupt between the PHYs.  That much is fine, but
>> the pinmuxing becomes problematical - if we describe the same pinmux
>> settings for each PHY for the interrupt line, the 2nd/3rd PHYs fail.
>> This has no known solution.  Suggestions welcome.
>>
>>  arch/arm/boot/dts/vf610-zii-dev-rev-b.dts | 34 ++++++++++++++++++++++++++++++-
>>  arch/arm/boot/dts/vf610-zii-dev.dtsi      |  4 ++++
>>  2 files changed, 37 insertions(+), 1 deletion(-)
> 
> There's more stuff that isn't correct in the Vybrid DTS files...
> 
> When the SoC was first added, the vfxxx.dtsi had:
> 
> +                       adc0: adc@4003b000 {
> ...
> +                               status = "disabled";
> +                       };
> +                       adc1: adc@400bb000 {
> ...
> +                               status = "disabled";
> +                       };
> 
> This default status remains today.
> 
> IIO hwmon support was added later:
> 
> +               iio-hwmon {
> +                       compatible = "iio-hwmon";
> +                       io-channels = <&adc0 16>, <&adc1 16>;
> +               };
> 
> which is all fine and dandy, but iio-hwmon fails to probe unless it can
> find _all_ the io-channels specified.
> 
> Given that the two ADC channels referenced by iio-hwmon default to being
> disabled, it makes no sense for iio-hwmon to default to being enabled.
> 
> What's more is that if, say, adc0 is enabled by a board, the iio-hwmon
> device still fails to be probed because it fails to get adc1.
> 
> As I see it, there's two possible solutions to this:
> 1. remove the default disabled status of the ADCs so both are always
>    available, or
> 2. default iio-hwmon to disabled, and provide a label for this device
>    so that a correct io-channels specification can be suppled for the
>    board in question, and for iio-hwmon to be enabled where appropriate.

I prefer solution 2. Some Vybrid SoC include a Cortex-M4 core which
might access the ADCs too. In that case, the Linux device tree should
have them disabled.

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
