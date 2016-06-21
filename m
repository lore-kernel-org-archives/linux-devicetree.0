From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 8/8] arm64: dts: db820c: add support to external sd card.
Date: Tue, 21 Jun 2016 18:22:49 +0100
Message-ID: <1466529769-2674-9-git-send-email-srinivas.kandagatla@linaro.org>
References: <1466529769-2674-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1466529769-2674-1-git-send-email-srinivas.kandagatla@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andy Gross <andy.gross@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds support to external sd card.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c-pins.dtsi | 39 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi      | 10 ++++++
 2 files changed, 49 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8096-db820c-pins.dtsi

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c-pins.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c-pins.dtsi
new file mode 100644
index 0000000..24552f1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c-pins.dtsi
@@ -0,0 +1,39 @@
+/*
+ * Copyright (c) 2013-2016, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+&msmgpio {
+	sdc2_cd_on: sdc2_cd_on {
+		mux {
+			pins = "gpio38";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio38";
+			bias-pull-up;		/* pull up */
+			drive-strength = <16>;	/* 16 MA */
+		};
+	};
+
+	sdc2_cd_off: sdc2_cd_off {
+		mux {
+			pins = "gpio38";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio38";
+			bias-pull-up;		/* pull up */
+			drive-strength = <2>;	/* 2 MA */
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 08b063d..5aa5553 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -12,6 +12,7 @@
  */
 
 #include "msm8996.dtsi"
+#include "apq8096-db820c-pins.dtsi"
 
 / {
 	aliases {
@@ -74,5 +75,14 @@
 			label = "HS-SPI1";
 			status = "okay";
 		};
+
+		sdhci@74a4900 {
+		/* External SD card */
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
+			pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+			cd-gpios = <&msmgpio 38 0x1>;
+			status = "okay";
+		};
 	};
 };
-- 
2.7.4
