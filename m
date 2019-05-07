From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net] dt-bindings: net: Fix a typo in the phy-mode list for ethernet bindings
Date: Tue,  7 May 2019 17:35:55 +0200
Message-ID: <20190507153555.18545-1-maxime.chevallier@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, thomas.petazzoni@bootlin.com, gregory.clement@bootlin.com
List-Id: devicetree@vger.kernel.org

The phy_mode "2000base-x" is actually supposed to be "1000base-x", even
though the commit title of the original patch says otherwise.

Fixes: 55601a880690 ("net: phy: Add 2000base-x, 2500base-x and rxaui modes")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 Documentation/devicetree/bindings/net/ethernet.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet.txt b/Documentation/devicetree/bindings/net/ethernet.txt
index a68621580584..d45b5b56fa39 100644
--- a/Documentation/devicetree/bindings/net/ethernet.txt
+++ b/Documentation/devicetree/bindings/net/ethernet.txt
@@ -36,7 +36,7 @@ Documentation/devicetree/bindings/phy/phy-bindings.txt.
   * "smii"
   * "xgmii"
   * "trgmii"
-  * "2000base-x",
+  * "1000base-x",
   * "2500base-x",
   * "rxaui"
   * "xaui"
-- 
2.20.1
