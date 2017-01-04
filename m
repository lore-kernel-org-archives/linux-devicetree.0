From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH v6 1/5] dt-bindings: zte: documents zx2967 power domain driver bindings
Date: Wed,  4 Jan 2017 19:48:10 +0800
Message-ID: <1483530494-14177-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jun.nie@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, krzk@kernel.org, arnd@arndb.de, ulf.hansson@linaro.org, amitdanielk@gmail.com, claudiu.manoil@nxp.com, yangbo.lu@nxp.com, pankaj.dubey@samsung.com, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawnguo@kernel.org, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-Id: devicetree@vger.kernel.org

This patch documents devicetree tree bindings for the ZTE zx2967
power domain driver.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 Documentation/devicetree/bindings/soc/zte/pd-2967xx.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/zte/pd-2967xx.txt

diff --git a/Documentation/devicetree/bindings/soc/zte/pd-2967xx.txt b/Documentation/devicetree/bindings/soc/zte/pd-2967xx.txt
new file mode 100644
index 0000000..1476318
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/zte/pd-2967xx.txt
@@ -0,0 +1,17 @@
+* ZTE 2967 SoC Power Domains
+
+2967 processors include support for multiple power domains which are used
+to gate power to one or more peripherals on the processor.
+
+Required Properties:
+- compatible: should be one of the following.
+    * zte,zx296718-pcu - for zx296718 board's power domain.
+- reg: physical base address of the controller and length of memory mapped
+    region.
+
+Example:
+
+	pcu_domain: pcu@0x00117000 {
+		compatible = "zte,zx296718-pcu";
+		reg = <0x00117000 0x1000>;
+	};
-- 
2.7.4
