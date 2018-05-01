From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH net-next v2 06/15] dt-bindings: net: dwmac-sun8i: Add binding
 for GMAC on Allwinner R40 SoC
Date: Wed,  2 May 2018 00:12:18 +0800
Message-ID: <20180501161227.2110-7-wens@csie.org>
References: <20180501161227.2110-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180501161227.2110-1-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

The Allwinner R40 SoC has the EMAC controller supported by dwmac-sun8i.
It is named "GMAC", while EMAC refers to the 10/100 Mbps Ethernet
controller supported by sun4i-emac. The controller is the same, but
the R40 has the glue layer controls in the clock control unit (CCU),
with a reduced RX delay chain, and no TX delay chain.

This patch adds the R40 specific bits to the dwmac-sun8i binding.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/devicetree/bindings/net/dwmac-sun8i.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dwmac-sun8i.txt b/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
index 1c0906a5c02b..cfe724398a12 100644
--- a/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
+++ b/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
@@ -7,6 +7,7 @@ Required properties:
 - compatible: must be one of the following string:
 		"allwinner,sun8i-a83t-emac"
 		"allwinner,sun8i-h3-emac"
+		"allwinner,sun8i-r40-gmac"
 		"allwinner,sun8i-v3s-emac"
 		"allwinner,sun50i-a64-emac"
 - reg: address and length of the register for the device.
@@ -25,8 +26,10 @@ Required properties:
 Optional properties:
 - allwinner,tx-delay-ps: TX clock delay chain value in ps.
 			 Range is 0-700. Default is 0.
+			 Unavailable for allwinner,sun8i-r40-gmac
 - allwinner,rx-delay-ps: RX clock delay chain value in ps.
 			 Range is 0-3100. Default is 0.
+			 Range is 0-700 for allwinner,sun8i-r40-gmac
 Both delay properties need to be a multiple of 100. They control the
 clock delay for external RGMII PHY. They do not apply to the internal
 PHY or external non-RGMII PHYs.
-- 
2.17.0
