Return-Path: <SRS0=bLyw=SN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:50235 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbfDKHzP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Apr 2019 03:55:15 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
Subject: [PATCH v2 17/20] dt-bindings: pwm: Document r8a77470 bindings
Date: Thu, 11 Apr 2019 16:54:19 +0900
Message-Id: <1554969262-15028-18-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, devicetree@vger.kernel.org, biju.das@bp.renesas.com
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
index fbd6a4f..cba6ace 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
+++ b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
@@ -5,6 +5,7 @@ Required Properties:
  - "renesas,pwm-r8a7743": for RZ/G1M
  - "renesas,pwm-r8a7744": for RZ/G1N
  - "renesas,pwm-r8a7745": for RZ/G1E
+ - "renesas,pwm-r8a77470": for RZ/G1C
  - "renesas,pwm-r8a774a1": for RZ/G2M
  - "renesas,pwm-r8a774c0": for RZ/G2E
  - "renesas,pwm-r8a7778": for R-Car M1A
-- 
2.7.4
