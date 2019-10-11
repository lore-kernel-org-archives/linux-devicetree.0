From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH 1/3] dt-bindings: Add vendor prefix for Overkiz SAS
Date: Fri, 11 Oct 2019 14:50:20 +0200
Message-ID: <20191011125022.16329-2-kamel.bouhara@bootlin.com>
References: <20191011125022.16329-1-kamel.bouhara@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011125022.16329-1-kamel.bouhara@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-arm-kernel@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kamel Bouhara <kamel.bouhara@bootlin.com>
List-Id: devicetree@vger.kernel.org

Overkiz is a smarthome solutions provider, more information on:
https://www.overkiz.com

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 967e78c5ec0a..9b1582b3bdc3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -705,6 +705,8 @@ patternProperties:
     description: Ortus Technology Co., Ltd.
   "^osddisplays,.*":
     description: OSD Displays
+  "^overkiz,.*":
+    description: Overkiz SAS
   "^ovti,.*":
     description: OmniVision Technologies
   "^oxsemi,.*":
-- 
2.23.0
