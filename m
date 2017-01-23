From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 00/16] arm: dts: extend mt7623 support
Date: Mon, 23 Jan 2017 12:29:19 +0100
Message-ID: <1485170975-51813-1-git-send-email-john@phrozen.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series extends the dts files used for booting mt7623 base boards.
Since support for mt7623 was added around v4.6, many new drivers have
been accepted upstream. The contained patches add several of these to
the devicetree.

Additionally the series does a bit of refactoring. MTK/WCN pointed out
that the evaluation board is infact a reference design and asked the the
evb files be renamed to rfb.

As with all of the current ARM bases MTK silicon, these boards also have
a PMIC. Instead of adding the nodes to all of the dts files, we add an
intermediate dtsi file that contains the required nodes. This allows us
to reduce the size of the top most dts files.

The RFB comes in various versions and asiarf has even done a crowdfunder
to sell them. We should try to reduce the duplication. This series adds
a common dtsi file for these boards. This results in the topmost dts files
only needing to specify the compatible string, MTD nodes and ethernet setup.

John Crispin (16):
  arm: dts: add clock controller device nodes
  arm: dts: add subsystem clock controller device nodes
  arm: dts: add power domain controller device node
  arm: dts: add clock-frequency to the a7 timer node to mt7623.dtsi
  arm: dts: add pinctrl nodes to the mt7623 dtsi file
  arm: dts: add pmic nodes to the mt7623 dtsi file
  arm: dts: add i2c nodes to the mt7623.dtsi file
  arm: dts: add spi nodes to the mt7623.dtsi file
  arm: dts: add nand nodes to the mt7623.dtsi file
  arm: dts: add mmc nodes to the mt7623.dtsi file
  arm: dts: add usb nodes to the mt7623.dtsi file
  arm: dts: add mt7623-mt6323.dtsi file
  arm: dts: rename mt7623-evb.dts to arch/arm/boot/dts/mt7623n-rfb.dtsi
  arm: dts: cleanup the mt7623n rfb uart nodes
  arm: dts: enable the usb device on the mt7623n rfb
  arm: dts: enable the nand device on the mt7623n nand rfb

 Documentation/devicetree/bindings/arm/mediatek.txt |    4 +-
 arch/arm/boot/dts/Makefile                         |    2 +-
 arch/arm/boot/dts/mt7623-evb.dts                   |   33 ---
 arch/arm/boot/dts/mt7623-mt6323.dtsi               |  273 ++++++++++++++++++
 arch/arm/boot/dts/mt7623.dtsi                      |  297 +++++++++++++++++++-
 arch/arm/boot/dts/mt7623n-rfb-nand.dts             |  109 +++++++
 arch/arm/boot/dts/mt7623n-rfb.dtsi                 |   61 ++++
 7 files changed, 730 insertions(+), 49 deletions(-)
 delete mode 100644 arch/arm/boot/dts/mt7623-evb.dts
 create mode 100644 arch/arm/boot/dts/mt7623-mt6323.dtsi
 create mode 100644 arch/arm/boot/dts/mt7623n-rfb-nand.dts
 create mode 100644 arch/arm/boot/dts/mt7623n-rfb.dtsi

-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
