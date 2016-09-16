From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH v4 1/2] ARM: dts: sun8i: add pinmux for UART1 at PG
Date: Fri, 16 Sep 2016 23:16:41 +0800
Message-ID: <20160916151642.27907-1-icenowy@aosc.xyz>
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
To: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.xyz>
List-Id: devicetree@vger.kernel.org

The UART1 at PG (PG6, PG7, PG8, PG9) is, in the Allwinner's reference
tablet design of A23/33, used to connect to UART Bluetooth cards.

Add the pinmux for it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
This patch is splited in v4.

 arch/arm/boot/dts/sun8i-a23-a33.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
index 7e05e09..c340885 100644
--- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
@@ -361,6 +361,20 @@
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
+			uart1_pins_a: uart1@0 {
+				allwinner,pins = "PG6", "PG7";
+				allwinner,function = "uart1";
+				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+			};
+
+			uart1_pins_cts_rts_a: uart1-cts-rts@0 {
+				allwinner,pins = "PG8", "PG9";
+				allwinner,function = "uart1";
+				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+			};
+
 			mmc0_pins_a: mmc0@0 {
 				allwinner,pins = "PF0", "PF1", "PF2",
 						 "PF3", "PF4", "PF5";
-- 
2.9.3
