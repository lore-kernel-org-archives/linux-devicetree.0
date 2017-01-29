From: Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 0/5] usb: dwc2: Add support for USB OTG on STM32F4x9
Date: Sun, 29 Jan 2017 00:21:05 -0200
Message-ID: <20170129022110.54032-1-bruherrera@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The STM32F4x9 MCU family has two DWC2 USB OTG cores on it. One core is
USB OTG FS and other core is USB OTG HS. The USB FS core only works with
its internal phy whilst the USF HS core can work in HS with external ulpi
phy or in FS/LS speed with the embedded FS PHY.

The goal of this patch series is to enable the use of USB OTG FS/HS cores
in FS mode using the internal phy.

Changes since v4:
- Rebase on top of repository https://github.com/synopsys-usb/linux
- Changes var names from STM32F4xx to STM32F4x9

Changes since v3:
- Removed commented lines from patch (sent by mistake)
- Split DTS patch by boards and SOC
- Removed unnecessary pinctrl nodes from DTS files

Changes since v2:
- Rename driver variables to meet the driver standard
- Add compatible string for HS core

Changes since v1:
- Add dwc2_core_params structure for stm32f4 otg fs
- Add compatible string for FS core/mode
- Use GGPIO register to deativate power down of the phy

Bruno Herrera (5):
  usb: dwc2: Add support for STM32F429/439/469 USB OTG HS/FS in FS mode
    (internal PHY)
  ARM: dts: stm32: Add USB FS support for STM32F429 MCU
  ARM: dts: stm32: Enable USB FS on stm32f469-disco
  ARM: dts: stm32: Enable USB HS in FS mode (embedded phy) on
    stm32f429-disco
  dt-bindings: Document the STM32 USB OTG DWC2 core binding

 Documentation/devicetree/bindings/usb/dwc2.txt |  4 ++++
 arch/arm/boot/dts/stm32f429-disco.dts          | 16 +++++++++++++
 arch/arm/boot/dts/stm32f429.dtsi               | 31 ++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32f469-disco.dts          | 16 +++++++++++++
 drivers/usb/dwc2/core.h                        |  4 ++++
 drivers/usb/dwc2/hcd.c                         | 13 ++++++++++-
 drivers/usb/dwc2/hw.h                          |  2 ++
 drivers/usb/dwc2/params.c                      | 20 +++++++++++++++++
 8 files changed, 105 insertions(+), 1 deletion(-)

-- 
2.10.1 (Apple Git-78)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
