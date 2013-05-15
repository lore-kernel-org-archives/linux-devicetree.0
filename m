From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 07/20] ARM: shmobile: r8a7779: Add GPIO controller devices to device tree
Date: Wed, 15 May 2013 02:18:07 +0200
Message-ID: <1368577100-3530-8-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1368577100-3530-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1368577100-3530-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

Add GPIO controller nodes to the r8a7779 core device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7779.dtsi | 64 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 9dfc438..dc78ff7 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -48,6 +48,70 @@
                       <0xf0000100 0x100>;
         };
 
+	gpio0: gpio@ffc40000 {
+		compatible = "renesas,gpio-r8a7779", "renesas,gpio-rcar";
+		reg = <0xffc40000 0x2c>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 141 0x4>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	gpio1: gpio@ffc41000 {
+		compatible = "renesas,gpio-r8a7779", "renesas,gpio-rcar";
+		reg = <0xffc41000 0x2c>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 142 0x4>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	gpio2: gpio@ffc42000 {
+		compatible = "renesas,gpio-r8a7779", "renesas,gpio-rcar";
+		reg = <0xffc42000 0x2c>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 143 0x4>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	gpio3: gpio@ffc43000 {
+		compatible = "renesas,gpio-r8a7779", "renesas,gpio-rcar";
+		reg = <0xffc43000 0x2c>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 144 0x4>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	gpio4: gpio@ffc44000 {
+		compatible = "renesas,gpio-r8a7779", "renesas,gpio-rcar";
+		reg = <0xffc44000 0x2c>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 145 0x4>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	gpio5: gpio@ffc45000 {
+		compatible = "renesas,gpio-r8a7779", "renesas,gpio-rcar";
+		reg = <0xffc45000 0x2c>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 146 0x4>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	gpio6: gpio@ffc46000 {
+		compatible = "renesas,gpio-r8a7779", "renesas,gpio-rcar";
+		reg = <0xffc46000 0x2c>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 147 0x4>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#gpio-lines = <9>;
+	};
+
 	irqpin0: irqpin@fe780010 {
 		compatible = "renesas,intc-irqpin";
 		#interrupt-cells = <2>;
-- 
1.8.1.5

