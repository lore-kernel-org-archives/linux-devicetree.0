Return-Path: <SRS0=bLyw=SN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:50343 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbfDKHzV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Apr 2019 03:55:21 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
Subject: [PATCH v2 20/20] dt-bindings: can: rcar_can: Document r8a77470 bindings
Date: Thu, 11 Apr 2019 16:54:22 +0900
Message-Id: <1554969262-15028-21-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, devicetree@vger.kernel.org, biju.das@bp.renesas.com
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 Documentation/devicetree/bindings/net/can/rcar_can.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/can/rcar_can.txt b/Documentation/devicetree/bindings/net/can/rcar_can.txt
index 9936b9e..a5d57da 100644
--- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
+++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
@@ -5,6 +5,7 @@ Required properties:
 - compatible: "renesas,can-r8a7743" if CAN controller is a part of R8A7743 SoC.
 	      "renesas,can-r8a7744" if CAN controller is a part of R8A7744 SoC.
 	      "renesas,can-r8a7745" if CAN controller is a part of R8A7745 SoC.
+	      "renesas,can-r8a77470" if CAN controller is a part of R8A77470 SoC.
 	      "renesas,can-r8a774a1" if CAN controller is a part of R8A774A1 SoC.
 	      "renesas,can-r8a7778" if CAN controller is a part of R8A7778 SoC.
 	      "renesas,can-r8a7779" if CAN controller is a part of R8A7779 SoC.
-- 
2.7.4
