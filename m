From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH 09/14] arm64: dts: imx8qm: add lsio ss support
Date: Thu, 21 Feb 2019 18:25:26 +0000
Message-ID: <1550773093-13349-10-git-send-email-aisheng.dong@nxp.com>
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

The LSIO SS of MX8QM is exactly the same as MX8QXP. So we can fully
reuse the exist LSIO SS dtsi. Add <soc>-ss-lsio.dtsi with compatible
string updated according to imx8-ss-lsio.dtsi.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi | 145 ++++++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
new file mode 100644
index 0000000..9ea772b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2019 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+&fspi0_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&fspi1_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&gpt0_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&gpt1_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&gpt2_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&gpt3_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&gpt4_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&pwm0_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&pwm1_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&pwm2_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&pwm3_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&pwm4_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&pwm5_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&pwm6_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&pwm7_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&pwm0_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&pwm1_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&pwm2_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&pwm3_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&pwm4_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&pwm5_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&pwm6_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&pwm7_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&lsio_mu0 {
+	compatible = "fsl,imx8m-mu", "fsl,imx6sx-mu";
+};
+
+&lsio_mu1 {
+	compatible = "fsl,imx8qm-mu", "fsl,imx6sx-mu";
+};
+
+&lsio_mu3 {
+	compatible = "fsl,imx8qm-mu", "fsl,imx6sx-mu";
+};
+
+&lsio_mu4 {
+	compatible = "fsl,imx8qm-mu", "fsl,imx6sx-mu";
+};
+
+&lsio_gpio0 {
+	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+};
+
+&lsio_gpio1 {
+	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+};
+
+&lsio_gpio2 {
+	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+};
+
+&lsio_gpio3 {
+	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+};
+
+&lsio_gpio4 {
+	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+};
+
+&lsio_gpio5 {
+	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+};
+
+&lsio_gpio6 {
+	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+};
+
+&lsio_gpio7 {
+	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+};
-- 
2.7.4
