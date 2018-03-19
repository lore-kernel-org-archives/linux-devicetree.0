From: Harald Geyer <harald@ccbib.org>
Subject: Re: [PATCHv2 5/5] arm64: allwinner: a64: Add support for TERES-I laptop
Date: Mon, 19 Mar 2018 16:27:36 +0100
Message-ID: <E1exwhF-0000Qw-4g@stardust.g4.wien.funkfeuer.at>
References: <20180315162510.11669-1-harald@ccbib.org> <20180315162510.11669-6-harald@ccbib.org> <20180318202251.5gpv6sblfr4edxmj@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20180318202251.5gpv6sblfr4edxmj@flea>
Content-ID: <1667.1521473255.1@stardust.g4.wien.funkfeuer.at>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <icenowy@aosc.io>, info@olimex.com
List-Id: devicetree@vger.kernel.org

Maxime Ripard writes:
> On Thu, Mar 15, 2018 at 04:25:10PM +0000, Harald Geyer wrote:
> > +	leds {
> > +		compatible = "gpio-leds";
> > +
> > +		capslock {
> > +			label = "leds:green:capslock";
> 
> The first part is supposed to be the name of the boards. I did sed
> s/leds/teres-i/, and applied,

I'm not sure what good this convention would do, if anything it seems
to make it harder to write portable scripts, but in the end I don't care.

> together with all the patches but the
> PWM (so I had to drop the backlight node as well).
>
> Please coordinate with Andre about who should send the PWM support.

Seems the patch got broken because only the backlight node but not the
pwm node was removed. Anyway, since Andre has already sent an updated
version of his series, maybe just revert the broken patch, merge his
series and then apply the original teres-i patch again?

I'm going to test his patches soon, but I don't expect any problems.

Thanks,
Harald
