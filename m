From: Robert Foss <robert.foss@collabora.com>
Subject: [PATCH] ARM: dts: imx6qdl-nitrogen6_max: Disable LVDS channels
Date: Mon,  8 Apr 2019 19:53:19 +0200
Message-ID: <20190408175319.9106-1-robert.foss@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Robert Foss <robert.foss@collabora.com>
List-Id: devicetree@vger.kernel.org

If a LVDS device is not connected, having the LVDS channels
enabled will prevent imx-ldb from probing correctly even
if other CRTCs are connected.

Signed-off-by: Robert Foss <robert.foss@collabora.com>
---
 arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
index 39200e5dc896..5b413cf4c250 100644
--- a/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
@@ -703,7 +703,7 @@
 	status = "okay";
 
 	lvds-channel@0 {
-		status = "okay";
+		status = "disabled";
 
 		port@4 {
 			reg = <4>;
@@ -715,7 +715,7 @@
 	};
 
 	lvds-channel@1 {
-		status = "okay";
+		status = "disabled";
 
 		port@4 {
 			reg = <4>;
-- 
2.19.1
