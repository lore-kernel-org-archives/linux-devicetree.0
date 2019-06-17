From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH v16 2/3] dt-bindings: Add an entry for Purism SPC
Date: Mon, 17 Jun 2019 07:52:14 -0600
Message-ID: <20190617135215.550-3-angus@akkea.ca>
References: <20190617135215.550-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617135215.550-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: angus.ainslie@puri.sm
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, pavel@ucw.cz
List-Id: devicetree@vger.kernel.org

Add an entry for Purism, SPC

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 64854a9e4c57..8835ef3aae4f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -735,6 +735,8 @@ patternProperties:
     description: PROBOX2 (by W2COMP Co., Ltd.)
   "^pulsedlight,.*":
     description: PulsedLight, Inc
+  "^purism,.*":
+    description: Purism, SPC
   "^qca,.*":
     description: Qualcomm Atheros, Inc.
   "^qcom,.*":
-- 
2.17.1
