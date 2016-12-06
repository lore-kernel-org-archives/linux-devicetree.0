From: jorik@kippendief.biz
Subject: [PATCH] dts: sun8i-h3: correct UART3 pin definitions
Date: Tue,  6 Dec 2016 15:27:10 +0100
Message-ID: <20161206142710.6450-1-jorik@kippendief.biz>
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
To: arm@kernel.org, maxime.ripard@free-electrons.com, wens@csie.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, Jorik Jonker <jorik@kippendief.biz>
List-Id: devicetree@vger.kernel.org

From: Jorik Jonker <jorik@kippendief.biz>

In a previous commit, I made a copy/paste error in the pinmux
definitions of UART3: PG{13,14} instead of PA{13,14}. This commit takes
care of that. I have tested this commit on Orange Pi PC and Orange Pi
Plus, and it works for these boards.

Fixes: e3d11d3c45c5 ("dts: sun8i-h3: add pinmux definitions for
UART2-3")

Signed-off-by: Jorik Jonker <jorik@kippendief.biz>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 75a8654..f4ba088 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -410,7 +410,7 @@
 			};
 
 			uart3_pins: uart3 {
-				allwinner,pins = "PG13", "PG14";
+				allwinner,pins = "PA13", "PA14";
 				allwinner,function = "uart3";
 				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
-- 
2.9.3
