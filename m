From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 08/17] arm64: dts: qcom: pms405: add spmi node
Date: Tue, 30 Oct 2018 15:40:59 +0530
Message-ID: <20181030101108.11041-9-vkoul@kernel.org>
References: <20181030101108.11041-1-vkoul@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181030101108.11041-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-Id: devicetree@vger.kernel.org

Add the pms405 DT file with spmi node.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/pms405.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pms405.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
new file mode 100644
index 000000000000..8a585180f102
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018, Linaro Limited
+
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+
+	pms405_0: pms405@0 {
+		compatible = "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+	};
+};
-- 
2.14.4
