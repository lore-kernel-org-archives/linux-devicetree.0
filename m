Return-Path: <SRS0=nX2t=TQ=pengutronix.de=mfe@kernel.org>
Date: Thu, 16 May 2019 17:47:56 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 11/17] ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC
 SPI1 interface
Message-ID: <20190516154756.bz5cl2wqc3wuhvey@pengutronix.de>
References: <20190509155834.22838-1-m.felsch@pengutronix.de>
 <20190509155834.22838-12-m.felsch@pengutronix.de>
 <CAOMZO5CqbA6VaGhjgTnmmO=VJw1rUz=oReBqJ3HFHmL78vva2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5CqbA6VaGhjgTnmmO=VJw1rUz=oReBqJ3HFHmL78vva2w@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Stefan.Nickl@kontron.com, Gilles.Buloz@kontron.com, Michael.Brunner@kontron.com, thomas.schaefer@kontron.com, frieder.schrempf@kontron.de, Sascha Hauer <kernel@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Fabio,

On 19-05-16 08:43, Fabio Estevam wrote:
> On Thu, May 9, 2019 at 12:59 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> > +/* SPI1 */
> > +&ecspi2 {
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_ecspi2>;
> > +       fsl,spi-num-chipselects = <2>;
> > +       cs-gpios = <&gpio2 26 0>, <&gpio2 27 0>;
> 
> Same comment as in the other patch.

Thanks for covering that.

Regards,
  Marco


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
