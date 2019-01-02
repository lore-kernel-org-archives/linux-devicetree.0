From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 3/7] dt-bindings: net: stmmac: Add the bindings documentation for delays
Date: Wed,  2 Jan 2019 14:47:25 +0530
Message-ID: <20190102091729.18582-4-vkoul@kernel.org>
References: <20190102091729.18582-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190102091729.18582-1-vkoul@kernel.org>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Niklas Cassel <niklas.cassel@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some controllers require that phy delay should be disabled. So add
optional properties rx-disable-delay and tx-disable-delay for it.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/net/stmmac.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/stmmac.txt b/Documentation/devicetree/bindings/net/stmmac.txt
index cb694062afff..ec18897e22c8 100644
--- a/Documentation/devicetree/bindings/net/stmmac.txt
+++ b/Documentation/devicetree/bindings/net/stmmac.txt
@@ -74,6 +74,8 @@ Optional properties:
 	- snps,mb: mixed-burst
 	- snps,rb: rebuild INCRx Burst
 - mdio: with compatible = "snps,dwmac-mdio", create and register mdio bus.
+- rx-delay-disable: bool, when present disable the rx delay
+- tx-delay-disable: bool, when present disable the tx delay
 - Multiple RX Queues parameters: below the list of all the parameters to
 				 configure the multiple RX queues:
 	- snps,rx-queues-to-use: number of RX queues to be used in the driver
-- 
2.20.1
