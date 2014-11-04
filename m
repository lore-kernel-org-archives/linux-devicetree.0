From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v5 1/8] ARM: mediatek: Add basic support for mt8127
Date: Tue, 4 Nov 2014 15:30:48 +0800
Message-ID: <1415086255-5555-2-git-send-email-yingjoe.chen@mediatek.com>
References: <1415086255-5555-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1415086255-5555-1-git-send-email-yingjoe.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, hc.yen@mediatek.com, yh.chen@mediatek.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, nathan.chung@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, "Joe.C" <yingjoe.chen@mediatek.com>, eddie.huang@mediatek.com, yingjoe.chen@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: "Joe.C" <yingjoe.chen@mediatek.com>

This adds a basic dtsi for MT8127 SoC.

Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
---
 arch/arm/boot/dts/mt8127.dtsi     | 94 +++++++++++++++++++++++++++++++++++++++
 arch/arm/mach-mediatek/mediatek.c |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 arch/arm/boot/dts/mt8127.dtsi

diff --git a/arch/arm/boot/dts/mt8127.dtsi b/arch/arm/boot/dts/mt8127.dtsi
new file mode 100644
index 0000000..de93b81
--- /dev/null
+++ b/arch/arm/boot/dts/mt8127.dtsi
@@ -0,0 +1,94 @@
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
+#include "skeleton.dtsi"
+
+/ {
+	compatible = "mediatek,mt8127";
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+		};
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x1>;
+		};
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x2>;
+		};
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x3>;
+		};
+
+	};
+
+	clocks {
+		#address-cells = <1>;
+		#size-cells = <1>;
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
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges;
+
+		timer: timer@10008000 {
+			compatible = "mediatek,mt8127-timer",
+					"mediatek,mt6577-timer";
+			reg = <0x10008000 0x80>;
+			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&system_clk>, <&rtc_clk>;
+			clock-names = "system-clk", "rtc-clk";
+		};
+
+		gic: interrupt-controller@10211000 {
+			compatible = "arm,cortex-a7-gic";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x10211000 0x1000>,
+			      <0x10212000 0x1000>,
+			      <0x10214000 0x2000>,
+			      <0x10216000 0x2000>;
+		};
+	};
+};
diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
index f2acf07..7f478ce 100644
--- a/arch/arm/mach-mediatek/mediatek.c
+++ b/arch/arm/mach-mediatek/mediatek.c
@@ -19,6 +19,7 @@
 
 static const char * const mediatek_board_dt_compat[] = {
 	"mediatek,mt6589",
+	"mediatek,mt8127",
 	NULL,
 };
 
-- 
1.8.1.1.dirty
