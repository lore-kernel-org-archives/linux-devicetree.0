Return-Path: <SRS0=RGXl=TW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33385 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbfEVK5m (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 May 2019 06:57:42 -0400
Date: Wed, 22 May 2019 12:57:39 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 00/17] Add Support for Kontron SMARC-sAMX6i
Message-ID: <20190522105739.tp2mlxel2w7tdvv7@pengutronix.de>
References: <20190509155834.22838-1-m.felsch@pengutronix.de>
 <20190520021639.GG15856@dragon>
 <20190521082903.xsc643uvgqjg5ue7@pengutronix.de>
 <20190521091110.GG15856@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521091110.GG15856@dragon>
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, Gilles.Buloz@kontron.com, Michael.Brunner@kontron.com, frieder.schrempf@kontron.de, thomas.schaefer@kontron.com, robh+dt@kernel.org, Stefan.Nickl@kontron.com, linux-imx@nxp.com, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On 19-05-21 17:11, Shawn Guo wrote:
> On Tue, May 21, 2019 at 10:29:03AM +0200, Marco Felsch wrote:
> > Hi Shawn,
> > 
> > On 19-05-20 10:16, Shawn Guo wrote:
> > > On Thu, May 09, 2019 at 05:58:17PM +0200, Marco Felsch wrote:
> > > > Hi,
> > > > 
> > > > this series adds the Kontron SoM 'SMARC-sAMX6i' which is compatible to
> > > > the SMARC 1.1 standard [1]. Most of the muxing can be done within the
> > > > SoM dtsi since the standard defines a unique SoM hardware interface.
> > > > 
> > > > This series is based on Priit Laes initial commit [2] which adds the
> > > > initial support. I addressed the comments and changed the copyright
> > > > since there where a lot of fixes.
> > > > 
> > > > Testers are welcome :) since I used a custome baseboard which doesn't
> > > > use all of the interfaces.
> > > > 
> > > > [1] https://sget.org/standards/smarc
> > > > [2] https://lore.kernel.org/patchwork/patch/762261/
> > > > 
> > > > Marco Felsch (14):
> > > >   dt-bindings: add Kontron vendor prefix
> > > >   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC SDIO interface
> > > >   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC LCD interface
> > > >   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC Management pins
> > > >   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC GPIO interface
> > > >   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC HDMI interface
> > > >   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC CSI Camera interface
> > > >   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC I2S interface
> > > >   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC SPI1 interface
> > > >   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC Watchdog
> > > >   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC module eeprom
> > > >   ARCH: arm: dts: imx6qdl-kontron-samx6i: add power management support
> > > >   ARCH: arm: dts: imx6q-kontron-samx6i: add Kontron SMARC Quad/Dual SoM
> > > >   ARCH: arm: dts: imx6dl-kontron-samx6i: add Kontron SMARC
> > > >     Dual-Lite/Solo SoM
> > > > 
> > > > Michael Grzeschik (2):
> > > >   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC SPI0 interface
> > > >   ARCH: arm: dts: imx6qdl-kontron-samx6i: add boot spi-nor
> > > > 
> > > > Priit Laes (1):
> > > >   ARCH: arm: dts: imx6qdl-kontron-samx6i: Add iMX6-based Kontron
> > > >     SMARC-sAMX6i module
> > > 
> > > Do we really need so many patches for adding a single board support, or
> > > can we squash some of them?
> > 
> > I wanted to keep them logical ordered but I can squash them if you want.
> 
> Please squash, thanks.

Okay, last question. Should I keep Priit Laes patch seperate and add one
patch above or should I squash all of them?

Regards,
  Marco

> 
> Shawn
> 
