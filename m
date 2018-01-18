From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 1/2] DT: display: renesas,du: document R8A77970 bindings
Date: Fri, 19 Jan 2018 00:05:58 +0300
Message-ID: <20180118211024.314876177@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline; filename=DT-display-renesas,du-document-R8A77970-bindings-v2.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Document the R-Car V3M (R8A77970) SoC in the R-Car DU bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- documented  R8A77970 DU ports;
- patch split from the main R8A77970 DU support patch.

 Documentation/devicetree/bindings/display/renesas,du.txt |    2 ++
 1 file changed, 2 insertions(+)

Index: linux/Documentation/devicetree/bindings/display/renesas,du.txt
===================================================================
--- linux.orig/Documentation/devicetree/bindings/display/renesas,du.txt
+++ linux/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -13,6 +13,7 @@ Required Properties:
     - "renesas,du-r8a7794" for R8A7794 (R-Car E2) compatible DU
     - "renesas,du-r8a7795" for R8A7795 (R-Car H3) compatible DU
     - "renesas,du-r8a7796" for R8A7796 (R-Car M3-W) compatible DU
+    - "renesas,du-r8a77970" for R8A77970 (R-Car V3M) compatible DU
 
   - reg: A list of base address and length of each memory resource, one for
     each entry in the reg-names property.
@@ -63,6 +64,7 @@ corresponding to each DU output.
  R8A7794 (R-Car E2)   DPAD 0         DPAD 1         -              -
  R8A7795 (R-Car H3)   DPAD 0         HDMI 0         HDMI 1         LVDS 0
  R8A7796 (R-Car M3-W) DPAD 0         HDMI 0         LVDS 0         -
+ R8A77970 (R-Car V3M) DPAD 0         LVDS 0         -              -
 
 
 Example: R8A7795 (R-Car H3) ES2.0 DU
