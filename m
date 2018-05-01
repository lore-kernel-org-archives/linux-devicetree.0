From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH net-next v2 05/15] dt-bindings: net: dwmac-sun8i: simplify description of syscon property
Date: Wed,  2 May 2018 00:12:17 +0800
Message-ID: <20180501161227.2110-6-wens@csie.org>
References: <20180501161227.2110-1-wens@csie.org>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180501161227.2110-1-wens@csie.org>
Sender: netdev-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

The syscon property is used to point to the device that holds the glue
layer control register known as the "EMAC (or GMAC) clock register".

We do not need to explicitly list what compatible strings are needed, as
this information is readily available in the user manuals. Also the
"syscon" device type is more of an implementation detail. There are many
ways to access a register not in a device's address range, the syscon
interface being the most generic and unrestricted one.

Simplify the description so that it says what it is supposed to
describe.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/devicetree/bindings/net/dwmac-sun8i.txt | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dwmac-sun8i.txt b/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
index 1b8e33e71651..1c0906a5c02b 100644
--- a/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
+++ b/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
@@ -20,12 +20,7 @@ Required properties:
 - phy-handle: See ethernet.txt
 - #address-cells: shall be 1
 - #size-cells: shall be 0
-- syscon: A phandle to the syscon of the SoC with one of the following
- compatible string:
-  - allwinner,sun8i-a83t-system-controller
-  - allwinner,sun8i-h3-system-controller
-  - allwinner,sun8i-v3s-system-controller
-  - allwinner,sun50i-a64-system-controller
+- syscon: A phandle to the device containing the EMAC or GMAC clock register
 
 Optional properties:
 - allwinner,tx-delay-ps: TX clock delay chain value in ps.
-- 
2.17.0
