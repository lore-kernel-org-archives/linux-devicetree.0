Return-Path: <SRS0=5yH4=UC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:32843 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727393AbfFCLc5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Jun 2019 07:32:57 -0400
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH] media: dt-bindings: Fix vendor-prefixes YAML
Date: Mon,  3 Jun 2019 13:32:50 +0200
Message-Id: <20190603113250.4115-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-media@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Michael Tretter <m.tretter@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

Commit 8df39e16877f ("media: dt-bindings: media: Add vendor prefix for
allegro") introduced a new devicetree binding vendors, however with an
improper syntax making the resulting YAML impossible to parse. Let's fix
this.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Michael Tretter <m.tretter@pengutronix.de>
Fixes: 8df39e16877f ("media: dt-bindings: media: Add vendor prefix for allegro")
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index cb983eee4576..432bababc9bf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -49,7 +49,7 @@ patternProperties:
     description: Aeroflex Gaisler AB
   "^al,.*":
     description: Annapurna Labs
-  "^allegro,.*"
+  "^allegro,.*":
     description: Allegro DVT
   "^allo,.*":
     description: Allo.com
-- 
2.21.0
