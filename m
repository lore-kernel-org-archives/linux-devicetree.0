From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 2/2] ARM: shmobile: silk: enable internal PCI
Date: Sun, 13 Sep 2015 01:32:12 +0300
Message-ID: <3172073.DtCLeXEVqG@wasted.cogentembedded.com>
References: <3151312.grtDDBsSl8@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <3151312.grtDDBsSl8@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Enable internal AHB-PCI bridges for the USB EHCI/OHCI controllers attached to
them.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7794-silk.dts |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7794-silk.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7794-silk.dts
+++ renesas/arch/arm/boot/dts/r8a7794-silk.dts
@@ -80,6 +80,16 @@
 		renesas,groups = "vin0_data8", "vin0_clk";
 		renesas,function = "vin0";
 	};
+
+	usb0_pins: usb0 {
+		renesas,groups = "usb0";
+		renesas,function = "usb0";
+	};
+
+	usb1_pins: usb1 {
+		renesas,groups = "usb1";
+		renesas,function = "usb1";
+	};
 };
 
 &scif2 {
@@ -188,3 +198,15 @@
 		};
 	};
 };
+
+&pci0 {
+	status = "okay";
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+};
+
+&pci1 {
+	status = "okay";
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+};

