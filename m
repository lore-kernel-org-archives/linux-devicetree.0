From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 8/9] ARM64: dts: amlogic: enable gpio interrupt controller on
 gxbb
Date: Wed, 19 Oct 2016 12:08:28 +0200
Message-ID: <1476871709-8359-9-git-send-email-jbrunet@baylibre.com>
References: <1476871709-8359-1-git-send-email-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1476871709-8359-1-git-send-email-jbrunet@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index aad639ab0112..5208cb80b55e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -141,6 +141,13 @@
 		#reset-cells = <1>;
 	};
 
+	gpio_interrupt: interrupt-controller@9880 {
+		compatible = "amlogic,meson-gxbb-gpio-intc";
+		reg = <0x0 0x9880 0x0 0x10>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
 	uart_B: serial@84dc {
 		compatible = "amlogic,meson-uart";
 		reg = <0x0 0x84dc 0x0 0x14>;
@@ -238,6 +245,7 @@
 			reg-names = "mux", "pull", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-parent = <&gpio_interrupt>;
 		};
 
 		uart_ao_a_pins: uart_ao_a {
@@ -343,6 +351,7 @@
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-parent = <&gpio_interrupt>;
 		};
 
 		emmc_pins: emmc {
-- 
2.7.4
