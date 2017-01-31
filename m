From: Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/2] ARM: dts: i.MX25: add AIPS control registers
Date: Tue, 31 Jan 2017 20:20:01 +0100
Message-ID: <1485890402-22974-1-git-send-email-martin@kaiser.cx>
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
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Martin Kaiser <martin@kaiser.cx>
List-Id: devicetree@vger.kernel.org

The i.MX25 contains two AHB to IP bridges (AIPS), each of which has a set of
control registers. Add the memory regions for the control registers to
the Device Tree.

All the registers from the i.MX53 AIPSTZ are present on the i.MX25 as
well. Indicate that we are compatible to fsl,imx53-aipstz. However,
don't use aipstz for our name, this seems to be specific to i.MX53.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 arch/arm/boot/dts/imx25.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/imx25.dtsi b/arch/arm/boot/dts/imx25.dtsi
index e0ba550..4c4768f 100644
--- a/arch/arm/boot/dts/imx25.dtsi
+++ b/arch/arm/boot/dts/imx25.dtsi
@@ -93,6 +93,11 @@
 			reg = <0x43f00000 0x100000>;
 			ranges;
 
+			aips1: bridge@43f00000 {
+				compatible = "fsl,imx25-aips", "fsl,imx53-aipstz";
+				reg = <0x43f00000 0x60>;
+			};
+
 			i2c1: i2c@43f80000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -342,6 +347,11 @@
 			reg = <0x53f00000 0x100000>;
 			ranges;
 
+			aips2: bridge@53f00000 {
+				compatible = "fsl,imx25-aips", "fsl,imx53-aipstz";
+				reg = <0x53f00000 0x60>;
+			};
+
 			clks: ccm@53f80000 {
 				compatible = "fsl,imx25-ccm";
 				reg = <0x53f80000 0x4000>;
-- 
2.1.4
