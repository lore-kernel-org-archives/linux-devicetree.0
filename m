From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v2 3/5] dt-bindings: phy: bindings document for common
 Broadcom SATA3 PHY driver
Date: Mon, 28 Mar 2016 10:18:28 +0530
Message-ID: <1459140510-5317-4-git-send-email-anup.patel@broadcom.com>
References: <1459140510-5317-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1459140510-5317-1-git-send-email-anup.patel@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Device Tree <devicetree@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Ray Jui <rjui@broadcom.com>, Jon Mason <jon.mason@broadcom.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Kumar Gala <galak@codeaurora.org>, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patch:
1. Renames DT bindings document of Broadcom STB SATA3 PHY driver to
common Broadcom SATA3 PHY driver bindings document
2. Adds bindings info for NS2 SATA3 PHY

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../phy/{brcm,brcmstb-sata-phy.txt => brcm-sata-phy.txt}  | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/phy/{brcm,brcmstb-sata-phy.txt => brcm-sata-phy.txt} (69%)

diff --git a/Documentation/devicetree/bindings/phy/brcm,brcmstb-sata-phy.txt b/Documentation/devicetree/bindings/phy/brcm-sata-phy.txt
similarity index 69%
rename from Documentation/devicetree/bindings/phy/brcm,brcmstb-sata-phy.txt
rename to Documentation/devicetree/bindings/phy/brcm-sata-phy.txt
index d87ab7c..d023120 100644
--- a/Documentation/devicetree/bindings/phy/brcm,brcmstb-sata-phy.txt
+++ b/Documentation/devicetree/bindings/phy/brcm-sata-phy.txt
@@ -1,14 +1,17 @@
-* Broadcom SATA3 PHY for STB
+* Broadcom SATA3 PHY
 
 Required properties:
 - compatible: should be one or more of
      "brcm,bcm7425-sata-phy"
      "brcm,bcm7445-sata-phy"
+     "brcm,iproc-ns2-sata-phy"
      "brcm,phy-sata3"
 - address-cells: should be 1
 - size-cells: should be 0
-- reg: register range for the PHY PCB interface
-- reg-names: should be "phy"
+- reg: register ranges for the PHY PCB interface
+- reg-names: should be "phy" and "phy-ctrl"
+     The "phy-ctrl" registers are only required for
+     "brcm,iproc-ns2-sata-phy".
 
 Sub-nodes:
   Each port's PHY should be represented as a sub-node.
@@ -16,12 +19,12 @@ Sub-nodes:
 Sub-nodes required properties:
 - reg: the PHY number
 - phy-cells: generic PHY binding; must be 0
-Optional:
-- brcm,enable-ssc: use spread spectrum clocking (SSC) on this port
 
+Sub-nodes optional properties:
+- brcm,enable-ssc: use spread spectrum clocking (SSC) on this port
+     This property is not applicable for "brcm,iproc-ns2-sata-phy".
 
 Example:
-
 	sata-phy@f0458100 {
 		compatible = "brcm,bcm7445-sata-phy", "brcm,phy-sata3";
 		reg = <0xf0458100 0x1e00>, <0xf045804c 0x10>;
-- 
1.9.1
