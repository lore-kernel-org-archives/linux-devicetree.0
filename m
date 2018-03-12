Return-Path: <SRS0=Fxpb=GC=googlemail.com=martin.blumenstingl@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v5 0/2] Meson GXL USB3 PHY driver
Date: Mon, 12 Mar 2018 22:11:11 +0100
Message-Id: <20180312211113.26784-1-martin.blumenstingl@googlemail.com>
To: kishon@ti.com, linux-amlogic@lists.infradead.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, carlo@caione.org, khilman@baylibre.com, narmstrong@baylibre.com, jbrunet@baylibre.com, yixun.lan@amlogic.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

Amlogic Meson GXL SoCs use a dwc3 controller with two USB2 ports,
Meson GXM SoCs use the same dwc3 controller but with three USB3
ports enabled. Neither of these SoCs has any USB3 port enabled in
the dwc3 registers.
The second USB2 port on both SoCs supports host and peripheral
(also called "device") mode.

The dwc3 controller supports host mode only. Peripheral mode is
implemented through an additional dwc2 controller (which only enables
device mode). The USB3 PHY has register bits which allow a driver to
detect the current mode - however this is currently not implemented
as the dwc2 controller seems to hang during reset (and I do not have
a use-case where I need peripheral/device mode).

While the dwc3 controller has no USB3 port enabled we still need the
USB3 PHY to be initialized, otherwise some boards (probably those where
the bootloader does not initialize the USB3 PHY) show errors with
high-speed USB devices connected to any of the USB2 ports. Configuring
the USB_R1_U3H_FLADJ_30MHZ_REG_MASK register as it's done by Amlogic's
vendor GPL kernel sources makes these error go away.

Thanks to Jerome Brunet for reporting the errors and Neil Armstrong
for discovering that initializing the USB3 PHY fixes these USB errors!


changes since v4 at [3]:
- rebased on top of Kishon's linux-phy next branch (commit:
  d7119224bfe6e8 "phy: allwinner: sun4i-usb: poll vbus changes on
  A23/A33 when driving VBUS")
- added Neil's Tested-by (many thanks)

changes since v3 at [2]:
- rebased on top of Kishon's linux-phy next branch (commit:
  1f846be367fba4 "phy: allwinner: sun4i-usb: poll vbus changes on
  A23/A33 when driving VBUS")
- use SPDX-License-Identifier instead of the full license text

changes since v2 at [1]:
- collected Rob's Reviewed-by on patch #1 and Yixun's Tested-by
- rebased on top of v4.16-rc1 (no changes were required though)

changes since v1 at [0]:
- document the interrupt in the dt-bindings patch (we don't use it in
  the driver yet, but this interrupt is there so it should be
  documented)
- added the clock and reset lines, thank to Yixun Lan who gave me the
  hints that these are needed (it's not clear when reading the Amlogic
  GPL kernel sources, because the clock for example is always enabled
  by hardware default, bootrom, etc..)
- implemented the .set_mode callback
- NOTE: I chose *NOT* to add Jerome's and Neil's Tested-by's as well as
  Rob's Acked-by on the dt-bindings patch since I made changes that I
  want to have reviewed again


@Kishon: it would be great if you could queue this for v4.17
this is the last missing piece in the GXL/GXM/AXG USB (host mode) puzzle.
after this only the .dts changes are missing (which obviously depend on
this series)


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-September/004780.html
[1] http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006290.html
[2] http://lists.infradead.org/pipermail/linux-amlogic/2018-February/006449.html
[3] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006596.html

Martin Blumenstingl (2):
  dt-bindings: phy: Add support for the USB3 PHY on Amlogic Meson GXL
    SoCs
  phy: amlogic: add USB3 PHY support for Meson GXL and GXM

 .../devicetree/bindings/phy/meson-gxl-usb3-phy.txt |  31 +++
 drivers/phy/amlogic/Kconfig                        |  12 +
 drivers/phy/amlogic/Makefile                       |   1 +
 drivers/phy/amlogic/phy-meson-gxl-usb3.c           | 282 +++++++++++++++++++++
 4 files changed, 326 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
 create mode 100644 drivers/phy/amlogic/phy-meson-gxl-usb3.c

-- 
2.16.2
