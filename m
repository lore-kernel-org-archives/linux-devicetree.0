From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH v2 1/3] dt: bindings: add documentation for zx2967 family reset controller
Date: Mon, 16 Jan 2017 18:56:32 +0800
Message-ID: <1484564194-18530-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jun.nie@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawnguo@kernel.org, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-Id: devicetree@vger.kernel.org

This patch adds dt-binding documentation for zx2967 family
reset controller.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
Reviewed-by: Shawn Guo <shawnguo@kernel.org>
---
 .../devicetree/bindings/reset/zte,zx2967-reset.txt   | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt

diff --git a/Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt b/Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt
new file mode 100644
index 0000000..b015508
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt
@@ -0,0 +1,20 @@
+ZTE zx2967 SoCs Reset Controller
+=======================================
+
+Please also refer to reset.txt in this directory for common reset
+controller binding usage.
+
+Required properties:
+- compatible: should be one of the following.
+	* zte,zx296718-reset
+- reg: physical base address of the controller and length of memory mapped
+	region.
+- #reset-cells: must be 1.
+
+example:
+
+	reset: reset-controller@1461060 {
+		compatible = "zte,zx296718-reset";
+		reg = <0x01461060 0x8>;
+		#reset-cells = <1>;
+	};
-- 
2.7.4
