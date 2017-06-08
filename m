From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v2 1/2] dt-bindings: Update documentation for stingray SATA phy
Date: Thu,  8 Jun 2017 17:01:38 +0530
Message-ID: <1496921499-2808-2-git-send-email-srinath.mannam@broadcom.com>
References: <1496921499-2808-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496921499-2808-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Tejun Heo <tj@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <ray.jui@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

Update BRCM SATA phy dt-binding documentation for stingray.

Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
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
