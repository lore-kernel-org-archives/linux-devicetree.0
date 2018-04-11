Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] dt-bindings: arm: Document R-Car E3 SoC DT bindings
Date: Wed, 11 Apr 2018 18:35:51 +0900
Message-Id: <1523439353-980-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1523439353-980-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1523439353-980-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds device tree bindings documentation for Renesas R-Car
E3 (r8a77990).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 4401369..5d21d48 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -47,6 +47,8 @@ SoCs:
     compatible = "renesas,r8a77970"
   - R-Car V3H (R8A77980)
     compatible = "renesas,r8a77980"
+  - R-Car E3 (R8A77990)
+    compatible = "renesas,r8a77990"
   - R-Car D3 (R8A77995)
     compatible = "renesas,r8a77995"
 
-- 
1.9.1
