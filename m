From: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 01/10] ARM: dts: imx6ul: phyboard-segin: Rename dts to PHYTEC
 name scheme
Date: Tue, 9 Jul 2019 09:19:18 +0200
Message-ID: <1562656767-273566-2-git-send-email-s.riedmueller@phytec.de>
References: <1562656767-273566-1-git-send-email-s.riedmueller@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1562656767-273566-1-git-send-email-s.riedmueller@phytec.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, martyn.welch@collabora.com, linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Use the same name scheme for the phyBOARD-Segin and the phyCORE-i.MX
6UL as is used for the PHYTEC phyBOARD-Mira and phyCORE-i.MX 6.

This is only a cosmetic change and there is no functional change
intended.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 arch/arm/boot/dts/Makefile                                        | 2 +-
 .../{imx6ul-phytec-pcl063.dtsi => imx6ul-phytec-phycore-som.dtsi} | 2 +-
 ...tec-phyboard-segin-full.dts => imx6ul-phytec-segin-ff-rdk.dts} | 8 ++++----
 ...ytec-peb-eval-01.dtsi => imx6ul-phytec-segin-peb-eval-01.dtsi} | 0
 ...imx6ul-phytec-phyboard-segin.dtsi => imx6ul-phytec-segin.dtsi} | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename arch/arm/boot/dts/{imx6ul-phytec-pcl063.dtsi => imx6ul-phytec-phycore-som.dtsi} (98%)
 rename arch/arm/boot/dts/{imx6ul-phytec-phyboard-segin-full.dts => imx6ul-phytec-segin-ff-rdk.dts} (84%)
 rename arch/arm/boot/dts/{imx6ul-phytec-peb-eval-01.dtsi => imx6ul-phytec-segin-peb-eval-01.dtsi} (100%)
 rename arch/arm/boot/dts/{imx6ul-phytec-phyboard-segin.dtsi => imx6ul-phytec-segin.dtsi} (99%)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index dab2914fa293..e1924b06f3cb 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -573,7 +573,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-opos6uldev.dtb \
 	imx6ul-pico-hobbit.dtb \
 	imx6ul-pico-pi.dtb \
-	imx6ul-phytec-phyboard-segin-full.dtb \
+	imx6ul-phytec-segin-ff-rdk.dtb \
 	imx6ul-tx6ul-0010.dtb \
 	imx6ul-tx6ul-0011.dtb \
 	imx6ul-tx6ul-mainboard.dtb \
diff --git a/arch/arm/boot/dts/imx6ul-phytec-pcl063.dtsi b/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi
similarity index 98%
rename from arch/arm/boot/dts/imx6ul-phytec-pcl063.dtsi
rename to arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi
index fc2997449b49..bff13d0eb064 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-pcl063.dtsi
+++ b/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi
@@ -10,7 +10,7 @@
 #include "imx6ul.dtsi"
 
 / {
-	model = "Phytec phyCORE i.MX6 UltraLite";
+	model = "PHYTEC phyCORE-i.MX6 UltraLite";
 	compatible = "phytec,imx6ul-pcl063", "fsl,imx6ul";
 
 	chosen {
diff --git a/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin-full.dts b/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk.dts
similarity index 84%
rename from arch/arm/boot/dts/imx6ul-phytec-phyboard-segin-full.dts
rename to arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk.dts
index b6a1407a9d44..1e59183a2f7c 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin-full.dts
+++ b/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk.dts
@@ -5,12 +5,12 @@
  */
 
 /dts-v1/;
-#include "imx6ul-phytec-pcl063.dtsi"
-#include "imx6ul-phytec-phyboard-segin.dtsi"
-#include "imx6ul-phytec-peb-eval-01.dtsi"
+#include "imx6ul-phytec-phycore-som.dtsi"
+#include "imx6ul-phytec-segin.dtsi"
+#include "imx6ul-phytec-segin-peb-eval-01.dtsi"
 
 / {
-	model = "Phytec phyBOARD-Segin i.MX6 UltraLite Full Featured";
+	model = "PHYTEC phyBOARD-Segin i.MX6 UltraLite Full Featured";
 	compatible = "phytec,imx6ul-pbacd10", "phytec,imx6ul-pcl063", "fsl,imx6ul";
 };
 
diff --git a/arch/arm/boot/dts/imx6ul-phytec-peb-eval-01.dtsi b/arch/arm/boot/dts/imx6ul-phytec-segin-peb-eval-01.dtsi
similarity index 100%
rename from arch/arm/boot/dts/imx6ul-phytec-peb-eval-01.dtsi
rename to arch/arm/boot/dts/imx6ul-phytec-segin-peb-eval-01.dtsi
diff --git a/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin.dtsi b/arch/arm/boot/dts/imx6ul-phytec-segin.dtsi
similarity index 99%
rename from arch/arm/boot/dts/imx6ul-phytec-phyboard-segin.dtsi
rename to arch/arm/boot/dts/imx6ul-phytec-segin.dtsi
index 7bf439a77d2c..78425c3290a1 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin.dtsi
+++ b/arch/arm/boot/dts/imx6ul-phytec-segin.dtsi
@@ -5,7 +5,7 @@
  */
 
 / {
-	model = "Phytec phyBOARD-Segin i.MX6 UltraLite";
+	model = "PHYTEC phyBOARD-Segin i.MX6 UltraLite";
 	compatible = "phytec,imx6ul-pbacd-10", "phytec,imx6ul-pcl063", "fsl,imx6ul";
 
 	aliases {
-- 
2.7.4
