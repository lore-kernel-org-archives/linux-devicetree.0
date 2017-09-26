From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH v3 08/14] ARM: dts: sun8i: orangepipc: Fix node with unit name
 and no reg property
Date: Tue, 26 Sep 2017 09:22:28 +0200
Message-ID: <20170926072234.27481-9-clabbe.montjoie@gmail.com>
References: <20170926072234.27481-1-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170926072234.27481-1-clabbe.montjoie@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, wens@csie.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch fix the warning "xxx has a unit name, but no reg property" by
removing "@0" from such node.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
index f5f0f15a2088..6d98bcfbe877 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
@@ -158,19 +158,19 @@
 };
 
 &pio {
-	leds_opc: led_pins@0 {
+	leds_opc: led_pins {
 		pins = "PA15";
 		function = "gpio_out";
 	};
 };
 
 &r_pio {
-	leds_r_opc: led_pins@0 {
+	leds_r_opc: led_pins {
 		pins = "PL10";
 		function = "gpio_out";
 	};
 
-	sw_r_opc: key_pins@0 {
+	sw_r_opc: key_pins {
 		pins = "PL3";
 		function = "gpio_in";
 	};
-- 
2.13.5
