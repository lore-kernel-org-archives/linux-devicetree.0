Return-Path: <SRS0=dmff=LT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:50556 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbeIERy1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 5 Sep 2018 13:54:27 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] media: dt-bindings: adv748x: Fix decimal unit addresses
Date: Wed,  5 Sep 2018 15:24:09 +0200
Message-Id: <20180905132409.14456-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

With recent dtc and W=1:

    Warning (graph_port): video-receiver@70/port@10: graph node unit address error, expected "a"
    Warning (graph_port): video-receiver@70/port@11: graph node unit address error, expected "b"

Unit addresses are always hexadecimal (without prefix), while the bases
of reg property values depend on their prefixes.

Fixes: e69595170b1cad85 ("media: adv748x: Add adv7481, adv7482 bindings")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
v2:
  - Add Reviewed-by,
  - Drop RFC state.
---
 Documentation/devicetree/bindings/media/i2c/adv748x.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.txt b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
index 21ffb5ed818302ff..54d1d3bc186949fa 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv748x.txt
+++ b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
@@ -73,7 +73,7 @@ Example:
 			};
 		};
 
-		port@10 {
+		port@a {
 			reg = <10>;
 
 			adv7482_txa: endpoint {
@@ -83,7 +83,7 @@ Example:
 			};
 		};
 
-		port@11 {
+		port@b {
 			reg = <11>;
 
 			adv7482_txb: endpoint {
-- 
2.17.1
