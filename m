From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v9 4/4] ARM: dts: rockchip: add suspend settings for rk3288-evb-rk808
Date: Wed, 26 Nov 2014 14:52:35 -0800
Message-ID: <CAD=FV=V29zCpcEHE+rq6q_6SOZ_NOJgc5FiwmJ9jnRZK4mMUhw@mail.gmail.com>
References: <1416900743-29204-1-git-send-email-zyw@rock-chips.com>
	<1416900743-29204-5-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416900743-29204-5-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Chris,

On Mon, Nov 24, 2014 at 11:32 PM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>                         vcc_ddr: DCDC_REG3 {
>                                 regulator-always-on;
>                                 regulator-boot-on;
>                                 regulator-name = "vcc_ddr";
> +                               regulator-suspend-mem-enabled;

The "regulator-suspend-mem-enabled" is not an upstream property and
isn't doing anything.  It should be removed.

Possibly this is something Heiko could do when applying  (depends on
what he wants) if no other spins are required.
>                         vcc_18: LDO_REG7 {
> @@ -128,6 +163,11 @@
>                                 regulator-min-microvolt = <1800000>;
>                                 regulator-max-microvolt = <1800000>;
>                                 regulator-name = "vcc_18";
> +                               regulator-suspend-mem-microvolt = <1800000>;

Another non-upstream property: regulator-suspend-mem-microvolt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
