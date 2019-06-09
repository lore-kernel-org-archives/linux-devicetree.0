From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC next v1 5/5] arm64: dts: meson: g12a: x96-max: fix the Ethernet PHY reset line
Date: Sun,  9 Jun 2019 20:06:21 +0200
Message-ID: <20190609180621.7607-6-martin.blumenstingl@googlemail.com>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com
Cc: devicetree@vger.kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, khilman@baylibre.com, narmstrong@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The PHY reset line and interrupt line are swapped on the X96 Max
compared to the Odroid-N2 schematics. This means:
- GPIOZ_14 is the interrupt line (on the Odroid-N2 it's the reset line)
- GPIOZ_15 is the reset line (on the Odroid-N2 it's the interrupt line)

Also the GPIOZ_14 and GPIOZ_15 pins are special. The datasheet describes
that they are "3.3V input tolerant open drain (OD) output pins". This
means the GPIO controller can drive the output LOW to reset the PHY. To
release the reset it can only switch the pin to input mode. The output
cannot be driven HIGH for these pins.
This requires configuring the reset line as GPIO_OPEN_SOURCE because
otherwise the PHY will be stuck in "reset" state (because driving the
pin HIGH seeems to result in the same signal as driving it LOW).

Switch to GPIOZ_15 for the reset GPIO with the correct flags and drop
the "snps,reset-active-low" property as this is now encoded in the
GPIO_OPEN_SOURCE flag.

Fixes: 51d116557b2044 ("arm64: dts: meson-g12a-x96-max: Add Gigabit Ethernet Support")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 98bc56e650a0..c93b639679c0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -186,9 +186,8 @@
 	phy-mode = "rgmii";
 	phy-handle = <&external_phy>;
 	amlogic,tx-delay-ns = <2>;
-	snps,reset-gpio = <&gpio GPIOZ_14 0>;
+	snps,reset-gpio = <&gpio GPIOZ_15 GPIO_OPEN_SOURCE>;
 	snps,reset-delays-us = <0 10000 1000000>;
-	snps,reset-active-low;
 };
 
 &pwm_ef {
-- 
2.21.0
