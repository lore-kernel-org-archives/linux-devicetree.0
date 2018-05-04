From: Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 2/4] ARM: dts: imx1: move clk32 clock into soc dtsi
Date: Fri,  4 May 2018 08:57:24 +0800
Message-ID: <1525395446-1953-3-git-send-email-shawnguo@kernel.org>
References: <1525395446-1953-1-git-send-email-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1525395446-1953-1-git-send-email-shawnguo@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

The clk32 clock is an input clock to CCM module, and should be defined
in soc dtsi rather than a board level dts.  Let's move it into
imx1.dtsi.

While at it, let's drop unnecessary #address-cells/#size-cells from
'clocks' node to DTC warning avoid_unnecessary_addr_size seen with W=1
switch.

Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
 arch/arm/boot/dts/imx1-ads.dts | 11 -----------
 arch/arm/boot/dts/imx1.dtsi    |  8 ++++++++
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/imx1-ads.dts b/arch/arm/boot/dts/imx1-ads.dts
index 6354e4c87313..a1d81badb5c8 100644
--- a/arch/arm/boot/dts/imx1-ads.dts
+++ b/arch/arm/boot/dts/imx1-ads.dts
@@ -23,17 +23,6 @@
 	memory@8000000 {
 		reg = <0x08000000 0x04000000>;
 	};
-
-	clocks {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32 {
-			compatible = "fsl,imx-clk32", "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <32000>;
-		};
-	};
 };
 
 &cspi1 {
diff --git a/arch/arm/boot/dts/imx1.dtsi b/arch/arm/boot/dts/imx1.dtsi
index f7b9edf93f5e..78cba9435f8e 100644
--- a/arch/arm/boot/dts/imx1.dtsi
+++ b/arch/arm/boot/dts/imx1.dtsi
@@ -62,6 +62,14 @@
 		};
 	};
 
+	clocks {
+		clk32 {
+			compatible = "fsl,imx-clk32", "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32000>;
+		};
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.9.1
