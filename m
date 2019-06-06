From: =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>
Subject: [PATCH] ARM: dts: imx7ulp: add crypto support
Date: Thu,  6 Jun 2019 11:02:55 +0300
Message-ID: <20190606080255.25504-1-horia.geanta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, Franck Lenormand <franck.lenormand@nxp.com>, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Iuliana Prodan <iuliana.prodan@nxp.com>

Add crypto node in device tree for CAAM support.

Noteworthy is that on 7ulp the interrupt line is shared
between the two job rings.

Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Franck LENORMAND <franck.lenormand@nxp.com>
Signed-off-by: Horia Geantă <horia.geanta@nxp.com>
---

I've just realized that this patch should be merged through the crypto tree,
else bisectability could be affected due to cryptodev-2.6
commit 385cfc84a5a8 ("crypto: caam - disable some clock checks for iMX7ULP")
( https://patchwork.kernel.org/patch/10970017/ )
which should come first.

 arch/arm/boot/dts/imx7ulp.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
index d6b711011cba..e20483714be5 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -100,6 +100,29 @@
 		reg = <0x40000000 0x800000>;
 		ranges;
 
+		crypto: crypto@40240000 {
+			compatible = "fsl,sec-v4.0";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x40240000 0x10000>;
+			ranges = <0 0x40240000 0x10000>;
+			clocks = <&pcc2 IMX7ULP_CLK_CAAM>,
+				 <&scg1 IMX7ULP_CLK_NIC1_BUS_DIV>;
+			clock-names = "aclk", "ipg";
+
+			sec_jr0: jr0@1000 {
+				compatible = "fsl,sec-v4.0-job-ring";
+				reg = <0x1000 0x1000>;
+				interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			sec_jr1: jr1@2000 {
+				compatible = "fsl,sec-v4.0-job-ring";
+				reg = <0x2000 0x1000>;
+				interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		lpuart4: serial@402d0000 {
 			compatible = "fsl,imx7ulp-lpuart";
 			reg = <0x402d0000 0x1000>;
-- 
2.17.1
