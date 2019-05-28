Return-Path: <SRS0=Wuwb=T4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48959 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbfE1NJZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 May 2019 09:09:25 -0400
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v7 3/5] media: dt-bindings: media: Add vendor prefix for allegro
Date: Tue, 28 May 2019 15:09:18 +0200
Message-Id: <20190528130920.4450-4-m.tretter@pengutronix.de>
In-Reply-To: <20190528130920.4450-1-m.tretter@pengutronix.de>
References: <20190528130920.4450-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, dshah@xilinx.com, hverkuil@xs4all.nl, Michael Tretter <m.tretter@pengutronix.de>, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Add vendor prefix for Allegro DVT, a provider of H.264/AVC, H.265/HEVC,
AVS2, VP9 and AV1 compliance test suites and H.264/AVC, H.265/HEVC, and
VP9 encoder, codec and decoder hardware (RTL) IPs.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
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
