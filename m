From: Joe.C <srv_yingjoe.chen@mediatek.com>
Subject: [PATCH v3 3/7] arm: MTK: Add basic support for mt8135
Date: Fri, 19 Sep 2014 11:04:15 +0800
Message-ID: <1411095859-18737-4-git-send-email-srv_yingjoe.chen@mediatek.com>
References: <1411095859-18737-1-git-send-email-srv_yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411095859-18737-1-git-send-email-srv_yingjoe.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Anders Berg <anders.berg@lsi.com>, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, yingjoe.chen@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, hc.yen@mediatek.com, Linus Walleij <linus.walleij@linaro.org>, yh.chen@mediatek.com, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, nathan.chung@mediatek.com, Kumar Gala <galak@codeaurora.org>, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: "Joe.C" <yingjoe.chen@mediatek.com>

This adds a basic dtsi for MT8135 based SoC.

Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
---
 arch/arm/boot/dts/mt8135.dtsi     | 115 ++++++++++++++++++++++++++++++++++++++
 arch/arm/mach-mediatek/mediatek.c |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 arch/arm/boot/dts/mt8135.dtsi

diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
new file mode 100644
index 0000000..90a56ad
--- /dev/null
+++ b/arch/arm/boot/dts/mt8135.dtsi
@@ -0,0 +1,115 @@
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ * Author: Joe.C <yingjoe.chen@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "skeleton64.dtsi"
+
+/ {
+	compatible = "mediatek,mt8135";
+	interrupt-parent = <&gic>;
+
+	cpu-map {
+		cluster0 {
+			core0 {
+				cpu = <&cpu0>;
+			};
+			core1 {
+				cpu = <&cpu1>;
+			};
+		};
+
+		cluster1 {
+			core0 {
+				cpu = <&cpu2>;
+			};
+			core1 {
+				cpu = <&cpu3>;
+			};
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x000>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x001>;
+		};
+
+		cpu2: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a15";
+			reg = <0x100>;
+		};
+
+		cpu3: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a15";
+			reg = <0x101>;
+		};
+	};
+
+	clocks {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		system_clk: dummy13m {
+			compatible = "fixed-clock";
+			clock-frequency = <13000000>;
+			#clock-cells = <0>;
+		};
+
+		rtc_clk: dummy32k {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		timer: timer@10008000 {
+			compatible = "mediatek,mt8135-timer", "mediatek,mt6577-timer";
+			reg = <0 0x10008000 0 0x80>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&system_clk>, <&rtc_clk>;
+			clock-names = "system-clk", "rtc-clk";
+		};
+
+		gic: interrupt-controller@10211000 {
+			compatible = "arm,cortex-a15-gic";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0 0x10211000 0 0x1000>,
+			      <0 0x10212000 0 0x1000>,
+			      <0 0x10214000 0 0x2000>,
+			      <0 0x10216000 0 0x2000>;
+		};
+	};
+};
diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
index 7f478ce..48051a2 100644
--- a/arch/arm/mach-mediatek/mediatek.c
+++ b/arch/arm/mach-mediatek/mediatek.c
@@ -20,6 +20,7 @@
 static const char * const mediatek_board_dt_compat[] = {
 	"mediatek,mt6589",
 	"mediatek,mt8127",
+	"mediatek,mt8135",
 	NULL,
 };
 
-- 
1.8.1.1.dirty
