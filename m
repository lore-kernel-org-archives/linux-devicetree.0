From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v3 4/5] ARM: dts: mt8135: enable basic SMP bringup for mt8135
Date: Tue, 14 Jul 2015 13:18:30 +0800
Message-ID: <1436851111-2369-5-git-send-email-yingjoe.chen@mediatek.com>
References: <1436851111-2369-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436851111-2369-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, Yingjoe Chen <yingjoe.chen@mediatek.com>, srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add arch timer node to enable arch-timer support. MT8135 firmware
doesn't correctly setup arch-timer frequency and CNTVOFF, add
properties to workaround this.

This also set cpu enable-method to enable SMP.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
---
 arch/arm/boot/dts/mt8135.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
index 0aba9eb..0264d2e 100644
--- a/arch/arm/boot/dts/mt8135.dtsi
+++ b/arch/arm/boot/dts/mt8135.dtsi
@@ -44,6 +44,7 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "mediatek,mt81xx-tz-smp";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -96,6 +97,21 @@
 
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
1.8.1.1.dirty
