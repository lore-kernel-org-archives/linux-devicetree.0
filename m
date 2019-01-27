From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 4/5] ARM: dts: sun5i: q8-tablet: Add LCD Panel power supply
Date: Sun, 27 Jan 2019 22:48:37 +0800
Message-ID: <20190127144838.3578-5-wens@csie.org>
References: <20190127144838.3578-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190127144838.3578-1-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The A13 Q8 tablet, following the A13 reference tablet design, has the
system's fixed 3.3V rail feed the VCC supply of the LCD panel.
Additional voltage rails used by the panel are generated using a
regulator fed from the unregulated IPSOUT output of the PMIC. The latter
is unrepresentable in the device tree. Both are controlled with MOSFETs
by the enable GPIO added in the previous patch. The actual enable or
reset pin for the panel is tied directly to LCD-VCC after the MOSFET.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun5i-a13-q8-tablet.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts b/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts
index ead159f89e74..c77c0758145a 100644
--- a/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts
+++ b/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts
@@ -50,6 +50,7 @@
 
 	panel: panel {
 		compatible = "urt,umsh-8596md-t", "simple-panel";
+		power-supply = <&reg_vcc3v3>;
 		enable-gpios = <&axp_gpio 0 GPIO_ACTIVE_HIGH>; /* AXP GPIO0 */
 		backlight = <&backlight>;
 		#address-cells = <1>;
-- 
2.20.1
