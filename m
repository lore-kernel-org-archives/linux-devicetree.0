From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/4] clk: select CLKDEV_LOOKUP for COMMON_CLK
Date: Wed, 18 Apr 2012 09:07:21 +0200
Message-ID: <20120418070721.GL3852@pengutronix.de>
References: <1334003101-17274-1-git-send-email-robherring2@gmail.com>
 <1334003101-17274-2-git-send-email-robherring2@gmail.com>
 <CAJOA=zMPqiH2fQJ5JWJ=COnju7Cmur6J2ATYUTcx41C4WMjFQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJOA=zMPqiH2fQJ5JWJ=COnju7Cmur6J2ATYUTcx41C4WMjFQQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Turquette, Mike" <mturquette@ti.com>
Cc: Rob Herring <robherring2@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Thierry Reding <thierry.reding@avionic-design.de>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Sascha Hauer <kernel@pengutronix.de>, shawn.guo@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 17, 2012 at 03:13:49PM -0700, Turquette, Mike wrote:
> On Mon, Apr 9, 2012 at 1:24 PM, Rob Herring <robherring2@gmail.com> w=
rote:
> > From: Rob Herring <rob.herring@calxeda.com>
> >
> > Using the common clock infrastructure without the common clkdev cod=
e makes
> > little sense, so select CLKDEV_LOOKUP for COMMON_CLK.
> >
> > Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> > ---
> > =A0drivers/clk/Kconfig | =A0 =A01 +
> > =A01 files changed, 1 insertions(+), 0 deletions(-)
> >
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index 165e1fe..f05a60d 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -12,6 +12,7 @@ config HAVE_MACH_CLKDEV
> > =A0config COMMON_CLK
> > =A0 =A0 =A0 =A0bool
> > =A0 =A0 =A0 =A0select HAVE_CLK_PREPARE
> > + =A0 =A0 =A0 select CLKDEV_LOOKUP
> > =A0 =A0 =A0 =A0---help---
> > =A0 =A0 =A0 =A0 =A0The common clock framework is a single definitio=
n of struct
> > =A0 =A0 =A0 =A0 =A0clk, useful across many platforms, as well as an
>=20
> Hi Rob,
>=20
> I agree that the common clk framework is not particularly useful
> without clkdev.  However the core code has no dependency on clkdev.
> Why not just select it from an arch Kconfig, or even make it a
> dependency based on your own platform clock data/code?

Selecting it from COMMON_CLK means that the compiler/linker will point
everybody trying to implement it without CLKDEV into the right
direction.

Sascha


--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
