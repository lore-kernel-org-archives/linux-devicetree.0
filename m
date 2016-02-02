From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/6] dma: enable mxs-dma for imx6ul
Date: Tue, 2 Feb 2016 14:23:16 +0800
Message-ID: <20160202062314.GD8307@tiger>
References: <1453294626-17608-1-git-send-email-LW@KARO-electronics.de>
 <1453294626-17608-2-git-send-email-LW@KARO-electronics.de>
 <20160125121043.GJ11130@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160125121043.GJ11130@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>, Dan Williams <dan.j.williams@intel.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 25, 2016 at 05:40:43PM +0530, Vinod Koul wrote:
> On Wed, Jan 20, 2016 at 01:57:01PM +0100, Lothar Wa=DFmann wrote:
> > The mxs-dma unit is also available on i.MX6UL. Make it possible to
> > select it in Kconfig.
>=20
> It should be dmaengine:xxx
>=20
> With that
>=20
> Acked-by: Vinod Koul <vinod.koul@intel.com>

I think this can go separately via dma tree.

Shawn

>=20
> >=20
> > Signed-off-by: Lothar Wa=DFmann <LW@KARO-electronics.de>
> > ---
> >  drivers/dma/Kconfig | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> > index 79b1390..2516524 100644
> > --- a/drivers/dma/Kconfig
> > +++ b/drivers/dma/Kconfig
> > @@ -341,12 +341,13 @@ config MV_XOR
> > =20
> >  config MXS_DMA
> >  	bool "MXS DMA support"
> > -	depends on SOC_IMX23 || SOC_IMX28 || SOC_IMX6Q
> > +	depends on SOC_IMX23 || SOC_IMX28 || SOC_IMX6Q || SOC_MX6UL
> >  	select STMP_DEVICE
> >  	select DMA_ENGINE
> >  	help
> >  	  Support the MXS DMA engine. This engine including APBH-DMA
> > -	  and APBX-DMA is integrated into Freescale i.MX23/28/MX6Q/MX6DL =
chips.
> > +	  and APBX-DMA is integrated into Freescale
> > +	  i.MX23/28/MX6Q/MX6DL/MX6UL chips.
> > =20
> >  config MX3_IPU
> >  	bool "MX3x Image Processing Unit support"
> > --=20
> > 2.1.4
> >=20
>=20
> --=20
> ~Vinod
>=20
