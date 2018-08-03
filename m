From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: [PATCH v2 net-next 9/9] dt-bindings: net: stmmac: Add the bindings documentation for XGMAC2.
Date: Fri,  3 Aug 2018 15:56:11 +0100
Message-ID: <168e74c80ec30786789ccb4914d44b5c006b87da.1533307909.git.joabreu@synopsys.com>
References: <cover.1533307909.git.joabreu@synopsys.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <cover.1533307909.git.joabreu@synopsys.com>
In-Reply-To: <cover.1533307909.git.joabreu@synopsys.com>
References: <cover.1533307909.git.joabreu@synopsys.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Joao Pinto <Joao.Pinto@synopsys.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Adds the documentation for XGMAC2 DT bindings.

Signed-off-by: Jose Abreu <joabreu@synopsys.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: Joao Pinto <jpinto@synopsys.com>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
---
Changes from v1:
	- Correct header, now we also support 2.5/10G.
	- Add missing '>' (Sergei)
---
 Documentation/devicetree/bindings/net/stmmac.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/stmmac.txt b/Documentation/devicetree/bindings/net/stmmac.txt
index 3a28a5d8857d..a32fd590ce8f 100644
--- a/Documentation/devicetree/bindings/net/stmmac.txt
+++ b/Documentation/devicetree/bindings/net/stmmac.txt
@@ -1,7 +1,8 @@
-* STMicroelectronics 10/100/1000 Ethernet driver (GMAC)
+* STMicroelectronics 10/100/1000/2500/10000 Ethernet driver (GMAC/XGMAC)
 
 Required properties:
-- compatible: Should be "snps,dwmac-<ip_version>", "snps,dwmac"
+- compatible: Should be "snps,dwmac-<ip_version>", "snps,dwmac" or
+	"snps,dwxgmac-<ip_version>", "snps,dwxgmac".
 	For backwards compatibility: "st,spear600-gmac" is also supported.
 - reg: Address and length of the register set for the device
 - interrupt-parent: Should be the phandle for the interrupt controller
-- 
2.7.4
