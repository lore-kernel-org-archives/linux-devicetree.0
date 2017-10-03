From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 1/2] pinctrl: rza1: add support for RZ/A1L
Date: Tue, 3 Oct 2017 18:17:38 +0200
Message-ID: <20171003161738.GK4037@w540>
References: <20171003073334.18917-1-chris.brandt@renesas.com>
 <20171003073334.18917-2-chris.brandt@renesas.com>
 <20171003083148.GG4037@w540>
 <SG2PR06MB1165EE1D21AFC1D3005308538A720@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20171003150412.GI4037@w540>
 <SG2PR06MB1165669027CDC7F76808EADB8A720@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB1165669027CDC7F76808EADB8A720@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Tue, Oct 03, 2017 at 03:40:51PM +0000, Chris Brandt wrote:
> Hi Jacopo,
>
>
> Yes, that 'are' listed in the table. But for a good reason.
>
> The TIOC pins can be uses as an output (PWM for example) or as a input
> (input capture for example), so they are not really a fixed direction.
> That is why the user needs to specify how they plan to use them in the DT.
> And...that's also why it doesn't make sense to put them in the
> rza1l_swio_pins[] array (we have no idea how they want to use them).
>
> So, the hardware manual has the TIOC pins in the SWIO table to tell the
> user 'hey, you have to manually set these pins to either input or output
> yourself because we can't magically know what you want to use them for.
>
> But...
> The reason for the rza1l_swio_pins[] array is for weird pin
> configurations that are fixed (like LCD LVDS output pins need to be configured as
> inputs).
>
>
> > Thanks for double checking. Your source from Japan is more
> > authoritative than manuals and defintely more accurate than me ;)
>
> So, after all that, I don't think we found any issues with my patch.
> Correct???

Correct! :)
After your clarification above, for both patches:

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

>
>
> Thanks!
>
> Chris
>
