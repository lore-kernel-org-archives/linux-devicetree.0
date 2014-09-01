From: Gyungoh Yoo <gyungoh@gmail.com>
Subject: [PATCH v2.2 2/2] dt-bindings: Adding compatible attribute for SKY81452 regulator
Date: Mon,  1 Sep 2014 11:40:18 +0900
Message-ID: <1409539218-5571-3-git-send-email-jack.yoo@skyworksinc.com>
References: <20140813190423.GI17528@sirena.org.uk>
 <1409539218-5571-1-git-send-email-jack.yoo@skyworksinc.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409539218-5571-1-git-send-email-jack.yoo@skyworksinc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: grant.likely@linaro.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Gyungoh Yoo <jack.yoo@skyworksinc.com>
List-Id: devicetree@vger.kernel.org

Adding compatible attribute for SKY81452 regulator driver.

---
 Documentation/devicetree/bindings/regulator/sky81452-regulator.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/sky81452-regulator.txt b/Documentation/devicetree/bindings/regulator/sky81452-regulator.txt
index f98b5ed..7b9ff18 100644
--- a/Documentation/devicetree/bindings/regulator/sky81452-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/sky81452-regulator.txt
@@ -1,6 +1,7 @@
 SKY81452 voltage regulator
 
 Required properties:
+- compatible	: Must be "skyworks,sky81452-regulator"
 - any required generic properties defined in regulator.txt
 
 Optional properties:
@@ -8,7 +9,8 @@ Optional properties:
 
 Example:
 
-	regualtor {
+	regulator {
+		compatible = "skyworks,sky81452-regulator";
 		/* generic regulator properties */
 		regulator-name = "touch_en";
 		regulator-min-microvolt = <4500000>;
-- 
1.9.1
