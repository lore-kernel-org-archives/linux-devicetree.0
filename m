From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH] arm64: dts: allwinner: h6: Add LED device nodes for Pine H64
Date: Wed, 20 Jun 2018 15:13:41 +0800
Message-ID: <20180620071341.8143-1-wens@csie.org>
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
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Pine H64 has 3 GPIO-controlled LEDs, which are labeled "heartbeat",
"link", and "status".

Add device nodes for them.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index b6f2d6b2ecae..2e97173c9204 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -20,6 +20,25 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		heartbeat {
+			label = "pine-h64:green:heartbeat";
+			gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
+		};
+
+		link {
+			label = "pine-h64:white:link";
+			gpios = <&r_pio 0 3 GPIO_ACTIVE_HIGH>; /* PL3 */
+		};
+
+		status {
+			label = "pine-h64:blue:status";
+			gpios = <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
+		};
+	};
 };
 
 &r_i2c {
-- 
2.17.1
