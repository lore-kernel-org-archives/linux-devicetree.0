From: Anson Huang <b20788@freescale.com>
Subject: [PATCH V2 2/3] ARM: dts: imx6: make gpt per clock can be from OSC
Date: Fri, 5 Sep 2014 11:26:45 +0800
Message-ID: <1409887606-22388-3-git-send-email-b20788@freescale.com>
References: <1409887606-22388-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1409887606-22388-1-git-send-email-b20788@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawn.guo@linaro.org, festevam@gmail.com, kernel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Original gpt per clk parent is from ipg_per clk which
may be scaled when system enter low bus mode, as ipg
clk will be lower in low bus mode, to keep system clk
NOT drift, select gpt per clk parent from OSC which
is at fixed freq always.

On i.mx6qdl, add a osc_per clk source for i.mx6q
TO > 1.0 and all i.MX6dl SoC.

On i.mx6sx, just make gpt per clk from OSC.

Signed-off-by: Anson Huang <b20788@freescale.com>
---
change log from v1 -> v2
	on i.mx6q TO1.0, there is no OSC clk source for
	gpt per, so I have to add a new clk source of
	osc_per for gpt to cover i.mx6q TO1.0.

 arch/arm/boot/dts/imx6qdl.dtsi |    5 +++--
 arch/arm/boot/dts/imx6sx.dtsi  |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 70d7207..8de2801 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -401,8 +401,9 @@
 				reg = <0x02098000 0x4000>;
 				interrupts = <0 55 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6QDL_CLK_GPT_IPG>,
-					 <&clks IMX6QDL_CLK_GPT_IPG_PER>;
-				clock-names = "ipg", "per";
+					 <&clks IMX6QDL_CLK_GPT_IPG_PER>,
+					 <&clks IMX6QDL_CLK_GPT_3M>;
+				clock-names = "ipg", "per", "osc_per";
 			};
 
 			gpio1: gpio@0209c000 {
diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 63d9d82..b5d8252 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -421,7 +421,7 @@
 				reg = <0x02098000 0x4000>;
 				interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SX_CLK_GPT_BUS>,
-					 <&clks IMX6SX_CLK_GPT_SERIAL>;
+					 <&clks IMX6SX_CLK_GPT_3M>;
 				clock-names = "ipg", "per";
 			};
 
-- 
1.7.9.5
