From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH v2 7/8] ARM: dts: sun8i: add pinmux for LCD pins of V3s SoC
Date: Fri, 17 Mar 2017 04:47:47 +0800
Message-ID: <20170316204748.8596-8-icenowy@aosc.xyz>
References: <20170316204748.8596-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170316204748.8596-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Icenowy Zheng <icenowy@aosc.xyz>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Allwinner V3s SoC features a set of pins that have functionality of RGB
LCD, the pins are at different pin ban than other SoCs.

Add pinctrl node for them.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index 3b29f11ad46a..f19258bb821b 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -297,6 +297,15 @@
 				function = "i2c0";
 			};
 
+			lcd_rgb666_pins: lcd_rgb666@0 {
+				pins = "PE0", "PE1", "PE2", "PE3", "PE4",
+				       "PE5", "PE6", "PE7", "PE8", "PE9",
+				       "PE10", "PE11", "PE12", "PE13", "PE14",
+				       "PE15", "PE16", "PE17", "PE18", "PE19",
+				       "PE23", "PE24";
+				function = "lcd";
+			};
+
 			uart0_pins_a: uart0@0 {
 				pins = "PB8", "PB9";
 				function = "uart0";
-- 
2.12.0
