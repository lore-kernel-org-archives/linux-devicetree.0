From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 2/3] ARM: dts: imx: Use generic uart-has-rtscts DT property
Date: Tue, 31 May 2016 16:31:51 +0200
Message-ID: <1464705112-21609-3-git-send-email-geert+renesas@glider.be>
References: <1464705112-21609-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464705112-21609-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As of commit 1006ed7e1b258dac ("serial: imx: Use generic uart-has-rtscts
DT property"), the Freescale IMX UART driver recognizes the generic
"uart-has-rtscts" DT property, deprecating the vendor-specific
"fsl,uart-has-rtscts" DT property. Hence replace the latter by the
former in all DTS files.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/imx1-ads.dts                         | 4 ++--
 arch/arm/boot/dts/imx1-apf9328.dts                     | 4 ++--
 arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dts | 4 ++--
 arch/arm/boot/dts/imx25-pdk.dts                        | 2 +-
 arch/arm/boot/dts/imx27-eukrea-cpuimx27.dtsi           | 2 +-
 arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dts | 6 +++---
 arch/arm/boot/dts/imx27-pdk.dts                        | 2 +-
 arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts       | 6 +++---
 arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts         | 4 ++--
 arch/arm/boot/dts/imx31-bug.dts                        | 2 +-
 arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts | 4 ++--
 arch/arm/boot/dts/imx35-pdk.dts                        | 2 +-
 arch/arm/boot/dts/imx51-babbage.dts                    | 4 ++--
 arch/arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dts | 4 ++--
 arch/arm/boot/dts/imx53-smd.dts                        | 2 +-
 arch/arm/boot/dts/imx53-tqma53.dtsi                    | 2 +-
 arch/arm/boot/dts/imx53-tx53.dtsi                      | 6 +++---
 arch/arm/boot/dts/imx6q-arm2.dts                       | 2 +-
 arch/arm/boot/dts/imx6q-ba16.dtsi                      | 2 +-
 arch/arm/boot/dts/imx6qdl-apalis.dtsi                  | 4 ++--
 arch/arm/boot/dts/imx6qdl-apf6dev.dtsi                 | 2 +-
 arch/arm/boot/dts/imx6qdl-aristainetos.dtsi            | 4 ++--
 arch/arm/boot/dts/imx6qdl-aristainetos2.dtsi           | 4 ++--
 arch/arm/boot/dts/imx6qdl-microsom.dtsi                | 2 +-
 arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi               | 2 +-
 arch/arm/boot/dts/imx6qdl-tx6.dtsi                     | 6 +++---
 arch/arm/boot/dts/imx6qdl-wandboard.dtsi               | 2 +-
 arch/arm/boot/dts/imx6sl-warp.dts                      | 2 +-
 arch/arm/boot/dts/imx6sx-nitrogen6sx.dts               | 2 +-
 arch/arm/boot/dts/imx6sx-sdb.dtsi                      | 2 +-
 arch/arm/boot/dts/imx6ul-14x14-evk.dts                 | 2 +-
 arch/arm/boot/dts/imx6ul-pico-hobbit.dts               | 2 +-
 arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts           | 4 ++--
 arch/arm/boot/dts/imx6ul-tx6ul.dtsi                    | 6 +++---
 arch/arm/boot/dts/imx7d-nitrogen7.dts                  | 2 +-
 35 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/arch/arm/boot/dts/imx1-ads.dts b/arch/arm/boot/dts/imx1-ads.dts
index af4eee5794aa2123..f50498659cc3e09e 100644
--- a/arch/arm/boot/dts/imx1-ads.dts
+++ b/arch/arm/boot/dts/imx1-ads.dts
@@ -66,14 +66,14 @@
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx1-apf9328.dts b/arch/arm/boot/dts/imx1-apf9328.dts
index 07d92fb40e6f7b16..e8b4b52c2418fed6 100644
--- a/arch/arm/boot/dts/imx1-apf9328.dts
+++ b/arch/arm/boot/dts/imx1-apf9328.dts
@@ -34,14 +34,14 @@
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dts b/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dts
index cda6907a27b9bf18..9300711f1ea379a3 100644
--- a/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dts
+++ b/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dts
@@ -161,14 +161,14 @@
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx25-pdk.dts b/arch/arm/boot/dts/imx25-pdk.dts
index 9351296356dcc419..70292101ba038b71 100644
--- a/arch/arm/boot/dts/imx25-pdk.dts
+++ b/arch/arm/boot/dts/imx25-pdk.dts
@@ -298,7 +298,7 @@
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx27-eukrea-cpuimx27.dtsi b/arch/arm/boot/dts/imx27-eukrea-cpuimx27.dtsi
index e2242638ea0b1280..2cf896c505f9fd70 100644
--- a/arch/arm/boot/dts/imx27-eukrea-cpuimx27.dtsi
+++ b/arch/arm/boot/dts/imx27-eukrea-cpuimx27.dtsi
@@ -77,7 +77,7 @@
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dts b/arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dts
index 2ab65fc4c1e1a8fd..27846ff9bb0dc748 100644
--- a/arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dts
+++ b/arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dts
@@ -140,21 +140,21 @@
 };
 
 &uart1 {
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
 	status = "okay";
 };
 
 &uart2 {
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
 	status = "okay";
 };
 
 &uart3 {
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/imx27-pdk.dts b/arch/arm/boot/dts/imx27-pdk.dts
index 49450dbbcab8ca70..d0ef496a1af862a4 100644
--- a/arch/arm/boot/dts/imx27-pdk.dts
+++ b/arch/arm/boot/dts/imx27-pdk.dts
@@ -106,7 +106,7 @@
 };
 
 &uart1 {
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts b/arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts
index 7c869fe3c30bdf12..bfd4946cf9fe7ebc 100644
--- a/arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts
+++ b/arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts
@@ -147,21 +147,21 @@
 };
 
 &uart1 {
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
 	status = "okay";
 };
 
 &uart2 {
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
 	status = "okay";
 };
 
 &uart3 {
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts b/arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts
index 538568b0de263eb9..cf09e72aeb068adb 100644
--- a/arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts
+++ b/arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts
@@ -283,14 +283,14 @@
 };
 
 &uart1 {
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
 	status = "okay";
 };
 
 &uart2 {
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/imx31-bug.dts b/arch/arm/boot/dts/imx31-bug.dts
index 2424abfc9c7b5959..ae6cebbed84b8c64 100644
--- a/arch/arm/boot/dts/imx31-bug.dts
+++ b/arch/arm/boot/dts/imx31-bug.dts
@@ -22,6 +22,6 @@
 };
 
 &uart5 {
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts b/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts
index 4727bbb804e1266a..e9357131b026e331 100644
--- a/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts
+++ b/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts
@@ -139,14 +139,14 @@
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx35-pdk.dts b/arch/arm/boot/dts/imx35-pdk.dts
index 8d715523708ffda4..9bb628f22502972c 100644
--- a/arch/arm/boot/dts/imx35-pdk.dts
+++ b/arch/arm/boot/dts/imx35-pdk.dts
@@ -63,6 +63,6 @@
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/imx51-babbage.dts b/arch/arm/boot/dts/imx51-babbage.dts
index 018d24eb9965f806..f097b4f29ab49365 100644
--- a/arch/arm/boot/dts/imx51-babbage.dts
+++ b/arch/arm/boot/dts/imx51-babbage.dts
@@ -388,7 +388,7 @@
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
@@ -401,7 +401,7 @@
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dts b/arch/arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dts
index d270df3e58917aab..728212861ece2422 100644
--- a/arch/arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dts
+++ b/arch/arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dts
@@ -261,14 +261,14 @@
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3 &pinctrl_uart3_rtscts>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx53-smd.dts b/arch/arm/boot/dts/imx53-smd.dts
index 542ab9e697fb4c5a..9f51900405550d8e 100644
--- a/arch/arm/boot/dts/imx53-smd.dts
+++ b/arch/arm/boot/dts/imx53-smd.dts
@@ -56,7 +56,7 @@
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx53-tqma53.dtsi b/arch/arm/boot/dts/imx53-tqma53.dtsi
index e03373a58760ff79..91a6a9ff50d7ef5f 100644
--- a/arch/arm/boot/dts/imx53-tqma53.dtsi
+++ b/arch/arm/boot/dts/imx53-tqma53.dtsi
@@ -218,7 +218,7 @@
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "disabled";
 };
 
