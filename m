From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH 1/2] ARM: dts: zx: remove the slot sub-nodes relevant to dwmmc
 controller
Date: Thu, 28 Jul 2016 18:55:26 +0900
Message-ID: <1469699727-23339-1-git-send-email-jh80.chung@samsung.com>
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-mmc@vger.kernel.org
Cc: ulf.hansson@linaro.org, shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org, robh+dt@kernel.or, mark.rutland@arm.com, devicetree@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>
List-Id: devicetree@vger.kernel.org

Dwmmc controller didn't support the slot sub-nodes.
(dwmmc controller decided not to consider the slot nodes.)
And "supports-highspeed" property was deprecated.
Instead, use "cap-sd/mmc-highspeed" properties.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
---
 arch/arm/boot/dts/zx296702-ad1.dts | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/zx296702-ad1.dts b/arch/arm/boot/dts/zx296702-ad1.dts
index 081f980..23b1c79 100644
--- a/arch/arm/boot/dts/zx296702-ad1.dts
+++ b/arch/arm/boot/dts/zx296702-ad1.dts
@@ -19,28 +19,22 @@
 
 &mmc0 {
 	num-slots = <1>;
-	supports-highspeed;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
 	non-removable;
 	disable-wp;
+	bus-width = <4>;
 	status = "okay";
-
-	slot@0 {
-		reg = <0>;
-		bus-width = <4>;
-	};
 };
 
 &mmc1 {
 	num-slots = <1>;
-	supports-highspeed;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
 	non-removable;
 	disable-wp;
+	bus-width = <8>;
 	status = "okay";
-
-	slot@0 {
-		reg = <0>;
-		bus-width = <8>;
-	};
 };
 
 &uart0 {
-- 
1.9.1

