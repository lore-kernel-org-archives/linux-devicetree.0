From: Ran Wang <ran.wang_1@nxp.com>
Subject: [PATCH] arm64: dts: ls1028a: Add USB dt nodes
Date: Thu, 11 Apr 2019 05:27:44 +0000
Message-ID: <20190411052924.8730-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: Shawn Guo <shawnguo@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Ran Wang <ran.wang_1@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

This patch adds USB dt nodes for LS1028A.

Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index 8dd3501..d4bc314 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -144,6 +144,26 @@
 			clocks = <&sysclk>;
 		};
 
+		usb0:usb3@3100000 {
+			compatible= "snps,dwc3";
+			reg= <0x0 0x3100000 0x0 0x10000>;
+			interrupts= <0 80 0x4>;
+			dr_mode= "host";
+			snps,dis_rxdet_inp3_quirk;
+			snps,quirk-frame-length-adjustment = <0x20>;
+			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
+		};
+
+		usb1:usb3@3110000 {
+			compatible= "snps,dwc3";
+			reg= <0x0 0x3110000 0x0 0x10000>;
+			interrupts= <0 81 0x4>;
+			dr_mode= "host";
+			snps,dis_rxdet_inp3_quirk;
+			snps,quirk-frame-length-adjustment = <0x20>;
+			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
+		};
+
 		i2c0: i2c@2000000 {
 			compatible = "fsl,vf610-i2c";
 			#address-cells = <1>;
-- 
1.7.1
