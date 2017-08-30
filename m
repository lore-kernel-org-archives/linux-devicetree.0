From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [media] v4l: vsp1: Use generic node name
Date: Wed, 30 Aug 2017 11:57:31 +0200
Message-ID: <1504087051-5449-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Use the preferred generic node name in the example.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/media/renesas,vsp1.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.txt b/Documentation/devicetree/bindings/media/renesas,vsp1.txt
index 9b695bcbf2190bdd..16427017cb45561e 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.txt
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.txt
@@ -22,7 +22,7 @@ Optional properties:
 
 Example: R8A7790 (R-Car H2) VSP1-S node
 
-	vsp1@fe928000 {
+	vsp@fe928000 {
 		compatible = "renesas,vsp1";
 		reg = <0 0xfe928000 0 0x8000>;
 		interrupts = <0 267 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.7.4
