From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 1/5] of: Add vendor prefix for iWave Systems Technologies Pvt. Ltd
Date: Tue,  6 Jun 2017 16:10:14 +0100
Message-ID: <1496761818-62126-2-git-send-email-biju.das@bp.renesas.com>
References: <1496420523-23506-4-git-send-email-biju.das@bp.renesas.com>
 <1496761818-62126-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1496761818-62126-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds vendor prefix for iWave Systems Technologies Pvt. Ltd.
Website: http://www.iwavesystems.com/

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index d808f24..a74400a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -160,6 +160,7 @@ isee	ISEE 2007 S.L.
 isil	Intersil
 issi	Integrated Silicon Solutions Inc.
 itead	ITEAD Intelligent Systems Co.Ltd
+iwave  iWave Systems Technologies Pvt. Ltd.
 jdi	Japan Display Inc.
 jedec	JEDEC Solid State Technology Association
 karo	Ka-Ro electronics GmbH
-- 
1.9.1
