Return-Path: <shawnguo@kernel.org>
Date: Mon, 24 Jun 2019 08:38:20 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: imx6qdl-kontron-samx6i: add Kontron
 SMARC SoM Support
Message-ID: <20190624003819.GE3800@dragon>
References: <20190617161432.32268-1-m.felsch@pengutronix.de>
 <20190617161432.32268-4-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617161432.32268-4-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: robh+dt@kernel.org, linux-imx@nxp.com, devicetree@vger.kernel.org, Gilles.Buloz@kontron.com, frieder.schrempf@kontron.de, thomas.schaefer@kontron.com, Stefan.Nickl@kontron.com, Michael.Brunner@kontron.com, kernel@pengutronix.de, festevam@gmail.com, plaes@plaes.org, Michael Grzeschik <m.grzeschik@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jun 17, 2019 at 06:14:32PM +0200, Marco Felsch wrote:
> From: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> The patch adds the following interfaces according the SMARC Spec 1.1
> [1] and provided schematics:
>  - SMARC SPI0/1
>    Note: Since Kontron still uses silicon revisions below 1.3 they have
>          add a spi-nor to implement Workaround #1 of erratum ERR006282.
>  - SMARC SDIO
>  - SMARC LCD
>  - SMARC HDMI
>  - SMARC Management pins
>    Note: Kontron don't route all of these pins to the i.MX6, some are
>          routed to the SoM CPLD.
>  - SMARC GPIO
>  - SMARC CSI Camera
>    Note: As specified in [1] the data lanes are shared to cover the
>          csi and the parallel case. The case depends on the baseboard so
>          muxing the data lanes is not part of this patch.
>  - SMARC I2S
>  - SMARC Watchdog
>    Note: The watchdog output pin is routed to the CPLD and the SMARC
>          header. The CPLD performs a reset after a 30s timeout so we
>          need to enable the watchdog per default.
>  - SMARC module eeprom
> 
> Due to the lack of hardware not all of these interfaces are tesetd.
> 
> [1] https://sget.org/standards/smarc
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Applied, thanks.