diff --git a/arch/arm/boot/dts/imx53-tx53.dtsi b/arch/arm/boot/dts/imx53-tx53.dtsi
index bd3dfefa5778acbc..57e75f1639e09b13 100644
--- a/arch/arm/boot/dts/imx53-tx53.dtsi
+++ b/arch/arm/boot/dts/imx53-tx53.dtsi
@@ -513,21 +513,21 @@
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6q-arm2.dts b/arch/arm/boot/dts/imx6q-arm2.dts
index d6515f7a56c427bc..77191d60f19744f3 100644
--- a/arch/arm/boot/dts/imx6q-arm2.dts
+++ b/arch/arm/boot/dts/imx6q-arm2.dts
@@ -218,7 +218,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
 	fsl,dte-mode;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6q-ba16.dtsi b/arch/arm/boot/dts/imx6q-ba16.dtsi
index f7e17e2004acb786..f2adc60723da2f00 100644
--- a/arch/arm/boot/dts/imx6q-ba16.dtsi
+++ b/arch/arm/boot/dts/imx6q-ba16.dtsi
@@ -351,7 +351,7 @@
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
index 922b1dd06fda8313..315e033ff1d8d5b3 100644
--- a/arch/arm/boot/dts/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
@@ -423,7 +423,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1_dte &pinctrl_uart1_ctrl>;
 	fsl,dte-mode;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "disabled";
 };
 
@@ -431,7 +431,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2_dte>;
 	fsl,dte-mode;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "disabled";
 };
 
