From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V2] ARM: dts: imx7d: correct cpu supply name for voltage scaling
Date: Wed, 16 May 2018 10:25:48 +0800
Message-ID: <1526437548-32372-1-git-send-email-Anson.Huang@nxp.com>
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
Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
---
changes since V1:
	fix the "No newline at end of file" caused by vim editor.
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 2 +-
 arch/arm/boot/dts/imx7d-nitrogen7.dts   | 2 +-
 arch/arm/boot/dts/imx7d-sdb.dts         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index 7f64568..8bf365d 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -33,7 +33,7 @@
 };
 
 &cpu0 {
-	arm-supply = <&sw1a_reg>;
+	cpu-supply = <&sw1a_reg>;
 };
 
 &fec1 {
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
