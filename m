From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 08/14] clk: sunxi-ng: v3s: add Allwinner V3 support
Date: Mon, 1 Apr 2019 10:15:24 +0200
Message-ID: <20190401081524.bickdv7kr4kcnsgm@flea>
References: <20190312152256.35574-1-icenowy@aosc.io>
 <20190312152256.35574-9-icenowy@aosc.io>
 <20190328132721.GA32178@bogus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jc3kve7lqqq7wqjx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190328132721.GA32178@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Icenowy Zheng <icenowy@aosc.io>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--jc3kve7lqqq7wqjx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 28, 2019 at 08:27:21AM -0500, Rob Herring wrote:
> On Tue, Mar 12, 2019 at 11:22:50PM +0800, Icenowy Zheng wrote:
> > Allwinner V3 has the same main die with V3s, but with more pins wired.
> > There's a I2S bus on V3 that is not available on V3s.
> >
> > Add the V3-only peripheral's clocks and reset to the V3s CCU driver,
> > bound to a new V3 compatible string. The driver name is not changed
> > because it's part of the device tree binding (the header file name).
> >
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun8i-v3s.c      | 225 +++++++++++++++++++++-
> >  drivers/clk/sunxi-ng/ccu-sun8i-v3s.h      |   2 +-
> >  include/dt-bindings/clock/sun8i-v3s-ccu.h |   4 +
> >  include/dt-bindings/reset/sun8i-v3s-ccu.h |   3 +
> >  4 files changed, 231 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> > index cbba04f5f761..81450ea8faa2 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> > @@ -242,6 +242,8 @@ static SUNXI_CCU_GATE(bus_codec_clk,	"bus-codec",	"apb1",
> >  		      0x068, BIT(0), 0);
> >  static SUNXI_CCU_GATE(bus_pio_clk,	"bus-pio",	"apb1",
> >  		      0x068, BIT(5), 0);
> > +static SUNXI_CCU_GATE(bus_i2s0_clk,	"bus-i2s0",	"apb1",
> > +		      0x068, BIT(12), 0);
> >
> >  static SUNXI_CCU_GATE(bus_i2c0_clk,	"bus-i2c0",	"apb2",
> >  		      0x06c, BIT(0), 0);
> > @@ -313,6 +315,11 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(spi0_clk, "spi0", mod0_default_parents, 0x0a0,
> >  				  BIT(31),	/* gate */
> >  				  0);
> >
> > +static const char * const i2s_parents[] = { "pll-audio-8x", "pll-audio-4x",
> > +					    "pll-audio-2x", "pll-audio" };
> > +static SUNXI_CCU_MUX_WITH_GATE(i2s0_clk, "i2s0", i2s_parents,
> > +			       0x0b0, 16, 2, BIT(31), CLK_SET_RATE_PARENT);
> > +
> >  static SUNXI_CCU_GATE(usb_phy0_clk,	"usb-phy0",	"osc24M",
> >  		      0x0cc, BIT(8), 0);
> >  static SUNXI_CCU_GATE(usb_ohci0_clk,	"usb-ohci0",	"osc24M",
> > @@ -445,6 +452,80 @@ static struct ccu_common *sun8i_v3s_ccu_clks[] = {
> >  	&mipi_csi_clk.common,
> >  };
> >
> > +static struct ccu_common *sun8i_v3_ccu_clks[] = {
>
> Seems like a bunch of duplication for just 2 differences in clocks.
> Can't you keep the definitions the same and just skip registering the
> clocks not present?

I'd rather not, this can lead to access to registers that might not be
there when the CCF will read / write that clock

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--jc3kve7lqqq7wqjx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKHInAAKCRDj7w1vZxhR
xZ+WAP92QhUeKofhCPBW2R6w+MmaHaURTZ1S7Q0dQwrc7GzGIwEAnITh/XSIMAU7
l1W4aXbf1ct2/M9dDexttVTYemsRmwc=
=QvxI
-----END PGP SIGNATURE-----

--jc3kve7lqqq7wqjx--
