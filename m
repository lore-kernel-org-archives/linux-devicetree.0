From: Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH] arm64: dts: allwinner: a64: Re-add "syscon" compatible
Date: Mon, 17 Sep 2018 16:28:57 +0100
Message-ID: <20180917152857.162662-1-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@linaro.org>, devicetree@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.xyz>
List-Id: devicetree@vger.kernel.org

Commit 1f1f5183981d ("arm64: dts: allwinner: a64: add SRAM controller
device tree node") changed the (so far unused) compatible name of the
sytem controller node, to match a specific SRAM controller driver
instead of relying on the generic syscon driver. The Ethernet driver
needs a register in there, so it got amended to use the new driver instead
of the generic syscon approach. Consequently the "syscon" compatible has
been dropped, as it's not needed anymore and would compete with the
new SRAM driver.

However this breaks existing DT consumers like older kernels, which
expect the node pointed to by the syscon property to contain the string
"syscon" somewhere in the compatible list. When such a DT is given to an
older kernel (<4.19, for instance one on a distro installer image),
the Ethernet will not probe successfully:
----------
dwmac-sun8i 1c30000.ethernet: PTP uses main clock
dwmac-sun8i 1c30000.ethernet: Linked as a consumer to regulator.6
dwmac-sun8i 1c30000.ethernet: Unable to map syscon: -22
dwmac-sun8i 1c30000.ethernet: Dropping the link to regulator.6
dwmac-sun8i: probe of 1c30000.ethernet failed with error -22
----------

To avoid this problem, (re-)add the "syscon" string to the compatible
list of the sytem controller. This should make both older and newer
kernels happy:
- A newer kernel will try to find an existing *device* offering the regmap
  first. The "syscon" string itself will not trigger a driver probe on
  its own, the node must be explicitly referenced by another driver, wanting
  to use the regmap. Newer kernels won't do it this way and will use the
  regmap offered by the SRAM driver.
- An older kernel will try the syscon way, and the system controller /
  SRAM driver DT node is still fully syscon compatible.

So by adding "syscon" we make everyone happy: Newer kernels will ignore
it (knowing a better way), and older kernels will still work.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

I think we need to amend the Ethernet driver now to not too easily use
syscon as a fallback, in case dwmac-sun8i probed earlier than the SRAM driver.
Will try this later tonight, but just wanted to start the discussion.

Thanks,
Andre.

 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index d3daf90a8715..8f2dad7e5d06 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -197,7 +197,8 @@
 		};
 
 		syscon: syscon@1c00000 {
-			compatible = "allwinner,sun50i-a64-system-control";
+			compatible = "allwinner,sun50i-a64-system-control",
+				     "syscon";
 			reg = <0x01c00000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.17.1
