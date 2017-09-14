From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v2 02/18] dt: arm: shmobile: add H3ULCB Kingfisher board DT bindings
Date: Thu, 14 Sep 2017 17:18:46 +0300
Message-ID: <1505398726-4575-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Add H3ULCB Kingfisher Device tree bindings Documentation, listing it as a
supported board.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
Changes in version 2:
- added own compatible value "shimafuji,kingfisher"

 Documentation/devicetree/bindings/arm/shmobile.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 89bd3a6..b313fe2 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -65,6 +65,8 @@ Boards:
   - H3ULCB (R-Car Starter Kit Premier, RTP0RC7795SKBX0010SA00 (H3 ES1.1))
     H3ULCB (R-Car Starter Kit Premier, RTP0RC77951SKBX010SA00 (H3 ES2.0))
     compatible = "renesas,h3ulcb", "renesas,r8a7795";
+  - H3ULCB Kingfisher (SBEV-RCAR-KF-M03)
+    compatible = "shimafuji,kingfisher", "renesas,h3ulcb", "renesas,r8a7795";
   - Henninger
     compatible = "renesas,henninger", "renesas,r8a7791"
   - iWave Systems RZ/G1E SODIMM SOM Development Platform (iW-RainboW-G22D)
-- 
1.9.1
