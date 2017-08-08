From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 2/2] ARM: shmobile: document iW-RainboW-G22D SODIMM SOM Development Platform
Date: Tue,  8 Aug 2017 13:27:32 +0100
Message-ID: <8d98401d979ade94d19031ab3240d81c0959380b.1502190772.git.fabrizio.castro@bp.renesas.com>
References: <cover.1502190772.git.fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1502190772.git.fabrizio.castro@bp.renesas.com>
In-Reply-To: <cover.1502190772.git.fabrizio.castro@bp.renesas.com>
References: <cover.1502190772.git.fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, biju.das@bp.renesas.com, Chris.Paterson2@renesas.com, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Document the iW-RainboW-G22D device tree bindings.
It is just a placeholder for the time being, the actual
implementation is not available yet.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 64e7f63..ae75cb3 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -68,6 +68,8 @@ Boards:
     compatible = "renesas,h3ulcb", "renesas,r8a7795";
   - Henninger
     compatible = "renesas,henninger", "renesas,r8a7791"
+  - iWave Systems RZ/G1E SODIMM SOM Development Platform (iW-RainboW-G22D)
+    compatible = "iwave,g22d", "iwave,g22m", "renesas,r8a7745"
   - iWave Systems RZ/G1E SODIMM System On Module (iW-RainboW-G22M-SM)
     compatible = "iwave,g22m", "renesas,r8a7745"
   - iWave Systems RZ/G1M Qseven Development Platform (iW-RainboW-G20D-Qseven)
-- 
1.9.1
