Return-Path: <SRS0=bLyw=SN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:50053 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfDKHzI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Apr 2019 03:55:08 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
Subject: [PATCH v2 14/20] dt-bindings: display: renesas: lvds: Add r8a77470 support
Date: Thu, 11 Apr 2019 16:54:16 +0900
Message-Id: <1554969262-15028-15-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, devicetree@vger.kernel.org, biju.das@bp.renesas.com
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Add lvds support and document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 1 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c                               | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
index a720dbb..f720883 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
@@ -9,6 +9,7 @@ Required properties:
 - compatible : Shall contain one of
   - "renesas,r8a7743-lvds" for R8A7743 (RZ/G1M) compatible LVDS encoders
   - "renesas,r8a7744-lvds" for R8A7744 (RZ/G1N) compatible LVDS encoders
+  - "renesas,r8a77470-lvds" for R8A77470 (RZ/G1C) compatible LVDS encoders
   - "renesas,r8a774c0-lvds" for R8A774C0 (RZ/G2E) compatible LVDS encoders
   - "renesas,r8a7790-lvds" for R8A7790 (R-Car H2) compatible LVDS encoders
   - "renesas,r8a7791-lvds" for R8A7791 (R-Car M2-W) compatible LVDS encoders
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index f7e4710..61a536f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -925,6 +925,7 @@ static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
 static const struct of_device_id rcar_lvds_of_table[] = {
 	{ .compatible = "renesas,r8a7743-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7744-lvds", .data = &rcar_lvds_gen2_info },
+	{ .compatible = "renesas,r8a77470-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a774c0-lvds", .data = &rcar_lvds_r8a77990_info },
 	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
 	{ .compatible = "renesas,r8a7791-lvds", .data = &rcar_lvds_gen2_info },
-- 
2.7.4
