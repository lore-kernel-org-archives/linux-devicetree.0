From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/2] Meson GXL USB3 PHY and OTG detection driver
Date: Mon, 02 Oct 2017 15:27:54 +0200
Message-ID: <1506950874.17300.48.camel@baylibre.com>
References: <20170924195000.13276-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170924195000.13276-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 2017-09-24 at 21:49 +0200, Martin Blumenstingl wrote:
> Amlogic Meson GXL SoCs use a dwc3 controller with two USB2 ports,
> Meson GXM SoCs use the same dwc3 controller but with three USB3
> ports enabled. Neither of these SoCs has any USB3 port enabled in
> the dwc3 registers.
> The first USB2 port on both SoCs supports host and peripheral
> (also called "device") mode.
> 
> The dwc3 controller supports host mode only. Peripheral mode is
> implemented through an additional dwc2 controller (which only enables
> device mode). The USB3 PHY has register bits which allow a driver to
> detect the current mode - however this is currently not implemented
> as the dwc2 controller seems to hang during reset (and I do not have
> a use-case where I need peripheral/device mode).
> 
> While the dwc3 controller has no USB3 port enabled we still need the
> USB3 PHY to be initialized, otherwise some boards (probably those where
> the bootloader does not initialize the USB3 PHY) show errors with
> high-speed USB devices connected to any of the USB2 ports. Configuring
> the USB_R1_U3H_FLADJ_30MHZ_REG_MASK register as it's done by Amlogic's
> vendor GPL kernel sources makes these error go away.
> 
> Thanks to Jerome Brunet for reporting the errors and Neil Armstrong
> for discovering that initializing the USB3 PHY fixes these USB errors!
> 

This series works well on the libretech-cc (le potato)
For the series:

Tested-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

> 
> Martin Blumenstingl (2):
>   dt-bindings: phy: Add support for the USB3 PHY on Amlogic Meson GXL
>     SoCs
>   phy: amlogic: add USB3 PHY support for Meson GXL and GXM
> 
>  .../devicetree/bindings/phy/meson-gxl-usb3-phy.txt |  19 +++
>  drivers/phy/amlogic/Kconfig                        |  12 ++
>  drivers/phy/amlogic/Makefile                       |   1 +
>  drivers/phy/amlogic/phy-meson-gxl-usb3.c           | 177
> +++++++++++++++++++++
>  4 files changed, 209 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-
> phy.txt
>  create mode 100644 drivers/phy/amlogic/phy-meson-gxl-usb3.c
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
