From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3 3/3] ARM: shmobile: henninger: enable HS-USB
Date: Wed, 08 Oct 2014 22:04:04 +0400
Message-ID: <2594830.xOnLuo3vQq@wasted.cogentembedded.com>
References: <1511869.4ca9KHmSFr@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1511869.4ca9KHmSFr@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com
List-Id: devicetree@vger.kernel.org

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Enable HS-USB device for the Henninger board, defining the GPIO that the driver
should check when probing (which is the ID output from MAX3355 OTG chip).

Note that there will be pinctrl-related error messages if both internal PCI
and HS-USB drivers are enabled but they should be just ignored.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[Sergei: added pin function/group and prop, moved device node, fixed summary,
added changelog]
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- added pinctrl-related properties;
- moved the HS-USB node to precede the USB PHY node;
- uppercased "arm" in the summary;
- added changelog.

 arch/arm/boot/dts/r8a7791-henninger.dts |    7 +++++++
 1 file changed, 7 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7791-henninger.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7791-henninger.dts
+++ renesas/arch/arm/boot/dts/r8a7791-henninger.dts
@@ -272,6 +272,13 @@
 	pinctrl-names = "default";
 };
 
+&hsusb {
+	status = "okay";
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+	renesas,enable-gpio = <&gpio5 31 GPIO_ACTIVE_HIGH>;
+};
+
 &usbphy {
 	status = "okay";
 };

