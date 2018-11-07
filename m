Return-Path: <SRS0=eKhM=NS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:34370 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbeKGXF3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 7 Nov 2018 18:05:29 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: thermal: rcar-gen3-thermal: All variants use 3 interrupts
Date: Wed,  7 Nov 2018 14:35:00 +0100
Message-Id: <20181107133500.12865-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

RZ/G2M also has 3 interrupts routed to the TSC, but the list was not
updated to reflect this.

Just drop the list, as this is the case for this TSC variant in all
R-Car Gen3 and RZ/G2 SoCs.

Fixes: be6af481f3b2d508 ("dt-bindings: thermal: rcar-gen3-thermal: Add r8a774a1 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/thermal/rcar-gen3-thermal.txt          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
index ad9a435afef446f6..b6ab60f6abbf95fd 100644
--- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
@@ -21,8 +21,7 @@ Required properties:
 
 Optional properties:
 
-- interrupts		: interrupts routed to the TSC (3 for H3, M3-W, M3-N,
-			  and V3H)
+- interrupts		: interrupts routed to the TSC (must be 3).
 - power-domain		: Must contain a reference to the power domain. This
 			  property is mandatory if the thermal sensor instance
 			  is part of a controllable power domain.
-- 
2.17.1
