From: Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH v2 4/5] ARM: dts: tq imx7s board support
Date: Wed,  3 Apr 2019 08:44:26 +0200
Message-ID: <20190403064427.30041-5-bruno.thomsen@gmail.com>
References: <20190304165630.18225-1-bruno.thomsen@gmail.com>
 <20190403064427.30041-1-bruno.thomsen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190403064427.30041-1-bruno.thomsen@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, laa@kamstrup.com, festevam@gmail.com, s.hauer@pengutronix.de, clemens.ml@gmx.net, bruno.thomsen@gmail.com, bth@kamstrup.com, ksc@kamstrup.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org, markus.niebel@tq-group.com
List-Id: devicetree@vger.kernel.org

This adds support for the TQ TQMa7S SoM together with
the MBa7 carrier board and it's based on the NXP i.MX7Solo SoC.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
v2:
- Removed tq,imx7s-tqma7 (SoM) compatible string.

 arch/arm/boot/dts/Makefile         |  1 +
 arch/arm/boot/dts/imx7s-mba7.dts   | 18 ++++++++++++++++++
 arch/arm/boot/dts/imx7s-tqma7.dtsi | 11 +++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx7s-mba7.dts
 create mode 100644 arch/arm/boot/dts/imx7s-tqma7.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f4f5aeaf3298..250c0890e5ac 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -587,6 +587,7 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-sdb-reva.dtb \
 	imx7d-sdb-sht11.dtb \
 	imx7s-colibri-eval-v3.dtb \
+	imx7s-mba7.dtb \
 	imx7s-warp.dtb
 dtb-$(CONFIG_SOC_IMX7ULP) += \
 	imx7ulp-evk.dtb
diff --git a/arch/arm/boot/dts/imx7s-mba7.dts b/arch/arm/boot/dts/imx7s-mba7.dts
new file mode 100644
index 000000000000..a143d566a38b
--- /dev/null
+++ b/arch/arm/boot/dts/imx7s-mba7.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
+/*
+ * Device Tree Source for TQ Systems TQMa7S board on MBa7 carrier board.
+ *
+ * Copyright (C) 2016 TQ Systems GmbH
+ * Author: Markus Niebel <Markus.Niebel@tq-group.com>
+ * Copyright (C) 2019 Bruno Thomsen <bruno.thomsen@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "imx7s-tqma7.dtsi"
+#include "imx7-mba7.dtsi"
+
+/ {
+	model = "TQ Systems TQMa7S board on MBa7 carrier board";
+	compatible = "tq,imx7s-mba7", "fsl,imx7s";
+};
diff --git a/arch/arm/boot/dts/imx7s-tqma7.dtsi b/arch/arm/boot/dts/imx7s-tqma7.dtsi
new file mode 100644
index 000000000000..5f5433eb7dd7
--- /dev/null
+++ b/arch/arm/boot/dts/imx7s-tqma7.dtsi
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
+/*
+ * Device Tree Include file for TQ Systems TQMa7S board with NXP i.MX7Solo SoC.
+ *
+ * Copyright (C) 2016 TQ Systems GmbH
+ * Author: Markus Niebel <Markus.Niebel@tq-group.com>
+ * Copyright (C) 2019 Bruno Thomsen <bruno.thomsen@gmail.com>
+ */
+
+#include "imx7s.dtsi"
+#include "imx7-tqma7.dtsi"
-- 
2.20.1
