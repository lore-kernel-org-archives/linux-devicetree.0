From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH v7 1/5] dt-bindings: zte: add bindings document for zx2967
 power domain controller
Date: Fri,  6 Jan 2017 17:16:00 +0800
Message-ID: <1483694164-7668-1-git-send-email-baoyou.xie@linaro.org>
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
To: jun.nie@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, davem@davemloft.net, geert+renesas@glider.be, akpm@linux-foundation.org, mchehab@kernel.org, krzk@kernel.org, arnd@arndb.de, claudiu.manoil@nxp.com, amitdanielk@gmail.com, pankaj.dubey@samsung.com, yangbo.lu@nxp.com, scott.branden@broadcom.com, simon.horman@netronome.com
Cc: devicetree@vger.kernel.org, Baoyou Xie <baoyou.xie@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds device tree bindings document for ZTE zx2967
family power domain controller.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 .../devicetree/bindings/soc/zte/pd-2967xx.txt         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/zte/pd-2967xx.txt

diff --git a/Documentation/devicetree/bindings/soc/zte/pd-2967xx.txt b/Documentation/devicetree/bindings/soc/zte/pd-2967xx.txt
new file mode 100644
index 0000000..7629de1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/zte/pd-2967xx.txt
@@ -0,0 +1,19 @@
+* ZTE zx2967 family Power Domains
+
+zx2967 family includes support for multiple power domains which are used
+to gate power to one or more peripherals on the processor.
+
+Required Properties:
+  - compatible: should be one of the following.
+      * zte,zx296718-pcu - for zx296718 power domain.
+  - reg: physical base address of the controller and length of memory mapped
+      region.
+  - #power-domain-cells: Must be 1.
+
+Example:
+
+	pcu_domain: pcu@117000 {
+		compatible = "zte,zx296718-pcu";
+		reg = <0x00117000 0x1000>;
+		#power-domain-cells = <1>;
+	};
-- 
2.7.4
