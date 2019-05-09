Return-Path: <SRS0=d+eE=TJ=renesas.com=prvs=4032988503=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 00/15] usb: Add host and device support for RZ/A2
Date: Thu, 9 May 2019 15:11:27 -0500
Message-ID: <20190509201142.10543-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

For the most part, the RZ/A2 has the same USB 2.0 host and device
HW as the R-Car Gen3, so we can reuse a lot of the code.

However, there are a couple extra register bits, and the CFIFO
register 8-bit access works a little different..

There is a dedicated DMAC for the RZ/A2 USB Device HW, but we
have not been able to reliably get that working yet, so device
operation is pio only at the moment.

On the RZ/A2M eval board, both USB channels can be used as either
host or device. But, it's not set up for otg (ie, there are jumpers
and separate connectors). Therefore, below is an example of what it
would look like to enable USB channel 0 as a device instead of a host.

&usb2_phy0 {
	pinctrl-names = "default";
	pinctrl-0 = <&usb0_pins>;
	dr_mode = "peripheral";
	status = "okay";
};

&usbhs0 {
	status = "okay";
};






Chris Brandt (15):
  ARM: dts: r7s9210: Add USB clock
  ARM: dts: rza2mevb: Add 48MHz USB clock
  phy: renesas: rcar-gen3-usb2: detect usb_x1 clock
  dt-bindings: rcar-gen3-phy-usb2: Document use of usb_x1
  phy: renesas: rcar-gen3-usb2: Check dr_mode when not using OTG
  dt-bindings: rcar-gen3-phy-usb2: Document dr_mode
  dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
  usb: renesas_usbhs: move flags macros
  usb: renesas_usbhs: add support for CNEN bit
  usb: renesas_usbhs: support byte addressable CFIFO
  usb: renesas_usbhs: Add support for RZ/A2
  dt-bindings: usb: renesas_usbhs: Add support for r7s9210
  ARM: dts: r7s9210: Add USB Host support
  ARM: dts: r7s9210: Add USB Device support
  ARM: dts: rza2mevb: Add USB host support

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 17 ++--
 .../devicetree/bindings/usb/renesas_usbhs.txt      |  2 +
 arch/arm/boot/dts/r7s9210-rza2mevb.dts             | 42 ++++++++++
 arch/arm/boot/dts/r7s9210.dtsi                     | 95 ++++++++++++++++++++++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 22 +++++
 drivers/usb/renesas_usbhs/Makefile                 |  2 +-
 drivers/usb/renesas_usbhs/common.c                 | 25 ++++--
 drivers/usb/renesas_usbhs/common.h                 | 13 +++
 drivers/usb/renesas_usbhs/fifo.c                   |  9 +-
 drivers/usb/renesas_usbhs/rza.h                    |  1 +
 drivers/usb/renesas_usbhs/rza2.c                   | 79 ++++++++++++++++++
 include/linux/usb/renesas_usbhs.h                  |  1 +
 12 files changed, 292 insertions(+), 16 deletions(-)
 create mode 100644 drivers/usb/renesas_usbhs/rza2.c

-- 
2.16.1
