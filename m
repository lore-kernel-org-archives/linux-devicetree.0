From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v5 4/5] ARM: dts: mt8135: enable basic SMP bringup for mt8135
Date: Fri, 2 Oct 2015 23:19:40 +0800
Message-ID: <1443799181-50409-5-git-send-email-yingjoe.chen@mediatek.com>
References: <1443799181-50409-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443799181-50409-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add arch timer node to enable arch-timer support. MT8135 firmware
doesn't correctly setup arch-timer frequency and CNTVOFF, add
properties to workaround this.

This also set cpu enable-method to enable SMP.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
---
 arch/arm/boot/dts/mt8135.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
index 08371db..cb99b02 100644
--- a/arch/arm/boot/dts/mt8135.dtsi
+++ b/arch/arm/boot/dts/mt8135.dtsi
@@ -46,6 +46,7 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "mediatek,mt81xx-tz-smp";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -72,6 +73,17 @@
 		};
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		trustzone-bootinfo@80002000 {
+			compatible = "mediatek,trustzone-bootinfo";
+			reg = <0 0x80002000 0 0x1000>;
+		};
+	};
+
 	clocks {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -97,6 +109,21 @@
 		};
 	};
 
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
+					  IRQ_TYPE_LEVEL_LOW)>;
+		clock-frequency = <13000000>;
+		arm,cpu-registers-not-fw-configured;
+	};
+
 	soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
1.9.1
