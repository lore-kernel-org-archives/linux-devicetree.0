Return-Path: <SRS0=Xjth=FM=googlemail.com=martin.blumenstingl@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180212223350.21036-1-martin.blumenstingl@googlemail.com>
References: <20180212223350.21036-1-martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 18 Feb 2018 22:29:51 +0100
Message-ID: <CAFBinCCxcawFbuSHwJktGUZGgs4cttXLyDTTHEx5Hd3g50sRiA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Meson GXL USB3 PHY driver
Content-Type: text/plain; charset="UTF-8"
To: kishon@ti.com
Cc: linux-amlogic@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, carlo@caione.org, khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com, yixun.lan@amlogic.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

Hello Kishon,

On Mon, Feb 12, 2018 at 11:33 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Amlogic Meson GXL SoCs use a dwc3 controller with two USB2 ports,
> Meson GXM SoCs use the same dwc3 controller but with three USB3
> ports enabled. Neither of these SoCs has any USB3 port enabled in
> the dwc3 registers.
> The second USB2 port on both SoCs supports host and peripheral
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
>
> changes since v2 at [1]:
> - collected Rob's Reviewed-by on patch #1 and Yixun's Tested-by
> - rebased on top of v4.16-rc1 (no changes were required though)
>
> changes since v1 at [0]:
> - document the interrupt in the dt-bindings patch (we don't use it in
>   the driver yet, but this interrupt is there so it should be
>   documented)
> - added the clock and reset lines, thank to Yixun Lan who gave me the
>   hints that these are needed (it's not clear when reading the Amlogic
>   GPL kernel sources, because the clock for example is always enabled
>   by hardware default, bootrom, etc..)
> - implemented the .set_mode callback
> - NOTE: I chose *NOT* to add Jerome's and Neil's Tested-by's as well as
>   Rob's Acked-by on the dt-bindings patch since I made changes that I
>   want to have reviewed again
>
>
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2017-September/004780.html
> [1] http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006290.html
>
>
> Martin Blumenstingl (2):
>   dt-bindings: phy: Add support for the USB3 PHY on Amlogic Meson GXL
>     SoCs
>   phy: amlogic: add USB3 PHY support for Meson GXL and GXM
thank you for merging my other series "improvements and fixes for the
phy-meson-gxl-usb2 driver" [3]
did you already have time to look into this new USB3 PHY driver (from
this series)? please let me know if you have any comments or whether
you are waiting for additional feedback (Reviewed-/Acked-by) from
someone else.

>  .../devicetree/bindings/phy/meson-gxl-usb3-phy.txt |  31 +++
>  drivers/phy/amlogic/Kconfig                        |  12 +
>  drivers/phy/amlogic/Makefile                       |   1 +
>  drivers/phy/amlogic/phy-meson-gxl-usb3.c           | 288 +++++++++++++++++++++
>  4 files changed, 332 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
>  create mode 100644 drivers/phy/amlogic/phy-meson-gxl-usb3.c
>
> --
> 2.16.1
>

Regards
Martin

[3] http://lists.infradead.org/pipermail/linux-amlogic/2018-February/006468.html
