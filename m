From: Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: Update documentation for stingray SATA phy
Date: Mon,  5 Jun 2017 14:30:34 +0530
Message-ID: <1496653235-22757-2-git-send-email-srinath.mannam@broadcom.com>
References: <1496653235-22757-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496653235-22757-1-git-send-email-srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update BRCM SATA phy dt-binding documentation for stingray.

Signed-off-by: Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/brcm-sata-phy.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/brcm-sata-phy.txt b/Documentation/devicetree/bindings/phy/brcm-sata-phy.txt
index 6ccce09..97977cd 100644
--- a/Documentation/devicetree/bindings/phy/brcm-sata-phy.txt
+++ b/Documentation/devicetree/bindings/phy/brcm-sata-phy.txt
@@ -7,12 +7,13 @@ Required properties:
      "brcm,iproc-ns2-sata-phy"
      "brcm,iproc-nsp-sata-phy"
      "brcm,phy-sata3"
+     "brcm,iproc-sr-sata-phy"
 - address-cells: should be 1
 - size-cells: should be 0
 - reg: register ranges for the PHY PCB interface
 - reg-names: should be "phy" and "phy-ctrl"
      The "phy-ctrl" registers are only required for
-     "brcm,iproc-ns2-sata-phy".
+     "brcm,iproc-ns2-sata-phy" and "brcm,iproc-sr-sata-phy".
 
 Sub-nodes:
   Each port's PHY should be represented as a sub-node.
@@ -23,8 +24,8 @@ Sub-nodes required properties:
 
 Sub-nodes optional properties:
 - brcm,enable-ssc: use spread spectrum clocking (SSC) on this port
-     This property is not applicable for "brcm,iproc-ns2-sata-phy" and
-     "brcm,iproc-nsp-sata-phy".
+     This property is not applicable for "brcm,iproc-ns2-sata-phy",
+     "brcm,iproc-nsp-sata-phy" and "brcm,iproc-sr-sata-phy".
 
 Example:
 	sata-phy@f0458100 {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
