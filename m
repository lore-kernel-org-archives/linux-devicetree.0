From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 05/12] Document: dt: binding: imx: update pinctrl doc
 for imx6sll
Date: Wed, 11 Jan 2017 15:33:12 +0100
Message-ID: <CACRpkdYTpEHyzBY-mA4YUsj=xt46Pibka3-4VHwUXosfgbgp1Q@mail.gmail.com>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
 <1482832070-22668-6-git-send-email-ping.bai@nxp.com> <CACRpkdYUME8K+JusA0ORRKqxyBuhDdyei8eg7UZbHidKw9=bQw@mail.gmail.com>
 <AM3PR04MB5304992095753B761E66A9A87640@AM3PR04MB530.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AM3PR04MB5304992095753B761E66A9A87640-f56W/S9L6NRDGcFijYBXZgfhPeD8jYilXA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacky Bai <ping.bai-3arQi8VN3Tc@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "jacky.baip-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jacky.baip-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 9, 2017 at 3:32 AM, Jacky Bai <ping.bai-3arQi8VN3Tc@public.gmane.org> wrote:

> I have look into the above commit on using generic binding. But I think the generic pinconf
> is not very easy to add in imx pinctrl Driver. imx pinctrl use a different way to parse the pin configure.

OK atleast I need an indication from one of the i.MX maintainers how they
want to proceed.

> Each fsl,pin entry  looks like <PIN_FUNC_ID  CONFIG> in dts, the CONFIG is the pad setting value like
> pull-up, open-drain, drive strength etc. The above config bit definition is specific to each SOC in the PAD CTL register.
>
> If we want set the pin config to enable hysteresis, 47KOhm Pull Up, 50Mhz speed, 80Ohm driver strength
> and Fast Slew Rate, then the CONFIG value should be 0x17059( ORs corresponding bit definition).

Hysteresis is an input property and does not make sense on something
that need drive
strength and slew rate configuration which are output properties.
(I guess you mean 80mA drive strength.)

Actually such oxymoronic settings is a good reason to migrate to
generic bindings
because when you describe stuff with generic strings you see better
what is going
on, and we can add sanity checks to cases like this in the generic code where it
would indeed be valid to ask why this combination of settings is being made.

> This value will be set in
> PAD CTL register to config the corresponding pin.

Yes? That is common. It looks like that in DT:

{
   input-schmitt-enable;
   bias-pull-up = <47000>;
   slew-rate = <50000000>;
   drive-strength = <80000>;
};

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
