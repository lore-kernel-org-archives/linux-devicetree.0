From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH v5 09/26] soc: renesas: rcar-rst: Enable watchdog as reset
 trigger for Gen2
Date: Tue, 13 Feb 2018 12:57:56 +0000
Message-ID: <TY1PR06MB08958CD1E38DBA3F321977EDC0F60@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1518457475-4480-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1518457475-4480-10-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180213081910.x5llcsmwza44u4ow@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180213081910.x5llcsmwza44u4ow@verge.net.au>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wim Van Sebroeck <wim@iguana.be>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Guenter Roeck <linux@roeck-us.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Simon,

> Subject: Re: [PATCH v5 09/26] soc: renesas: rcar-rst: Enable watchdog as =
reset trigger for Gen2
>
> On Mon, Feb 12, 2018 at 05:44:18PM +0000, Fabrizio Castro wrote:
> > This patch allows for platform specific quirks as some of the SoC need
> > further customization for the watchdog to work properly, like for R-Car
> > Gen2 and for RZ/G.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.rene=
sas.com>
>
> I am fine with this patch but please rebase it on top of
> renesas-devel-20180212-v4.16-rc1 (or later).

sure, I will.

Thanks,
Fab



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
