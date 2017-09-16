From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v3 01/18] arm: shmobile: Document Kingfisher board DT bindings
Date: Sat, 16 Sep 2017 21:48:47 +0300
Message-ID: <1505587727-15543-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Add Kingfisher Device tree bindings Documentation, listing it as a
supported board.
Kingfisher is the H3ULCB/M3ULCB extension board.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
Changes in version 2:
- added own compatible value "shimafuji,kingfisher"
Changes in version 3:
- seperate Kingfisher entry from H3ULCB/M3ULCB

 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index ae75cb3..5921ac2 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -76,6 +76,8 @@ Boards:
     compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7743"
   - iWave Systems RZ/G1M Qseven System On Module (iW-RainboW-G20M-Qseven)
     compatible = "iwave,g20m", "renesas,r8a7743"
+  - Kingfisher (SBEV-RCAR-KF-M03)
+    compatible = "shimafuji,kingfisher";
   - Koelsch (RTP0RC7791SEB00010S)
     compatible = "renesas,koelsch", "renesas,r8a7791"
   - Kyoto Microcomputer Co. KZM-A9-Dual
-- 
1.9.1
