Return-Path: <SRS0=Px8Z=LZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:3111 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727441AbeIKPSQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 11 Sep 2018 11:18:16 -0400
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 01/10] dt-bindings: power: rcar-sysc: Document r8a7744 SYSC binding
Date: Tue, 11 Sep 2018 11:12:42 +0100
Message-Id: <1536660771-32278-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
References: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add binding documentation for the RZ/G1N (R8A7744) SYSC block.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
index 4e3ec6a..9c3fdd8 100644
--- a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
+++ b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
@@ -8,6 +8,7 @@ and various coprocessors.
 Required properties:
   - compatible: Must contain exactly one of the following:
       - "renesas,r8a7743-sysc" (RZ/G1M)
+      - "renesas,r8a7744-sysc" (RZ/G1N)
       - "renesas,r8a7745-sysc" (RZ/G1E)
       - "renesas,r8a77470-sysc" (RZ/G1C)
       - "renesas,r8a774a1-sysc" (RZ/G2M)
-- 
2.7.4
