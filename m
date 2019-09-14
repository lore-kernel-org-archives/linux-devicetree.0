From: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] arm64: dts: meson: Add capacity-dmips-mhz attributes to G12B
Date: Sat, 14 Sep 2019 06:49:40 +0400
Message-ID: <1568429380-3231-1-git-send-email-christianshewitt@gmail.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Frank Hartung <supervisedthinking@gmail.com>, Christian Hewitt <christianshewitt@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Frank Hartung <supervisedthinking@gmail.com>

From: Frank Hartung <supervisedthinking@gmail.com>

Meson G12B SoCs (S922X and A311D) are a big-little design where not all CPUs
are equal; the A53s cores are weaker than the A72s.

Include capacity-dmips-mhz properties to tell the OS there is a difference
in processing capacity. The dmips values are based on similar submissions for
other A53/A72 SoCs: HiSilicon 3660 [1] and Rockchip RK3399 [2].

This change is particularly beneficial for use-cases like retro gaming where
emulators often run on a single core. The OS now chooses an A72 core instead
of an A53 core.

[1] https://lore.kernel.org/patchwork/patch/862742/
[2] https://patchwork.kernel.org/patch/10836577/

Signed-off-by: Frank Hartung <supervisedthinking@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index 5628ccd..7f78d88 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -49,6 +49,7 @@
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <592>;
 			next-level-cache = <&l2>;
 		};
 
@@ -57,6 +58,7 @@
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <592>;
 			next-level-cache = <&l2>;
 		};
 
@@ -65,6 +67,7 @@
 			compatible = "arm,cortex-a73";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2>;
 		};
 
@@ -73,6 +76,7 @@
 			compatible = "arm,cortex-a73";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2>;
 		};
 
@@ -81,6 +85,7 @@
 			compatible = "arm,cortex-a73";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2>;
 		};
 
@@ -89,6 +94,7 @@
 			compatible = "arm,cortex-a73";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2>;
 		};
 
-- 
2.7.4
