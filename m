From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: phandle entries will be applied sequentially
Date: Wed, 9 Oct 2013 16:14:15 +0200
Message-ID: <CACRpkdaZra5HASUzL4uUb-xgCY665SQmDMHmxrDQzuNDy=mBbQ@mail.gmail.com>
References: <1381297324-19006-1-git-send-email-shawn.guo@linaro.org>
	<CACRpkdazPK6SNg9PdWCrjB8nwho1rCueumJWAN=STXdN1zNnMA@mail.gmail.com>
	<20131009124425.GG25034@n2100.arm.linux.org.uk>
	<CACRpkda3J4cCTnFaQFrmZ=box6EeJ8WQZpuQpi2p_BFX+W2vuw@mail.gmail.com>
	<20131009134529.GH25034@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131009134529.GH25034-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 9, 2013 at 3:45 PM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:

> Right, so that means doing this:
>
>                         pinctrl_usdhc1_1: usdhc1grp-1 {
>                                 fsl,pins = <
> ...
>                                         MX6QDL_PAD_SD1_DAT3__SD1_DATA3 0x17059
> ...
>                                 >;
>                         };
>
>                         pinctrl_usdhc1_1_dat3cd: usdhc1grp-3 {
>                                 fsl,pins = <
>                                         MX6QDL_PAD_SD1_DAT3__SD1_DATA3 0x13059
>                                 >;
>                         };
>
> and then:
>
>         pinctrl-0 = <&pinctrl_usdhc1_1 &pinctrl_usdhc1_1_dat3cd>;
>
> can result in either "MX6QDL_PAD_SD1_DAT3__SD1_DATA3 0x17059" or
> "MX6QDL_PAD_SD1_DAT3__SD1_DATA3 0x13059" being the final configuration
> for that pin.

I'm uncertain about the device tree case. I guess it is indeed
an array of handles indexed [0,1], the framework will only
send that array down to the driver, no strings attached.

> What that means is that for any pinctrl setting, pins to be configured
> must be mentioned exactly once and once only.

Either that (and the above does seem very ambigous) or the driver
need to combine and handle the conflicting configurations,
maintaining a state for the pin and so on ...

This seems like two *complete* configs fighting over the same pin
rather than two complementary configs that we could | together
and write, and that is indeed ambigous. The array passed to
the config function is supposed to be individual settings like
[ pull-up, schmitt-trigger ] not two complete sets of config.

The generic pin config binding is luckily  more clear than this
i.MX-specific handling.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
