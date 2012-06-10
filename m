From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 4/4] dt: mc13xxx.txt: Fix gpio number assignment
Date: Sun, 10 Jun 2012 14:24:10 -0300
Message-ID: <1339349050-3105-4-git-send-email-festevam@gmail.com>
References: <1339349050-3105-1-git-send-email-festevam@gmail.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1339349050-3105-1-git-send-email-festevam@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: grant.likely@secretlab.ca
Cc: rob.herring@calxeda.com, shawn.guo@linaro.org, rob@landley.net, kernel@pengutronix.de, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam@freescale.com>

Fix gpio number assignment, so that it can match the number stated in the comment.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 Documentation/devicetree/bindings/mfd/mc13xxx.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mc13xxx.txt b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
index 19f6af4..baf0798 100644
--- a/Documentation/devicetree/bindings/mfd/mc13xxx.txt
+++ b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
@@ -46,8 +46,8 @@ Examples:
 
 ecspi@70010000 { /* ECSPI1 */
 	fsl,spi-num-chipselects = <2>;
-	cs-gpios = <&gpio3 24 0>, /* GPIO4_24 */
-		   <&gpio3 25 0>; /* GPIO4_25 */
+	cs-gpios = <&gpio4 24 0>, /* GPIO4_24 */
+		   <&gpio4 25 0>; /* GPIO4_25 */
 	status = "okay";
 
 	pmic: mc13892@0 {
-- 
1.7.1

