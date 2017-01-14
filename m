From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH v1 1/3] dt: bindings: add documentation for zx2967 family
 reset controller
Date: Sat, 14 Jan 2017 15:05:28 +0800
Message-ID: <1484377530-30635-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jun.nie@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, xie.baoyou@zte.com.cn, linux-kernel@vger.kernel.org, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn, baoyou.xie@linaro.org, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds dt-binding documentation for zx2967 family
reset controller.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 .../devicetree/bindings/reset/zte,zx2967-reset.txt   | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt

diff --git a/Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt b/Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt
new file mode 100644
index 0000000..22d590e
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
+	toprst: reset@1461060 {
+		compatible = "zte,zx296718-reset";
+		reg = <0x01461060 0x8>;
+		#reset-cells = <1>;
+	};
-- 
2.7.4
