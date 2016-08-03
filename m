From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Subject: [PATCH 2/2] imx53.dtsi : Add DMA configuration for UART
Date: Wed,  3 Aug 2016 16:13:13 +0200
Message-ID: <1470233593-4513-2-git-send-email-fabien.lahoudere@collabora.co.uk>
References: <1470233593-4513-1-git-send-email-fabien.lahoudere@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470233593-4513-1-git-send-email-fabien.lahoudere@collabora.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

In order to use sdma with UART, we need to add DMA configuration in device tree.

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
---
 arch/arm/boot/dts/imx53.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index cd17037..de545e2 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -217,6 +217,8 @@
 					clocks = <&clks IMX5_CLK_UART3_IPG_GATE>,
 					         <&clks IMX5_CLK_UART3_PER_GATE>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma 42 4 0>, <&sdma 43 4 0>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 
@@ -508,6 +510,8 @@
 				clocks = <&clks IMX5_CLK_UART2_IPG_GATE>,
 				         <&clks IMX5_CLK_UART2_PER_GATE>;
 				clock-names = "ipg", "per";
+				dmas = <&sdma 12 4 0>, <&sdma 13 4 0>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -591,6 +595,8 @@
 				clocks = <&clks IMX5_CLK_UART4_IPG_GATE>,
 				         <&clks IMX5_CLK_UART4_PER_GATE>;
 				clock-names = "ipg", "per";
+				dmas = <&sdma 2 4 0>, <&sdma 3 4 0>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 		};
@@ -621,6 +627,8 @@
 				clocks = <&clks IMX5_CLK_UART5_IPG_GATE>,
 				         <&clks IMX5_CLK_UART5_PER_GATE>;
 				clock-names = "ipg", "per";
+				dmas = <&sdma 16 4 0>, <&sdma 17 4 0>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
-- 
2.7.4
