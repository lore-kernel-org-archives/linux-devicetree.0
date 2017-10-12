From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 1/3] dt-bindings: phy: Add RX equalizer properties for Broadcom SATA PHY
Date: Wed, 11 Oct 2017 17:53:10 -0700
Message-ID: <20171012005312.17363-2-f.fainelli@gmail.com>
References: <20171012005312.17363-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171012005312.17363-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Ray Jui <ray.jui@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Viresh Kumar <viresh.kumar@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Dan Carpenter <dan.carpenter@oracle.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Define two new properties: brcm,rx-aeq-mode which allows configuring the
SATA PHY RX equalizers and when "manual" is used, brcm,rx-aeq can be
used to set the exact value.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/devicetree/bindings/phy/brcm-sata-phy.txt | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/brcm-sata-phy.txt b/Documentation/devicetree/bindings/phy/brcm-sata-phy.txt
index 97977cd29a98..0aced97d8092 100644
--- a/Documentation/devicetree/bindings/phy/brcm-sata-phy.txt
+++ b/Documentation/devicetree/bindings/phy/brcm-sata-phy.txt
@@ -27,7 +27,16 @@ Sub-nodes optional properties:
      This property is not applicable for "brcm,iproc-ns2-sata-phy",
      "brcm,iproc-nsp-sata-phy" and "brcm,iproc-sr-sata-phy".
 
-Example:
+- brcm,rxaeq-mode: string that indicates the desired RX equalizer
+  mode, possible values are:
+	"off" (equivalent to not specifying the property)
+	"auto"
+	"manual" (brcm,rxaeq-value is used in that case)
+
+- brcm,rxaeq-value: when 'rxaeq-mode' is set to "manual", provides the RX
+  equalizer value that should be used. Allowed range is 0..63.
+
+Example
 	sata-phy@f0458100 {
 		compatible = "brcm,bcm7445-sata-phy", "brcm,phy-sata3";
 		reg = <0xf0458100 0x1e00>, <0xf045804c 0x10>;
-- 
2.9.3
