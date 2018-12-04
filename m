From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 2/2] arm64: dts: meson: Remove eee-broken-1000t quirk
Date: Tue,  4 Dec 2018 16:04:47 +0000
Message-ID: <20181204160447.27869-3-ccaione@baylibre.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204160447.27869-1-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, martin.blumenstingl@googlemail.com
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

The change in the macirq IRQ type also solved another long standing
issue affecting this SoC/PHY where EEE was causing the network
connection to die after stressing it with iperf3 (even though much
sooner). It's now possible to remove the 'eee-broken-1000t' quirk as
well.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts              | 1 -
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts      | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi   | 1 -
 4 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 58669abda259..a951a6632d0c 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -221,7 +221,6 @@
 		/* Realtek RTL8211F (0x001cc916) */
 		eth_phy: ethernet-phy@0 {
 			reg = <0>;
-			eee-broken-1000t;
 			interrupt-parent = <&gpio_intc>;
 			/* GPIOH_3 */
 			interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 18778ada7bd3..4d57363ac536 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -357,7 +357,6 @@
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
-			eee-broken-1000t;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 54954b314a45..f8d1cedbe600 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -143,7 +143,6 @@
 			interrupt-parent = <&gpio_intc>;
 			/* MAC_INTR on GPIOZ_15 */
 			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
-			eee-broken-1000t;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index 70325b273bd2..ec09bb5792b7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -142,7 +142,6 @@
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
-			eee-broken-1000t;
 		};
 	};
 };
-- 
2.19.1
