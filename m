From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3 2/2] ARM: shmobile: lager: enable HS-USB
Date: Wed, 08 Oct 2014 00:26:06 +0400
Message-ID: <2298118.7qjLAFjuvd@wasted.cogentembedded.com>
References: <2438577.UAUDMkTTWI@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <2438577.UAUDMkTTWI@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com
List-Id: devicetree@vger.kernel.org

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Enable HS-USB device for the Lager board, defining the GPIO that the driver
should check when probing. Since this board doesn't have the OTG ID pin, we
assume that GP5_18 (USB0_PWEN) is an ID pin because it is 1 when the SW5 is
in position 2-3 (meaning USB function) and 0 in other positions.

Note that there will be pinctrl-related error messages if both internal PCI
and HS-USB drivers are enabled but they should be just ignored.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[Sergei: added pin function/group and prop, moved device node, fixed summary,
supplemented changelog]
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 3:
- added pin function/group and the pinctrl-related prop;
- moved the HS-USB node to precede the USB PHY node;
- uppercased "arm" in the summary;
- supplemented changelog.

 arch/arm/boot/dts/r8a7790-lager.dts |   12 ++++++++++++
 1 file changed, 12 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7790-lager.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7790-lager.dts
+++ renesas/arch/arm/boot/dts/r8a7790-lager.dts
@@ -226,6 +226,11 @@
 		renesas,function = "usb0";
 	};
 
+	hsusb_pins: usb0 {
+		renesas,groups = "usb0_ovc_vbus";
+		renesas,function = "usb0";
+	};
+
 	usb1_pins: usb1 {
 		renesas,groups = "usb1";
 		renesas,function = "usb1";
@@ -425,6 +430,13 @@
 	pinctrl-names = "default";
 };
 
+&hsusb {
+	status = "okay";
+	pinctrl-0 = <&hsusb_pins>;
+	pinctrl-names = "default";
+	renesas,enable-gpio = <&gpio5 18 GPIO_ACTIVE_HIGH>;
+};
+
 &usbphy {
 	status = "okay";
 };

