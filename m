Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] dt-bindings: arm: Document Renesas Ebisu board DT bindings
Date: Wed, 11 Apr 2018 18:35:52 +0900
Message-Id: <1523439353-980-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1523439353-980-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1523439353-980-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds device tree bindings documentation for Renesas
Ebisu board (RTP0RC77990SEB0010S).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 5d21d48..61b486f 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -71,6 +71,8 @@ Boards:
     compatible = "renesas,draak", "renesas,r8a77995"
   - Eagle (RTP0RC77970SEB0010S)
     compatible = "renesas,eagle", "renesas,r8a77970"
+  - Ebisu (RTP0RC77990SEB0010S)
+    compatible = "renesas,ebisu", "renesas,r8a77990"
   - Genmai (RTK772100BC00000BR)
     compatible = "renesas,genmai", "renesas,r7s72100"
   - GR-Peach (X28A-M01-E/F)
-- 
1.9.1
