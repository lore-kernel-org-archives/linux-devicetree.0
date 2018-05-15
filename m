From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH] ARM: dts: imx7d: correct cpu supply name for voltage scaling
Date: Tue, 15 May 2018 17:13:29 +0800
Message-ID: <1526375609-17676-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Correct CPU supply name to meet cpufreq-dt driver's
requirement for voltage scaling.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 4 ++--
 arch/arm/boot/dts/imx7d-nitrogen7.dts   | 2 +-
 arch/arm/boot/dts/imx7d-sdb.dts         | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index 7f64568..60deaf9 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -33,7 +33,7 @@
 };
 
 &cpu0 {
-	arm-supply = <&sw1a_reg>;
+	cpu-supply = <&sw1a_reg>;
 };
 
 &fec1 {
@@ -284,4 +284,4 @@
 			MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x14 /* OTG PWREN */
 		>;
 	};
-};
\ No newline at end of file
+};
diff --git a/arch/arm/boot/dts/imx7d-nitrogen7.dts b/arch/arm/boot/dts/imx7d-nitrogen7.dts
index b8e73b4..70c53e5 100644
--- a/arch/arm/boot/dts/imx7d-nitrogen7.dts
+++ b/arch/arm/boot/dts/imx7d-nitrogen7.dts
@@ -144,7 +144,7 @@
 };
 
 &cpu0 {
-	arm-supply = <&sw1a_reg>;
+	cpu-supply = <&sw1a_reg>;
 };
 
 &fec1 {
diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index 722a45a..9408491 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -141,7 +141,7 @@
 };
 
 &cpu0 {
-	arm-supply = <&sw1a_reg>;
+	cpu-supply = <&sw1a_reg>;
 };
 
 &ecspi3 {
-- 
2.7.4
