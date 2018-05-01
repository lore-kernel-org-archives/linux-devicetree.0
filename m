From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH net-next v2 03/15] dt-bindings: net: dwmac-sun8i: Clean up
 clock delay chain descriptions
Date: Wed,  2 May 2018 00:12:15 +0800
Message-ID: <20180501161227.2110-4-wens@csie.org>
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

The clock delay chains found in the glue layer for dwmac-sun8i are only
used with RGMII PHYs. They are not intended for non-RGMII PHYs, such as
MII external PHYs or the internal PHY. Also, a recent SoC has a smaller
range of possible values for the delay chain.

This patch reformats the delay chain section of the device tree binding
to make it clear that the delay chains only apply to RGMII PHYs, and
make it easier to add the R40-specific bits later.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/devicetree/bindings/net/dwmac-sun8i.txt | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dwmac-sun8i.txt b/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
index 3d6d5fa0c4d5..e04ce75e24a3 100644
--- a/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
+++ b/Documentation/devicetree/bindings/net/dwmac-sun8i.txt
@@ -28,10 +28,13 @@ Required properties:
   - allwinner,sun8i-a83t-system-controller
 
 Optional properties:
-- allwinner,tx-delay-ps: TX clock delay chain value in ps. Range value is 0-700. Default is 0)
-- allwinner,rx-delay-ps: RX clock delay chain value in ps. Range value is 0-3100. Default is 0)
-Both delay properties need to be a multiple of 100. They control the delay for
-external PHY.
+- allwinner,tx-delay-ps: TX clock delay chain value in ps.
+			 Range is 0-700. Default is 0.
+- allwinner,rx-delay-ps: RX clock delay chain value in ps.
+			 Range is 0-3100. Default is 0.
+Both delay properties need to be a multiple of 100. They control the
+clock delay for external RGMII PHY. They do not apply to the internal
+PHY or external non-RGMII PHYs.
 
 Optional properties for the following compatibles:
   - "allwinner,sun8i-h3-emac",
-- 
2.17.0
