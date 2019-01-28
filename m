Return-Path: <SRS0=OP5l=QE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:46940 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbfA1Izj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 28 Jan 2019 03:55:39 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: arm: renesas: Fix SoC mismatch for Stout
Date: Mon, 28 Jan 2019 09:55:29 +0100
Message-Id: <20190128085529.20538-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

make dtbs_check:

    arch/arm/boot/dts/r8a7790-stout.dt.yaml: compatible: ['renesas,stout', 'renesas,r8a7790'] is not valid under any of the given schemas

The Stout development board has an R-Car H2 (r8a7790) SoC, not an R-Car
H1 (r8a7779).

Fixes: 12749350567c819d ("dt-bindings: arm: Convert Renesas board/soc bindings to json-schema")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index cb9b4417e8a1cd75..19f379863d50bd41 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -130,13 +130,13 @@ properties:
         items:
           - enum:
               - renesas,marzen # Marzen (R0P7779A00010S)
-              - renesas,stout # Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
           - const: renesas,r8a7779
 
       - description: R-Car H2 (R8A77900)
         items:
           - enum:
               - renesas,lager # Lager (RTP0RC7790SEB00010S)
+              - renesas,stout # Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
           - const: renesas,r8a7790
 
       - description: R-Car M2-W (R8A77910)
-- 
2.17.1
