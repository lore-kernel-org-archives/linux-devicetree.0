From: Angus Ainslie <angus@akkea.ca>
Subject: [PATCH v14 2/3] dt-bindings: Add an entry for Purism SPC
Date: Fri, 24 May 2019 12:32:56 -0600
Message-ID: <20190524183257.16066-3-angus@akkea.ca>
References: <20190524183257.16066-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524183257.16066-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: angus.ainslie@puri.sm
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, "Angus Ainslie (Purism)" <angus@akkea.ca>
List-Id: devicetree@vger.kernel.org

From: "Angus Ainslie (Purism)" <angus@akkea.ca>

Add an entry for Purism, SPC

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 749e3c3843d0..07d5211a8192 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -687,6 +687,8 @@ patternProperties:
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
