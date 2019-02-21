From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH 10/14] arm64: dts: imx8qm: add conn ss support
Date: Thu, 21 Feb 2019 18:25:31 +0000
Message-ID: <1550773093-13349-11-git-send-email-aisheng.dong@nxp.com>
References: <1550773093-13349-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550773093-13349-1-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Mark Rutland <mark.rutland@arm.com>, "dongas86@gmail.com" <dongas86@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

The CONN SS of MX8QM is mostly the same as MX8QXP except it has one more
USB HSIC module support. So we can fully reuse the exist CONN SS dtsi.
Add <soc>-ss-conn.dtsi with compatible string updated according to
imx8-ss-conn.dtsi.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 93 +++++++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
new file mode 100644
index 0000000..68eaf7f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2019 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+&enet0_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&enet0_bypass_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&enet0_rgmii_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&enet1_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&enet1_bypass_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&enet1_rgmii_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&gpmi_bch_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&gpmi_bch_io_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&sdhc0_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&sdhc1_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&usb3_aclk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&usb3_bus_aclk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&usb3_lpm_aclk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&sdhc0_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&sdhc1_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&enet0_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&enet1_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&usdhc1 {
+	compatible = "fsl,imx8qm-usdhc", "fsl,imx7d-usdhc";
+};
+
+&usdhc2 {
+	compatible = "fsl,imx8qm-usdhc", "fsl,imx7d-usdhc";
+};
+
+&usdhc3 {
+	compatible = "fsl,imx8qm-usdhc", "fsl,imx7d-usdhc";
+};
+
+&fec1 {
+	compatible = "fsl,imx8qm-fec", "fsl,imx6sx-fec";
+};
+
+&fec2 {
+	compatible = "fsl,imx8qm-fec", "fsl,imx6sx-fec";
+};
-- 
2.7.4
