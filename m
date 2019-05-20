Return-Path: <shawnguo@kernel.org>
Date: Mon, 20 May 2019 09:29:50 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 00/17] Add Support for Kontron SMARC-sAMX6i
Message-ID: <20190520012948.GE15856@dragon>
References: <20190509155834.22838-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509155834.22838-1-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: robh+dt@kernel.org, linux-imx@nxp.com, Stefan.Nickl@kontron.com, Gilles.Buloz@kontron.com, Michael.Brunner@kontron.com, thomas.schaefer@kontron.com, frieder.schrempf@kontron.de, kernel@pengutronix.de, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, May 09, 2019 at 05:58:17PM +0200, Marco Felsch wrote:
> Marco Felsch (14):
>   dt-bindings: add Kontron vendor prefix
>   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC SDIO interface
>   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC LCD interface
>   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC Management pins
>   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC GPIO interface
>   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC HDMI interface
>   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC CSI Camera interface
>   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC I2S interface
>   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC SPI1 interface
>   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC Watchdog
>   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC module eeprom
>   ARCH: arm: dts: imx6qdl-kontron-samx6i: add power management support
>   ARCH: arm: dts: imx6q-kontron-samx6i: add Kontron SMARC Quad/Dual SoM
>   ARCH: arm: dts: imx6dl-kontron-samx6i: add Kontron SMARC
>     Dual-Lite/Solo SoM
> 
> Michael Grzeschik (2):
>   ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC SPI0 interface
>   ARCH: arm: dts: imx6qdl-kontron-samx6i: add boot spi-nor
> 
> Priit Laes (1):
>   ARCH: arm: dts: imx6qdl-kontron-samx6i: Add iMX6-based Kontron
>     SMARC-sAMX6i module

'ARM: dts: ...' for prefix please.

Shawn
