From: Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 3/4] ARM: dts: imx27: use lable to override osc26m clock
 setting
Date: Fri,  4 May 2018 08:57:25 +0800
Message-ID: <1525395446-1953-4-git-send-email-shawnguo@kernel.org>
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

Instead of copying the whole node hierarchy, let's define a label for
clock osc26m in soc dtsi and use it for overriding clock-frequency.

Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
 arch/arm/boot/dts/imx27-apf27.dts | 13 +++----------
 arch/arm/boot/dts/imx27.dtsi      |  2 +-
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/imx27-apf27.dts b/arch/arm/boot/dts/imx27-apf27.dts
index 66941cdbf244..3eddd805a793 100644
--- a/arch/arm/boot/dts/imx27-apf27.dts
+++ b/arch/arm/boot/dts/imx27-apf27.dts
@@ -22,17 +22,10 @@
 	memory@a0000000 {
 		reg = <0xa0000000 0x04000000>;
 	};
+};
 
-	clocks {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		osc26m {
-			compatible = "fsl,imx-osc26m", "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <0>;
-		};
-	};
+&clk_osc26m {
+	clock-frequency = <0>;
 };
 
 &iomuxc {
diff --git a/arch/arm/boot/dts/imx27.dtsi b/arch/arm/boot/dts/imx27.dtsi
index 389c9288b4ed..6c28b9cf802c 100644
--- a/arch/arm/boot/dts/imx27.dtsi
+++ b/arch/arm/boot/dts/imx27.dtsi
@@ -57,7 +57,7 @@
 	};
 
 	clocks {
-		osc26m {
+		clk_osc26m: osc26m {
 			compatible = "fsl,imx-osc26m", "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <26000000>;
-- 
1.9.1
