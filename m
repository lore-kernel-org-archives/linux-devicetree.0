From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] of/documentation: Update s5m8767-regulator bindings document
Date: Mon, 24 Jun 2013 15:06:57 +0530
Message-ID: <1372066617-23518-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, grant.likely@linaro.org, rob@landley.net, broonie@kernel.org, sachin.kamat@linaro.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

s5m8767 regulator is used on Exynos platforms which use pin controller
to configure GPIOs. Update the example accordingly.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 .../bindings/regulator/s5m8767-regulator.txt       |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt b/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
index a35ff99..7364f71 100644
--- a/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
@@ -103,13 +103,13 @@ Example:
 
 		s5m8767,pmic-buck-default-dvs-idx = <0>;
 
-		s5m8767,pmic-buck-dvs-gpios = <&gpx0 0 1 0 0>, /* DVS1 */
-						 <&gpx0 1 1 0 0>, /* DVS2 */
-						 <&gpx0 2 1 0 0>; /* DVS3 */
+		s5m8767,pmic-buck-dvs-gpios = <&gpx0 0 0>, /* DVS1 */
+						 <&gpx0 1 0>, /* DVS2 */
+						 <&gpx0 2 0>; /* DVS3 */
 
-		s5m8767,pmic-buck-ds-gpios = <&gpx2 3 1 0 0>, /* SET1 */
-						<&gpx2 4 1 0 0>, /* SET2 */
-						<&gpx2 5 1 0 0>; /* SET3 */
+		s5m8767,pmic-buck-ds-gpios = <&gpx2 3 0>, /* SET1 */
+						<&gpx2 4 0>, /* SET2 */
+						<&gpx2 5 0>; /* SET3 */
 
 		s5m8767,pmic-buck2-dvs-voltage = <1350000>, <1300000>,
 						 <1250000>, <1200000>,
-- 
1.7.9.5
