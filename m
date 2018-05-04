From: Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 1/4] ARM: dts: imx: drop unnecessary #address-cells/#size-cells
Date: Fri,  4 May 2018 08:57:23 +0800
Message-ID: <1525395446-1953-2-git-send-email-shawnguo@kernel.org>
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

It drops unnecessary #address-cells/#size-cells from <soc>.dtsi 'clocks'
node to fix DTC warning avoid_unnecessary_addr_size seen with W=1
switch.

Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
 arch/arm/boot/dts/imx25.dtsi   | 3 ---
 arch/arm/boot/dts/imx27.dtsi   | 3 ---
 arch/arm/boot/dts/imx50.dtsi   | 3 ---
 arch/arm/boot/dts/imx51.dtsi   | 3 ---
 arch/arm/boot/dts/imx53.dtsi   | 3 ---
 arch/arm/boot/dts/imx6qdl.dtsi | 3 ---
 arch/arm/boot/dts/imx6sl.dtsi  | 3 ---
 7 files changed, 21 deletions(-)

diff --git a/arch/arm/boot/dts/imx25.dtsi b/arch/arm/boot/dts/imx25.dtsi
index cf70df20b19c..67606dd334bf 100644
--- a/arch/arm/boot/dts/imx25.dtsi
+++ b/arch/arm/boot/dts/imx25.dtsi
@@ -70,9 +70,6 @@
 	};
 
 	clocks {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		osc {
 			compatible = "fsl,imx-osc", "fixed-clock";
 			#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/imx27.dtsi b/arch/arm/boot/dts/imx27.dtsi
index 6585b00c3917..389c9288b4ed 100644
--- a/arch/arm/boot/dts/imx27.dtsi
+++ b/arch/arm/boot/dts/imx27.dtsi
@@ -57,9 +57,6 @@
 	};
 
 	clocks {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		osc26m {
 			compatible = "fsl,imx-osc26m", "fixed-clock";
 			#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/imx50.dtsi b/arch/arm/boot/dts/imx50.dtsi
index 7954e79d0a16..a9b712db9f6c 100644
--- a/arch/arm/boot/dts/imx50.dtsi
+++ b/arch/arm/boot/dts/imx50.dtsi
@@ -60,9 +60,6 @@
 	};
 
 	clocks {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		ckil {
 			compatible = "fsl,imx-ckil", "fixed-clock";
 			#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/imx51.dtsi b/arch/arm/boot/dts/imx51.dtsi
index 5d390a64e976..b5db83cd7439 100644
--- a/arch/arm/boot/dts/imx51.dtsi
+++ b/arch/arm/boot/dts/imx51.dtsi
@@ -56,9 +56,6 @@
 	};
 
 	clocks {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		ckil {
 			compatible = "fsl,imx-ckil", "fixed-clock";
 			#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index 7d647d043f52..d0db80150db7 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -88,9 +88,6 @@
 	};
 
 	clocks {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		ckil {
 			compatible = "fsl,imx-ckil", "fixed-clock";
 			#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 5332fe78cc8a..69648e205dca 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -58,9 +58,6 @@
 	};
 
 	clocks {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		ckil {
 			compatible = "fsl,imx-ckil", "fixed-clock";
 			#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index ab6a7e2e7e8f..2002db2feb00 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -86,9 +86,6 @@
 	};
 
 	clocks {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		ckil {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
-- 
1.9.1
