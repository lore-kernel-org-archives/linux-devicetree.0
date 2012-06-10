From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/4] dt: fsl-mma8450.tx: Add missing 'reg' description
Date: Sun, 10 Jun 2012 14:24:08 -0300
Message-ID: <1339349050-3105-2-git-send-email-festevam@gmail.com>
References: <1339349050-3105-1-git-send-email-festevam@gmail.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1339349050-3105-1-git-send-email-festevam@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: grant.likely@secretlab.ca
Cc: rob.herring@calxeda.com, shawn.guo@linaro.org, rob@landley.net, kernel@pengutronix.de, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam@freescale.com>

Add missing 'reg' description.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
----
 .../devicetree/bindings/input/fsl-mma8450.txt      |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/fsl-mma8450.txt b/Documentation/devicetree/bindings/input/fsl-mma8450.txt
index a00c94c..0b96e57 100644
--- a/Documentation/devicetree/bindings/input/fsl-mma8450.txt
+++ b/Documentation/devicetree/bindings/input/fsl-mma8450.txt
@@ -2,6 +2,7 @@
 
 Required properties:
 - compatible : "fsl,mma8450".
+- reg: the I2C address of MMA8450
 
 Example:
 
-- 
1.7.1

