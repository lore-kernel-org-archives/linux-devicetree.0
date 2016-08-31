From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v3 01/12] dt: arm: shmobile: add H3ULCB board DT bindings
Date: Wed, 31 Aug 2016 13:02:21 +0300
Message-ID: <1472637741-14624-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Add H3ULCB Device tree bindings Documentation, listing it as a supported
board.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes in version 2:
- none
Changes in version 3:
- none

 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 5484c31d..2f0b716 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -49,6 +49,8 @@ Boards:
     compatible = "renesas,genmai", "renesas,r7s72100"
   - Gose
     compatible = "renesas,gose", "renesas,r8a7793"
+  - H3ULCB (RTP0RC7795SKB00010S)
+    compatible = "renesas,h3ulcb", "renesas,r8a7795";
   - Henninger
     compatible = "renesas,henninger", "renesas,r8a7791"
   - Koelsch (RTP0RC7791SEB00010S)
-- 
1.9.1
