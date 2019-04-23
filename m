From: Nguyen An Hoan <na-hoan@jinso.co.jp>
Subject: [PATCH 1/2] media: dt-bindings: media: Add r8a77965 DRIF bindings
Date: Tue, 23 Apr 2019 19:09:58 +0900
Message-ID: <1556014199-12698-1-git-send-email-na-hoan@jinso.co.jp>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, ramesh.shanmugasundaram@bp.renesas.com, horms@verge.net.au
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com, magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
List-Id: devicetree@vger.kernel.org

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

Add r8a77965 DRIF bindings.

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 Documentation/devicetree/bindings/media/renesas,drif.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,drif.txt b/Documentation/devicetree/bindings/media/renesas,drif.txt
index 0d8974a..16cdee3 100644
--- a/Documentation/devicetree/bindings/media/renesas,drif.txt
+++ b/Documentation/devicetree/bindings/media/renesas,drif.txt
@@ -41,6 +41,7 @@ Required properties of an internal channel:
 -------------------------------------------
 - compatible:	"renesas,r8a7795-drif" if DRIF controller is a part of R8A7795 SoC.
 		"renesas,r8a7796-drif" if DRIF controller is a part of R8A7796 SoC.
+		"renesas,r8a77965-drif" if DRIF controller is a part of R8A77965 SoC.
 		"renesas,rcar-gen3-drif" for a generic R-Car Gen3 compatible device.
 
 		When compatible with the generic version, nodes must list the
-- 
2.7.4
