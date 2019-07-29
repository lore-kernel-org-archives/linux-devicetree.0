From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v5 2/3] dt-bindings: ti_sci_pm_domains: Add support for
 exclusive and shared access
Date: Mon, 29 Jul 2019 17:54:52 +0530
Message-ID: <20190729122453.32252-3-lokeshvutla@ti.com>
References: <20190729122453.32252-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190729122453.32252-1-lokeshvutla@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

TISCI protocol supports for enabling the device either with exclusive
permissions for the requesting host or with sharing across the hosts.
There are certain devices which are exclusive to Linux context and
there are certain devices that are shared across different host contexts.
So add support for getting this information from DT by increasing
the power-domain cells to 2.

Acked-by: Tero Kristo <t-kristo@ti.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../devicetree/bindings/soc/ti/sci-pm-domain.txt      | 11 +++++++++--
 MAINTAINERS                                           |  1 +
 include/dt-bindings/soc/ti,sci_pm_domain.h            |  9 +++++++++
 3 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/soc/ti,sci_pm_domain.h

diff --git a/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt b/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
index f7b00a7c0f68..f541d1f776a2 100644
--- a/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
+++ b/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
@@ -19,8 +19,15 @@ child of the pmmc node.
 Required Properties:
 --------------------
 - compatible: should be "ti,sci-pm-domain"
-- #power-domain-cells: Must be 1 so that an id can be provided in each
-		       device node.
+- #power-domain-cells: Can be one of the following:
+			1: Containing the device id of each node
+			2: First entry should be device id
+			   Second entry should be one of the floowing:
+			   TI_SCI_PD_EXCLUSIVE: To allow device to be
+						exclusively controlled by
+						the requesting hosts.
+			   TI_SCI_PD_SHARED: To allow device to be shared
+					     by multiple hosts.
 
 Example (K2G):
 -------------
diff --git a/MAINTAINERS b/MAINTAINERS
index 6426db5198f0..fe7406427023 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15853,6 +15853,7 @@ F:	drivers/firmware/ti_sci*
 F:	include/linux/soc/ti/ti_sci_protocol.h
 F:	Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
 F:	drivers/soc/ti/ti_sci_pm_domains.c
+F:	include/dt-bindings/soc/ti,sci_pm_domain.h
 F:	Documentation/devicetree/bindings/reset/ti,sci-reset.txt
 F:	Documentation/devicetree/bindings/clock/ti,sci-clk.txt
 F:	drivers/clk/keystone/sci-clk.c
diff --git a/include/dt-bindings/soc/ti,sci_pm_domain.h b/include/dt-bindings/soc/ti,sci_pm_domain.h
new file mode 100644
index 000000000000..8f2a7360b65e
--- /dev/null
+++ b/include/dt-bindings/soc/ti,sci_pm_domain.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __DT_BINDINGS_TI_SCI_PM_DOMAIN_H
+#define __DT_BINDINGS_TI_SCI_PM_DOMAIN_H
+
+#define TI_SCI_PD_EXCLUSIVE	1
+#define TI_SCI_PD_SHARED	0
+
+#endif /* __DT_BINDINGS_TI_SCI_PM_DOMAIN_H */
-- 
2.21.0
