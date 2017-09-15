From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 6/8] arm64: renesas: document Eagle board bindings
Date: Fri, 15 Sep 2017 22:43:24 +0300
Message-ID: <20170915194442.464361390@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline; filename=arm64-renesas-document-Eagle-board-bindings-v2.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Document the Eagle device tree bindings, listing it as a supported board.

This allows to use checkpatch.pl to validate .dts files referring to the
Eagle board.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- renamed the patch.

 Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
 1 file changed, 2 insertions(+)

Index: renesas/Documentation/devicetree/bindings/arm/shmobile.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/arm/shmobile.txt
+++ renesas/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -59,6 +59,8 @@ Boards:
     compatible = "renesas,bockw", "renesas,r8a7778"
   - Draak (RTP0RC77995SEB0010S)
     compatible = "renesas,draak", "renesas,r8a77995"
+  - Eagle (RTP0RC77970SEB0010S)
+    compatible = "renesas,eagle", "renesas,r8a77970";
   - Genmai (RTK772100BC00000BR)
     compatible = "renesas,genmai", "renesas,r7s72100"
   - GR-Peach (X28A-M01-E/F)
