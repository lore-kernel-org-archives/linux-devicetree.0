From: Changming Huang <jerry.huang@nxp.com>
Subject: [PATCH] fsl/usb: Add USB node in FSL's ls1012a DTS
Date: Thu, 8 Dec 2016 14:06:08 +0800
Message-ID: <1481177168-11347-1-git-send-email-jerry.huang@nxp.com>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, scott.wood@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Changming Huang <jerry.huang@nxp.com>
List-Id: devicetree@vger.kernel.org

Add USB node in ls1012a device tree

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
---
Dependence on patch "[v3] arm64: Add DTS support for FSL's LS1012A SoC".
https://patchwork.kernel.org/patch/9462399/

 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index 92e64f3..3e4bda6 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -235,6 +235,23 @@
 				 <&clockgen 4 3>;
 		};
 
+		usb0: usb3@2f00000 {
+			compatible = "snps,dwc3";
+			reg = <0x0 0x2f00000 0x0 0x10000>;
+			interrupts = <0 60 0x4>;
+			dr_mode = "host";
+			snps,quirk-frame-length-adjustment = <0x20>;
+			snps,dis_rxdet_inp3_quirk;
+		};
+
+		usb1: usb2@8600000 {
+			compatible = "fsl-usb2-dr-v2.5", "fsl-usb2-dr";
+			reg = <0x0 0x8600000 0x0 0x1000>;
+			interrupts = <0 139 0x4>;
+			dr_mode = "host";
+			phy_type = "ulpi";
+		};
+
 		sata: sata@3200000 {
 			compatible = "fsl,ls1012a-ahci", "fsl,ls1043a-ahci";
 			reg = <0x0 0x3200000 0x0 0x10000>;
-- 
1.7.9.5
