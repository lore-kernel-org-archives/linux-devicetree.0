Return-Path: <SRS0=pxWX=JI=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: fsl-imx-sahara: Add i.MX51 as a supported SoC
Date: Fri, 22 Jun 2018 15:45:28 -0300
Message-Id: <1529693129-29817-1-git-send-email-festevam@gmail.com>
To: herbert@gondor.apana.org.au
Cc: robh+dt@kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, horia.geanta@nxp.com, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

i.MX51 and i.MX53 share the same sahara IP block version, so add
i.MX51 in the list of supported SoCs.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Fix typo in commit log "i.MX51 and i.MX53"

 Documentation/devicetree/bindings/crypto/fsl-imx-sahara.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/fsl-imx-sahara.txt b/Documentation/devicetree/bindings/crypto/fsl-imx-sahara.txt
index e8a35c7..5343a48 100644
--- a/Documentation/devicetree/bindings/crypto/fsl-imx-sahara.txt
+++ b/Documentation/devicetree/bindings/crypto/fsl-imx-sahara.txt
@@ -1,8 +1,9 @@
 Freescale SAHARA Cryptographic Accelerator included in some i.MX chips.
-Currently only i.MX27 and i.MX53 are supported.
+Currently i.MX27, i.MX51 and i.MX53 are supported.
 
 Required properties:
-- compatible : Should be "fsl,<soc>-sahara"
+- compatible : Should be "fsl,imx27-sahara", "fsl,imx51-sahara"
+or "fsl,imx53-sahara"
 - reg : Should contain SAHARA registers location and length
 - interrupts : Should contain SAHARA interrupt number
 
-- 
2.7.4
