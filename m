From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 4/5] ARM: dts: r7s72100: Add IRQC device node
Date: Tue, 30 Apr 2019 14:12:53 +0200
Message-ID: <20190430121254.3737-5-geert+renesas@glider.be>
References: <20190430121254.3737-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430121254.3737-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Enable support for the IRQC on RZ/A1H, which is a small front-end to the
GIC.  This allows to use up to 8 external interrupts with configurable
sense select.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v2:
  - Add Reviewed-by,
  - Add "renesas,gic-spi-base".
---
 arch/arm/boot/dts/r7s72100.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 2211f88ede2ad351..52855db63a60580c 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -670,6 +670,15 @@
 			status = "disabled";
 		};
 
+		irqc: interrupt-controller@fcfef800 {
+			compatible = "renesas,r7s72100-irqc",
+				     "renesas,rza1-irqc";
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			reg = <0xfcfef800 0x6>;
+			renesas,gic-spi-base = <0>;
+		};
+
 		mtu2: timer@fcff0000 {
 			compatible = "renesas,mtu2-r7s72100", "renesas,mtu2";
 			reg = <0xfcff0000 0x400>;
-- 
2.17.1
