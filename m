Return-Path: <SRS0=ZPg/=RD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:56688 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731372AbfB1KvY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Feb 2019 05:51:24 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: power: r8a77965: Remove non-existent A3IR power domain
Date: Thu, 28 Feb 2019 11:51:19 +0100
Message-Id: <20190228105119.548-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
removed the A3IR power domain on R-Car M3-N, as this SoC does not have
an Image Processing Unit (IMP-X5).

As of commit d8c6557bc93be73e ("arm64: dts: renesas: r8a77965: Remove
non-existent IPMMU-IR"), this definition is no longer used from DT, and
thus can be removed.

Fixes: a527709b78b3c997 ("soc: renesas: rcar-sysc: Add R-Car M3-N support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop RFC, as the dependency is part of v5.0-rc1.
---
 include/dt-bindings/power/r8a77965-sysc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/power/r8a77965-sysc.h b/include/dt-bindings/power/r8a77965-sysc.h
index 05a4b5917314791a..de82d8a15ea13a85 100644
--- a/include/dt-bindings/power/r8a77965-sysc.h
+++ b/include/dt-bindings/power/r8a77965-sysc.h
@@ -21,7 +21,6 @@
 #define R8A77965_PD_A3VC		14
 #define R8A77965_PD_3DG_A		17
 #define R8A77965_PD_3DG_B		18
-#define R8A77965_PD_A3IR		24
 #define R8A77965_PD_A2VC1		26
 
 /* Always-on power area */
-- 
2.17.1
