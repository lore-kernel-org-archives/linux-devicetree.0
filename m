From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v4 0/2] Add support for the Purism Librem5 devkit
Date: Tue, 16 Apr 2019 18:55:43 +0200
Message-ID: <20190416165543.hbowm2zejjdxzwc3@pengutronix.de>
References: <20190415235343.16565-1-angus@akkea.ca>
 <20190416075834.6wurd6nq4ow5woyn@pengutronix.de>
 <665773559cd9449a27fc9bc40cf73792@www.akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <665773559cd9449a27fc9bc40cf73792@www.akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Angus Ainslie <angus@akkea.ca>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 19-04-16 09:38, Angus Ainslie wrote:
> On 2019-04-16 00:58, Marco Felsch wrote:
> > Hi Agnus,
> > 
> > On 19-04-15 16:53, Angus Ainslie (Purism) wrote:
> > > The Librem5 devkit is based on the imx8mq from NXP. This is a default
> > > devicetree to boot the board to a command prompt.
> > 
> > You should also provide a patch which adds the devicetree to the yaml
> > file, see: Documentation/devicetree/bindings/arm/fsl.yaml.
> > 
> 
> Sure, what is that yaml file for ?

Thats for Rob's the validation: https://lwn.net/Articles/771621/

Regards,
  Marco

> 
> Angus
> 
> > Thanks,
> >   Marco
> > 
> > > 
> > > Changes since v3:
> > > 
> > > Freshly sorted and pressed nodes.
> > > Change the backlight to an interpolated scale.
> > > Dropped i2c2.
> > > Dropped devkit version number to match debian MR.
> > > 
> > > Changes since v2:
> > > 
> > > Fixed incorrect phy-supply for the fsl-fec.
> > > Dropped unused regulator property.
> > > Fixup Makefile for linux-next.
> > > 
> > > Changes since v1:
> > > 
> > > Dropped config file.
> > > Updated the board compatible label.
> > > Changed node names to follow naming conventions.
> > > Added a more complete regulator hierachy.
> > > Removed unused nodes.
> > > Removed unknown devices.
> > > Fixed comment style.
> > > Dropped undocumented properties.
> > > 
> > > Angus Ainslie (Purism) (2):
> > >   arm64: dts: fsl: librem5: Add a device tree for the Librem5 devkit
> > >   dt-bindings: Add an entry for Purism SPC
> > > 
> > >  .../devicetree/bindings/vendor-prefixes.txt   |   1 +
> > >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> > >  .../dts/freescale/imx8mq-librem5-devkit.dts   | 822
> > > ++++++++++++++++++
> > >  3 files changed, 824 insertions(+)
> > >  create mode 100644
> > > arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> > > 
> > > --
> > > 2.17.1
> > > 
> > > 
> > > 
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
