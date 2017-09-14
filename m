From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v2 01/18] dt: arm: shmobile: add M3ULCB Kingfisher board DT bindings
Date: Thu, 14 Sep 2017 17:18:40 +0300
Message-ID: <1505398720-4535-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Add M3ULCB Kingfisher Device tree bindings Documentation, listing it as a
supported board.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
Changes in version 2:
- added own compatible value "shimafuji,kingfisher"

 Documentation/devicetree/bindings/arm/shmobile.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index ae75cb3..89bd3a6 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -85,6 +85,8 @@ Boards:
     compatible = "renesas,lager", "renesas,r8a7790"
   - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
     compatible = "renesas,m3ulcb", "renesas,r8a7796";
+  - M3ULCB Kingfisher (SBEV-RCAR-KF-M03)
+    compatible = "shimafuji,kingfisher", "renesas,m3ulcb", "renesas,r8a7796";
   - Marzen (R0P7779A00010S)
     compatible = "renesas,marzen", "renesas,r8a7779"
   - Porter (M2-LCDP)
-- 
1.9.1
