From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 00/12] ARM: berlin: USB support
Date: Wed, 16 Jul 2014 10:25:54 +0200
Message-ID: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds the support for ChipIdea USB2 (ci13xxx) controllers,
the USB PHYs of the Marvell Berlin SoCs and also adds a reset
controller for these SoCs.

The reset controller is used by the PHY driver and shares the
existing chip controller node with the clocks and one pin controller.

The Marvell Berlin USB controllers are host only on the BG2Q and are
compatible with USB ChipIdea. We here add a glue to use the available
common functions for this kind of controllers, and add a generic USB2
ChipIdea driver. A PHY driver is also added to control the USB PHY.

This series applies on top of the generic PHY support in the USB
framework[1].

Changes since v2:
	- moved the PHY driver to the generic PHY framework
	- changed the compatible to 'chipidea,usb2'
	- added a property to set the DMA mask in the USB2 CI driver
	- separated dt specific calls in the CI probing function
	- rebased on top of the generic PHY support for CI[1]

Changes since v1:
        - made the Berlin CI USB driver a generic one
        - added support to custom offset for the reset register
        - added fixed regulators to support supply the VBUS
        - modified the PHY driver to support the one one the BG2CD as
          well
        - documented the reset properties
        - added bindings for the BG2CD
        - cosmetic fixes

[1] https://lkml.org/lkml/2014/7/15/330

Antoine T=C3=A9nart (10):
  reset: add the Berlin reset controller driver
  Documentation: bindings: add reset bindings docs for Marvell Berlin
    SoCs
  ARM: Berlin: select the reset controller
  ARM: dts: berlin: add a required reset property in the chip controlle=
r
    node
  phy: add the Berlin USB PHY driver
  Documentation: bindings: add doc for the Berlin USB PHY
  usb: chipidea: add a usb2 driver for ci13xxx
  Documentation: bindings: add doc for the USB2 ChipIdea USB driver
  ARM: dts: berlin: add BG2Q nodes for USB support
  ARM: dts: Berlin: enable USB on the BG2Q DMP

Sebastian Hesselbarth (2):
  ARM: dts: berlin: add BG2CD nodes for USB support
  ARM: dts: berlin: enable USB on the Google Chromecast

 .../devicetree/bindings/arm/marvell,berlin.txt     |  10 +
 .../devicetree/bindings/phy/berlin-usb-phy.txt     |  16 ++
 .../devicetree/bindings/usb/ci-hdrc-usb2.txt       |  23 +++
 arch/arm/boot/dts/berlin2.dtsi                     |   1 +
 arch/arm/boot/dts/berlin2cd-google-chromecast.dts  |   4 +
 arch/arm/boot/dts/berlin2cd.dtsi                   |  35 ++++
 arch/arm/boot/dts/berlin2q-marvell-dmp.dts         |  53 +++++
 arch/arm/boot/dts/berlin2q.dtsi                    |  53 +++++
 arch/arm/mach-berlin/Kconfig                       |   2 +
 drivers/phy/Kconfig                                |   7 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-berlin-usb.c                       | 223 +++++++++++++=
++++++++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-berlin.c                       | 131 ++++++++++++
 drivers/usb/chipidea/Makefile                      |   1 +
 drivers/usb/chipidea/ci_hdrc_usb2.c                | 147 +++++++++++++=
+
 16 files changed, 708 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/berlin-usb-ph=
y.txt
 create mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.=
txt
 create mode 100644 drivers/phy/phy-berlin-usb.c
 create mode 100644 drivers/reset/reset-berlin.c
 create mode 100644 drivers/usb/chipidea/ci_hdrc_usb2.c

--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
