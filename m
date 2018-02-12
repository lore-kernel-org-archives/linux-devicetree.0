From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [RFC v4 13/26] watchdog: renesas_wdt: Add restart handler
Date: Mon, 12 Feb 2018 10:33:47 +0000
Message-ID: <TY1PR06MB089578618AA33335D90D16CEC0F70@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1517423070-24236-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1517423070-24236-14-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180207230309.goxig2irkpxrw5el@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180207230309.goxig2irkpxrw5el@katana>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wim Van Sebroeck <wim@iguana.be>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Guenter Roeck <linux@roeck-us.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>l
List-Id: devicetree@vger.kernel.org

Hello Wolfram,

thank you for your feedback!

> Subject: Re: [RFC v4 13/26] watchdog: renesas_wdt: Add restart handler
>
>
> > +static int rwdt_restart(struct watchdog_device *wdev, unsigned long ac=
tion,
> > +void *data)
> > +{
> > +struct rwdt_priv *priv =3D watchdog_get_drvdata(wdev);
> > +
> > +pm_runtime_get_sync(wdev->parent);
> > +
> > +rwdt_write(priv, 0x00, RWTCSRB);
> > +rwdt_write(priv, 0x00, RWTCSRA);
> > +rwdt_write(priv, 0xffff, RWTCNT);
> > +
> > +while (readb_relaxed(priv->base + RWTCSRA) & RWTCSRA_WRFLG)
> > +cpu_relax();
> > +
> > +rwdt_write(priv, 0x80, RWTCSRA);
> > +return 0;
> > +}
>
> I used to have this simpler version (back then for the UP case):
>
> +rwdt_start(wdev);
> +rwdt_write(priv, 0xffff, RWTCNT);
> +return 0;
>
> It should still work probably...

It should still work, but it would be slower, I would stick with the versio=
n I have submitted if you don't mind.

Thanks,
Fabrizio





Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
