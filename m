From: <yinbo.zhu@nxp.com>
Subject: [PATCH] usb: dts: fix the issue that usb is not detected on ls1088ardb
Date: Thu, 20 Jul 2017 10:38:26 +0800
Message-ID: <1500518306-9879-1-git-send-email-yinbo.zhu@nxp.com>
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
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mihai Bantea <mihai.bantea@nxp.com>, =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>, Marc Zyngier <marc.zyngier@arm.com>, Liu Gang <Gang.Liu@nxp.com>, open list <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>, Tang Yuantian <Yuantian.Tang@nxp.com>, York Sun <york.sun@nxp.com>, "yinbo.zhu" <yinbo.zhu@nxp.com>, "moderated
 list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

From: "yinbo.zhu" <yinbo.zhu@nxp.com>

Signed-off-by: yinbo.zhu <yinbo.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts |  8 ++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi    | 18 ++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index e9276a5..d5c3d96 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -149,6 +149,14 @@
 	status = "okay";
 };
 
+&usb0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
+
 &emdio1 {
 	/* Freescale F104 PHY1 */
 	mdio1_phy1: emdio1_phy@1 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 3a3be87..65b3059 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -566,6 +566,24 @@
 			fsl,qspi-has-second-chip;
 		};
 
+		usb0: usb3@3100000 {
+			compatible = "snps,dwc3";
+			reg = <0x0 0x3100000 0x0 0x10000>;
+			interrupts = <0 80 0x4>; /* Level high type */
+			dr_mode = "host";
+			configure-gfladj;
+			snps,dis_rxdet_inp3_quirk;
+		};
+
+		usb1: usb3@3110000 {
+			compatible = "snps,dwc3";
+			reg = <0x0 0x3110000 0x0 0x10000>;
+			interrupts = <0 81 0x4>; /* Level high type */
+			dr_mode = "host";
+			configure-gfladj;
+			snps,dis_rxdet_inp3_quirk;
+		};
+
 		pcie@3400000 {
 			compatible = "fsl,ls2088a-pcie", "fsl,ls1088a-pcie",
 				     "snps,dw-pcie";
-- 
2.1.0.27.g96db324
