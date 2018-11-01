From: Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] ARM: dts: i.MX25: add the clocks for the EPIT blocks
Date: Thu,  1 Nov 2018 18:32:47 +0100
Message-ID: <1541093567-29205-1-git-send-email-martin@kaiser.cx>
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
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Martin Kaiser <martin@kaiser.cx>
List-Id: devicetree@vger.kernel.org

The i.MX25 contains two EPIT (Enhanced Periodic Interrupt Timer)
function blocks. Add their ipg and per clocks to the device tree.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---

I tried to make this similar to gpt1 and gpt2.

 arch/arm/boot/dts/imx25.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx25.dtsi b/arch/arm/boot/dts/imx25.dtsi
index b25309d26ea5..e80101847aff 100644
--- a/arch/arm/boot/dts/imx25.dtsi
+++ b/arch/arm/boot/dts/imx25.dtsi
@@ -388,12 +388,16 @@
 			epit1: timer@53f94000 {
 				compatible = "fsl,imx25-epit";
 				reg = <0x53f94000 0x4000>;
+				clocks = <&clks 83>, <&clks 43>;
+				clock-names = "ipg", "per";
 				interrupts = <28>;
 			};
 
 			epit2: timer@53f98000 {
 				compatible = "fsl,imx25-epit";
 				reg = <0x53f98000 0x4000>;
+				clocks = <&clks 84>, <&clks 43>;
+				clock-names = "ipg", "per";
 				interrupts = <27>;
 			};
 
-- 
2.1.4
