From: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 02/10] ARM: dts: imx6ul: segin: Add boot media to dts filename
Date: Tue, 9 Jul 2019 09:19:19 +0200
Message-ID: <1562656767-273566-3-git-send-email-s.riedmueller@phytec.de>
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

There is now a PHYTEC phyCORE-i.MX 6UL with eMMC instead of NAND flash
available. The dts filename needs to reflect that to differentiate both.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 arch/arm/boot/dts/Makefile                                           | 2 +-
 ...l-phytec-segin-ff-rdk.dts => imx6ul-phytec-segin-ff-rdk-nand.dts} | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)
 rename arch/arm/boot/dts/{imx6ul-phytec-segin-ff-rdk.dts => imx6ul-phytec-segin-ff-rdk-nand.dts} (85%)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e1924b06f3cb..668b57c8cc57 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -573,7 +573,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-opos6uldev.dtb \
 	imx6ul-pico-hobbit.dtb \
 	imx6ul-pico-pi.dtb \
-	imx6ul-phytec-segin-ff-rdk.dtb \
+	imx6ul-phytec-segin-ff-rdk-nand.dtb \
 	imx6ul-tx6ul-0010.dtb \
 	imx6ul-tx6ul-0011.dtb \
 	imx6ul-tx6ul-mainboard.dtb \
diff --git a/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk.dts b/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts
similarity index 85%
rename from arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk.dts
rename to arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts
index 1e59183a2f7c..dc06029c5701 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk.dts
+++ b/arch/arm/boot/dts/imx6ul-phytec-segin-ff-rdk-nand.dts
@@ -10,8 +10,9 @@
 #include "imx6ul-phytec-segin-peb-eval-01.dtsi"
 
 / {
-	model = "PHYTEC phyBOARD-Segin i.MX6 UltraLite Full Featured";
-	compatible = "phytec,imx6ul-pbacd10", "phytec,imx6ul-pcl063", "fsl,imx6ul";
+	model = "PHYTEC phyBOARD-Segin i.MX6 UltraLite Full Featured with NAND";
+	compatible = "phytec,imx6ul-pbacd10-nand", "phytec,imx6ul-pbacd10",
+		     "phytec,imx6ul-pcl063", "fsl,imx6ul";
 };
 
 &adc1 {
-- 
2.7.4
