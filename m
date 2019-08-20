From: megous@megous.com
Subject: [PATCH 2/6] dt-bindings: net: sun8i-a83t-emac: Add phy-io-supply property
Date: Tue, 20 Aug 2019 16:53:39 +0200
Message-ID: <20190820145343.29108-3-megous@megous.com>
References: <20190820145343.29108-1-megous@megous.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190820145343.29108-1-megous@megous.com>
Sender: netdev-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Ondrej Jirman <megous@megous.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

Some PHYs require separate power supply for I/O pins in some modes
of operation. Add phy-io-supply property, to allow enabling this
power supply.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 304f244e9ab5..782e202aa124 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -47,6 +47,10 @@ properties:
     description:
       PHY regulator
 
+  phy-io-supply:
+    description:
+      PHY I/O pins regulator
+
 required:
   - compatible
   - reg
-- 
2.22.1
