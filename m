From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/4] dt: fsl-fec.txt: Fix gpio number assignment
Date: Sun, 10 Jun 2012 14:24:09 -0300
Message-ID: <1339349050-3105-3-git-send-email-festevam@gmail.com>
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
 Documentation/devicetree/bindings/net/fsl-fec.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/fsl-fec.txt b/Documentation/devicetree/bindings/net/fsl-fec.txt
index 7ab9e1a..4616fc2 100644
--- a/Documentation/devicetree/bindings/net/fsl-fec.txt
+++ b/Documentation/devicetree/bindings/net/fsl-fec.txt
@@ -19,6 +19,6 @@ ethernet@83fec000 {
 	reg = <0x83fec000 0x4000>;
 	interrupts = <87>;
 	phy-mode = "mii";
-	phy-reset-gpios = <&gpio1 14 0>; /* GPIO2_14 */
+	phy-reset-gpios = <&gpio2 14 0>; /* GPIO2_14 */
 	local-mac-address = [00 04 9F 01 1B B9];
 };
-- 
1.7.1

