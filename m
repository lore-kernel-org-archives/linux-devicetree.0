From: Michael Trimarchi <michael@amarulasolutions.com>
Subject: [PATCH V2 3/4] ARM: dts: imx6ul: Add GPMI nand controller support
Date: Sun, 21 Feb 2016 12:29:53 +0100
Message-ID: <20160221112949.GB5387@panicking>
References: <1455963652-24618-1-git-send-email-michael@amarulasolutions.com>
 <1455963652-24618-4-git-send-email-michael@amarulasolutions.com>
 <CAOMZO5DTmG7Umt+H20r+tZi9zZhsK=eoPbHOBO3iwvM2GXXLgg@mail.gmail.com>
 <20160220172127.GC24064@panicking>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20160220172127.GC24064@panicking>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Brian Norris <computersforpeace@gmail.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Add support for GPMI nand controller.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
Changes V2:
	- drop special IMXUL type because seems that is compatible
	  with IMX6Q

 arch/arm/boot/dts/imx6ul.dtsi | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index f4daf97..1a486ac 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -142,6 +142,39 @@
 			reg = <0x00900000 0x20000>;
 		};
 
+		dma_apbh: dma-apbh@01804000 {
+			compatible = "fsl,imx6ul-dma-apbh", "fsl,imx28-dma-apbh";
+			reg = <0x01804000 0x2000>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "gpmi0", "gpmi1", "gpmi2", "gpmi3";
+			#dma-cells = <1>;
+			dma-channels = <4>;
+			clocks = <&clks IMX6UL_CLK_APBHDMA>;
+		};
+
+		gpmi: gpmi-nand@01806000 {
+			compatible = "fsl,imx6q-gpmi-nand";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x01806000 0x2000>, <0x01808000 0x4000>;
+			reg-names = "gpmi-nand", "bch";
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "bch";
+			clocks = <&clks IMX6UL_CLK_GPMI_IO>,
+				 <&clks IMX6UL_CLK_GPMI_APB>,
+				 <&clks IMX6UL_CLK_GPMI_BCH>,
+				 <&clks IMX6UL_CLK_GPMI_BCH_APB>,
+				 <&clks IMX6UL_CLK_PER_BCH>;
+			clock-names = "gpmi_io", "gpmi_apb", "gpmi_bch",
+				      "gpmi_bch_apb", "per1_bch";
+			dmas = <&dma_apbh 0>;
+			dma-names = "rx-tx";
+			status = "disabled";
+		};
+
 		aips1: aips-bus@02000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
-- 
2.7.0

-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
