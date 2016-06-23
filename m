From: megous@megous.com
Subject: [PATCH 13/14] ARM: dts: sun8i: Add gpio-regulator used on Orange Pi
 One
Date: Thu, 23 Jun 2016 21:21:03 +0200
Message-ID: <20160623192104.18720-14-megous@megous.com>
References: <20160623192104.18720-1-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160623192104.18720-1-megous@megous.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dev@linux-sunxi.org
Cc: Ondrej Jirman <megous@megous.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

Xulong Orange Pi One uses GPIO based regulator that
switches between two voltages: 1.1V and 1.3V. The
regulator is controlled from the PL6 pin.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
index 0adf932..ce4ba91 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
@@ -88,6 +88,25 @@
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	vdd_soc: gpio-regulator {
+		compatible = "regulator-gpio";
+
+		regulator-name = "soc-vdd-supply";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1300000>;
+		regulator-boot-on;
+		regulator-type = "voltage";
+
+		gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>;
+		states = <1100000 0x0
+			  1300000 0x1>;
+
+		startup-delay-us = <100000>;
+		enable-active-high;
+	};
+};
+
 };
 
 &ehci1 {
@@ -131,6 +150,13 @@
 		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
+
+	soc_reg0: soc_reg@0 {
+		allwinner,pins = "PL6";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+	};
 };
 
 &uart0 {
-- 
2.9.0