diff --git a/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi b/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
index 865c9a264a4350e3..edbce222c7826d82 100644
--- a/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
@@ -254,7 +254,7 @@
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3 &pinctrl_gsm>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6qdl-aristainetos.dtsi b/arch/arm/boot/dts/imx6qdl-aristainetos.dtsi
index ecbc6eba6a2c14f9..54f4f0193f2b26a2 100644
--- a/arch/arm/boot/dts/imx6qdl-aristainetos.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-aristainetos.dtsi
@@ -143,14 +143,14 @@
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
 &uart5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart5>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6qdl-aristainetos2.dtsi b/arch/arm/boot/dts/imx6qdl-aristainetos2.dtsi
index 7d81100e7d47572d..7fff02c406f22b8b 100644
--- a/arch/arm/boot/dts/imx6qdl-aristainetos2.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-aristainetos2.dtsi
@@ -351,7 +351,7 @@
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
@@ -364,7 +364,7 @@
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6qdl-microsom.dtsi b/arch/arm/boot/dts/imx6qdl-microsom.dtsi
index 86460e46d0559b77..3d62401dbd7fe538 100644
--- a/arch/arm/boot/dts/imx6qdl-microsom.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-microsom.dtsi
@@ -143,7 +143,7 @@
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_microsom_brcm_bt &pinctrl_microsom_uart4>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi b/arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi
index e456b5cc1b03da90..00f7202ddb1605e7 100644
--- a/arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi
@@ -591,7 +591,7 @@
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/imx6qdl-tx6.dtsi
index 39b85aef93e1329d..ac9529f855930ce3 100644
--- a/arch/arm/boot/dts/imx6qdl-tx6.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-tx6.dtsi
@@ -689,21 +689,21 @@
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1 &pinctrl_uart1_rtscts>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2 &pinctrl_uart2_rtscts>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3 &pinctrl_uart3_rtscts>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
index 8e7c40e114ddebf5..f262db3428a9f7d2 100644
--- a/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
@@ -233,7 +233,7 @@
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6sl-warp.dts b/arch/arm/boot/dts/imx6sl-warp.dts
index 058bcdceb81aa187..72c7745f51d3304c 100644
--- a/arch/arm/boot/dts/imx6sl-warp.dts
+++ b/arch/arm/boot/dts/imx6sl-warp.dts
@@ -84,7 +84,7 @@
 &uart5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart5>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6sx-nitrogen6sx.dts b/arch/arm/boot/dts/imx6sx-nitrogen6sx.dts
index ba62348d8284fac3..9b817f3501a66a3c 100644
--- a/arch/arm/boot/dts/imx6sx-nitrogen6sx.dts
+++ b/arch/arm/boot/dts/imx6sx-nitrogen6sx.dts
@@ -326,7 +326,7 @@
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6sx-sdb.dtsi b/arch/arm/boot/dts/imx6sx-sdb.dtsi
index e5eafe4d9a701afa..fcbaccf73e106b39 100644
--- a/arch/arm/boot/dts/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/imx6sx-sdb.dtsi
@@ -273,7 +273,7 @@
 &uart5 { /* for bluetooth */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart5>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6ul-14x14-evk.dts b/arch/arm/boot/dts/imx6ul-14x14-evk.dts
index 668a729975901552..6116627277ad1fd8 100644
--- a/arch/arm/boot/dts/imx6ul-14x14-evk.dts
+++ b/arch/arm/boot/dts/imx6ul-14x14-evk.dts
@@ -171,7 +171,7 @@
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
index 8ce1fec36e86bb0d..e5bff4bb9be0d197 100644
--- a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
+++ b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
@@ -286,7 +286,7 @@
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts b/arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts
index d25899b71575d838..7c5dd1b316ca1431 100644
--- a/arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts
+++ b/arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts
@@ -146,12 +146,12 @@
 
 &uart1 {
 	pinctrl-0 = <&pinctrl_uart1>;
-	/delete-property/ fsl,uart-has-rtscts;
+	/delete-property/ uart-has-rtscts;
 };
 
 &uart2 {
 	pinctrl-0 = <&pinctrl_uart2>;
-	/delete-property/ fsl,uart-has-rtscts;
+	/delete-property/ uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/imx6ul-tx6ul.dtsi
index 437e9aad5920ae84..530e9ca13a7416ea 100644
--- a/arch/arm/boot/dts/imx6ul-tx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul-tx6ul.dtsi
@@ -563,21 +563,21 @@
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1 &pinctrl_uart1_rtscts>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2 &pinctrl_uart2_rtscts>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
 &uart5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart5 &pinctrl_uart5_rtscts>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx7d-nitrogen7.dts b/arch/arm/boot/dts/imx7d-nitrogen7.dts
index 1ce97800f0c5b29c..bef394ea3bd8a566 100644
--- a/arch/arm/boot/dts/imx7d-nitrogen7.dts
+++ b/arch/arm/boot/dts/imx7d-nitrogen7.dts
@@ -392,7 +392,7 @@
 	pinctrl-0 = <&pinctrl_uart6>;
 	assigned-clocks = <&clks IMX7D_UART6_ROOT_SRC>;
 	assigned-clock-parents = <&clks IMX7D_PLL_SYS_MAIN_240M_CLK>;
-	fsl,uart-has-rtscts;
+	uart-has-rtscts;
 	status = "okay";
 };
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
