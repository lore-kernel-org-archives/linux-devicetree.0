From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v2 2/3] dt-bindings: net: document new usxgmii phy
 mode
Date: Thu, 23 May 2019 20:07:56 +0200
Message-ID: <60079a09-670b-268e-9ad5-014a427b60bf@gmail.com>
References: <9d284f4d-93ee-fb27-e386-80825f92adc8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <9d284f4d-93ee-fb27-e386-80825f92adc8@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Madalin-cristian Bucur <madalin.bucur@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add new interface mode USXGMII to binding documentation.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- binding documentation change added to the series
---
 Documentation/devicetree/bindings/net/ethernet.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet.txt b/Documentation/devicetree/bindings/net/ethernet.txt
index e88c3641d..5475682bf 100644
--- a/Documentation/devicetree/bindings/net/ethernet.txt
+++ b/Documentation/devicetree/bindings/net/ethernet.txt
@@ -43,6 +43,7 @@ Documentation/devicetree/bindings/phy/phy-bindings.txt.
   * "rxaui"
   * "xaui"
   * "10gbase-kr" (10GBASE-KR, XFI, SFI)
+  * "usxgmii"
 - phy-connection-type: the same as "phy-mode" property but described in the
   Devicetree Specification;
 - phy-handle: phandle, specifies a reference to a node representing a PHY
-- 
2.21.0
