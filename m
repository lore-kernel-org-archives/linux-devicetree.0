From: Alison Chaiken <alison_chaiken@mentor.com>
Subject: [PATCH v2 1/2] ARM: dts: imx6qdl-sabreauto: assert GPIO at boot in
 order to connect NOR
Date: Tue, 8 Dec 2015 15:48:39 -0800
Message-ID: <1449618520-3432-2-git-send-email-alison_chaiken@mentor.com>
References: <20151207082440.GY11966@pengutronix.de>
 <1449618520-3432-1-git-send-email-alison_chaiken@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1449618520-3432-1-git-send-email-alison_chaiken@mentor.com>
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
Cc: devicetree@vger.kernel.org, alison@she-devel.com, rowand.list@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org, alison_chaiken@mentor.com
List-Id: devicetree@vger.kernel.org

PAD_EIM_D18 must be pulled low at boot in order for the parallel NOR
connected to the EIM switch to probe properly.  Otherwise the imx-weim
device will register properly, but cfi_qry_present() will return
"U-V-]" rather than "Q-R-Y".  Employ the gpio-initval mechanism in
GPIO5 node in the SabreAuto device-tree in order to set the pin.

Signed-off-by: Alison Chaiken <alison_chaiken@mentor.com>
---
 arch/arm/boot/dts/imx6qdl-sabreauto-eim-nor.dtsi | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6qdl-sabreauto-eim-nor.dtsi

diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto-eim-nor.dtsi b/arch/arm/boot/dts/imx6qdl-sabreauto-eim-nor.dtsi
new file mode 100644
index 0000000..66a9aa2
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-sabreauto-eim-nor.dtsi
@@ -0,0 +1,43 @@
+/*
+ * Copyright 2012 Freescale Semiconductor, Inc.
+ * Copyright 2011 Linaro Ltd.
+ * Copyright (c) 2012-2015 Mentor Graphics Inc.
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+&weim {
+	status = "okay";
+};
+
+&gpio5 {
+	p4 {
+		/* Select NOR or I2C3 via setting of port-expander
+		 * steering logic.
+		 * Low: Attach p-NOR line D18.
+		 * High: Attach I2C3 line SDA.
+		 */
+		gpio-initval;
+		gpios = <4 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "SelNORorI2C3";
+	};
+};
+
+&i2c3 {
+	status = "disabled";
+};
+
+/* the following devices have pinmux conflicts with NOR */
+&uart3 {
+	status = "disabled";
+};
+
+&ecspi1 {
+	status = "disabled";
+};
-- 
2.6.2
