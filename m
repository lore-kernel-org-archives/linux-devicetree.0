From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 09/11] DT: arm: shmobile: document Condor board bindings
Date: Fri, 2 Feb 2018 21:45:08 +0300
Message-ID: <30a4e575-a2c9-e0d3-f41f-4e9b15543365@cogentembedded.com>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
Content-Language: en-MW
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Document the Condor device tree bindings, listing it as a supported board.

This allows to use checkpatch.pl to validate .dts files referring to the
Condor board.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
 1 file changed, 2 insertions(+)

Index: renesas/Documentation/devicetree/bindings/arm/shmobile.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/arm/shmobile.txt
+++ renesas/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -59,6 +59,8 @@ Boards:
     compatible = "renesas,blanche", "renesas,r8a7792"
   - BOCK-W
     compatible = "renesas,bockw", "renesas,r8a7778"
+  - Condor (RTP0RC77980SEB0010SS/RTP0RC77980SEB0010SA01)
+    compatible = "renesas,condor", "renesas,r8a77980"
   - Draak (RTP0RC77995SEB0010S)
     compatible = "renesas,draak", "renesas,r8a77995"
   - Eagle (RTP0RC77970SEB0010S)
