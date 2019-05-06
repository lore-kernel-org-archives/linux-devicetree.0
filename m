Return-Path: <SRS0=WgTi=TG=renesas.com=prvs=40290ccc1f=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 00/10] usb: Add host and device support for RZ/A2
Date: Mon, 6 May 2019 18:46:21 -0500
Message-ID: <20190506234631.113226-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

For the most part, the RZ/A2 has the same USB 2.0 host and device
HW as the R-Car Gen3, so we can reuse a lot of the code.

However, there are a couple extra register bits, and the CFIFO
register 8-bit access works a little different (weird, no idea why).

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
	renesas,uses_usb_x1;
	dr_mode = "peripheral";
	status = "okay";
};
&usbhs0 {
	status = "okay";
};






Chris Brandt (10):
  phy: renesas: rcar-gen3-usb2: Add uses_usb_x1 option
  dt-bindings: rcar-gen3-phy-usb2: Document uses_usb_x1
  phy: renesas: rcar-gen3-usb2: Check dr_mode when not using OTG
  dt-bindings: rcar-gen3-phy-usb2: Document dr_mode
  dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
  usb: renesas_usbhs: Add support for RZ/A2
  dt-bindings: usb: renesas_usbhs: Add support for r7s9210
  ARM: dts: r7s9210: Add USB Host support
  ARM: dts: r7s9210: Add USB Device support
  ARM: dts: r7s9210-rza2mevb: Add USB host support

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 15 +++-
 .../devicetree/bindings/usb/renesas_usbhs.txt      |  2 +
 arch/arm/boot/dts/r7s9210-rza2mevb.dts             | 37 +++++++++
 arch/arm/boot/dts/r7s9210.dtsi                     | 88 ++++++++++++++++++++++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 16 +++-
 drivers/usb/renesas_usbhs/Makefile                 |  2 +-
 drivers/usb/renesas_usbhs/common.c                 | 27 +++++--
 drivers/usb/renesas_usbhs/common.h                 | 13 ++++
 drivers/usb/renesas_usbhs/fifo.c                   |  8 +-
 drivers/usb/renesas_usbhs/rza.h                    |  1 +
 drivers/usb/renesas_usbhs/rza2.c                   | 82 ++++++++++++++++++++
 include/linux/usb/renesas_usbhs.h                  |  1 +
 12 files changed, 277 insertions(+), 15 deletions(-)
 create mode 100644 drivers/usb/renesas_usbhs/rza2.c

-- 
2.16.1
