Return-Path: <SRS0=4Bew=MI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:11878 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726436AbeIZOke (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 26 Sep 2018 10:40:34 -0400
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] ARM: shmobile: Document iWave RZ/G1N SOM
Date: Wed, 26 Sep 2018 09:21:44 +0100
Message-Id: <1537950104-18330-1-git-send-email-biju.das@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Document the iW-RainboW-G20M-RZ/G1N Qseven device tree bindings,
listing it as a supported system on module.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
iWave uses the same "iW-RainboW-G20M-Qseven" name for both
iWave-RZ/G1N and iWave-RZ/G1M Q7 SOM. Details can be found
in the below link
https://www.iwavesystems.com/rz-g1m-qseven-module.html
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index f5e0f82..4cfb567 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -101,6 +101,8 @@ Boards:
     compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7743"
   - iWave Systems RZ/G1M Qseven System On Module (iW-RainboW-G20M-Qseven)
     compatible = "iwave,g20m", "renesas,r8a7743"
+  - iWave Systems RZ/G1N Qseven System On Module (iW-RainboW-G20M-Qseven)
+    compatible = "iwave,g20m", "renesas,r8a7744"
   - Kingfisher (SBEV-RCAR-KF-M03)
     compatible = "shimafuji,kingfisher"
   - Koelsch (RTP0RC7791SEB00010S)
-- 
2.7.4
