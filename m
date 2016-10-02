From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: [RFC V2 PATCH 10/12] arm64: dts: msm8994 issolate non standard bootloader/LK entries
Date: Sat,  1 Oct 2016 19:38:37 -0700
Message-ID: <1475375919-618-11-git-send-email-jmcnicol@redhat.com>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robh+dt@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, git@kchr.de
Cc: jeremymc@redhat.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

These non standard DT entries need to be cast aside as to not
pollute the main device tree bindings.  Without these essential
DT items the bootloader/LK will not pass control over to the kernel
and thus never boot.

Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
---
 .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |  1 -
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |  3 +--
 .../boot/dts/qcom/nexus6p_bootloader_bits.dtsi     | 24 ++++++++++++++++++++++
 3 files changed, 25 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/nexus6p_bootloader_bits.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
index 5cff29f..a0fb9c3 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -18,7 +18,6 @@
 / {
 	model = "HUAWEI MSM8994 ANGLER rev-1.01";
 	compatible = "qcom,msm8994";
-	qcom,board-id= <8026 0>;
 };
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index c95cb73..7fdda23 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -15,12 +15,11 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8994.h>
+#include "nexus6p_bootloader_bits.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. MSM 8994";
 	compatible = "qcom,msm8994";
-	qcom,msm-id = <207 0x0>;
-	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;
 	interrupt-parent = <&intc>;
 
 	#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/nexus6p_bootloader_bits.dtsi b/arch/arm64/boot/dts/qcom/nexus6p_bootloader_bits.dtsi
new file mode 100644
index 0000000..c40618d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nexus6p_bootloader_bits.dtsi
@@ -0,0 +1,24 @@
+/*
+ * Copyright (c) 2016, Red Hat Inc.
+ * Author: Jeremy McNicoll
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
+
+/* WARNING:  This file and associated DTS nodes are non-standard
+	and their use should be avoided.  If this code is referenced
+	in any way you put yourself at great risk of catching Bubonic
+	plague. */
+
+/ {
+	qcom,board-id = <8026 0>;
+	qcom,msm-id = <257 0>;
+	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;
+};
-- 
2.6.1
