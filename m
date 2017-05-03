From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: [PATCH v5 2/5] ARM: dts: rockchip: add ARM Mali GPU node for rk3288
Date: Wed,  3 May 2017 10:56:26 +0100
Message-ID: <4b93ea388fa72c6dda0bf954104e99bcd1925267.1493804968.git.guillaume.tucker@collabora.com>
References: <cover.1493804968.git.guillaume.tucker@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1493804968.git.guillaume.tucker@collabora.com>
In-Reply-To: <cover.1493804968.git.guillaume.tucker@collabora.com>
References: <cover.1493804968.git.guillaume.tucker@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, Guillaume Tucker <guillaume.tucker@collabora.com>, Sjoerd Simons <sjoerd.simons@collabora.com>, Wookey <wookey@wookware.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, John Reitan <john.reitan@arm.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add Mali GPU device tree node for the rk3288 SoC, with devfreq
opp table.

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---
 arch/arm/boot/dts/rk3288.dtsi | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index df8a0dbe9d91..35969041eae2 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -43,6 +43,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/clock/rk3288-cru.h>
+#include <dt-bindings/power/rk3288-power.h>
 #include <dt-bindings/thermal/thermal.h>
 #include <dt-bindings/power/rk3288-power.h>
 #include <dt-bindings/soc/rockchip,boot-mode.h>
@@ -1117,6 +1118,48 @@
 		};
 	};
 
+	gpu: mali@ffa30000 {
+		compatible = "rockchip,rk3288-mali", "arm,mali-t760", "arm,mali-midgard";
+		reg = <0xffa30000 0x10000>;
+		interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "job", "mmu", "gpu";
+		clocks = <&cru ACLK_GPU>;
+		operating-points-v2 = <&gpu_opp_table>;
+		power-domains = <&power RK3288_PD_GPU>;
+		status = "disabled";
+	};
+
+	gpu_opp_table: opp_table0 {
+		compatible = "operating-points-v2";
+
+		opp@100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <950000>;
+		};
+		opp@200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <950000>;
+		};
+		opp@300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <1000000>;
+		};
+		opp@400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1100000>;
+		};
+		opp@500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <1200000>;
+		};
+		opp@600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <1250000>;
+		};
+	};
+
 	qos_gpu_r: qos@ffaa0000 {
 		compatible = "syscon";
 		reg = <0xffaa0000 0x20>;
-- 
2.11.0
