Return-Path: <SRS0=hyxw=T4=pengutronix.de=mtr@kernel.org>
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v8 3/5] media: dt-bindings: media: Add vendor prefix for allegro
Date: Tue, 28 May 2019 19:11:18 +0200
Message-Id: <20190528171120.7076-4-m.tretter@pengutronix.de>
In-Reply-To: <20190528171120.7076-1-m.tretter@pengutronix.de>
References: <20190528171120.7076-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, Michael Tretter <m.tretter@pengutronix.de>, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Add vendor prefix for Allegro DVT, a provider of H.264/AVC, H.265/HEVC,
AVS2, VP9 and AV1 compliance test suites and H.264/AVC, H.265/HEVC, and
VP9 encoder, codec and decoder hardware (RTL) IPs.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v7 -> v8:
none

v6 -> v7:
- convert to json format for vendor-prefixes.yaml

v5 -> v6:
none

v5:
- new patch
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 33a65a45e319..7da11464991a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -49,6 +49,8 @@ patternProperties:
     description: Aeroflex Gaisler AB
   "^al,.*":
     description: Annapurna Labs
+  "^allegro,.*"
+    description: Allegro DVT
   "^allo,.*":
     description: Allo.com
   "^allwinner,.*":
-- 
2.20.1
