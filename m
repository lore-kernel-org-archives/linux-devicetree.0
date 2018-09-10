Return-Path: <SRS0=auRG=LY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:12555 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728110AbeIJTgM (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 10 Sep 2018 15:36:12 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 3/3] dt-bindings: power: rcar-sysc: Document r8a774c0 sysc
Date: Mon, 10 Sep 2018 15:41:28 +0100
Message-Id: <1536590488-23270-4-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1536590488-23270-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1536590488-23270-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Biju Das <biju.das@bp.renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document bindings for the RZ/G2E (a.k.a. R8A774C0) system
controller.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
index 4e3ec6a..4cb97d4 100644
--- a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
+++ b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
@@ -11,6 +11,7 @@ Required properties:
       - "renesas,r8a7745-sysc" (RZ/G1E)
       - "renesas,r8a77470-sysc" (RZ/G1C)
       - "renesas,r8a774a1-sysc" (RZ/G2M)
+      - "renesas,r8a774c0-sysc" (RZ/G2E)
       - "renesas,r8a7779-sysc" (R-Car H1)
       - "renesas,r8a7790-sysc" (R-Car H2)
       - "renesas,r8a7791-sysc" (R-Car M2-W)
-- 
2.7.4
