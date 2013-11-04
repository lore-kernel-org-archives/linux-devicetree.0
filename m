From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv3 1/3] ARM: dts: exynos4212: Add PMU dt data for pmu-irq
Date: Mon, 04 Nov 2013 10:55:59 +0900
Message-ID: <1383530161-24080-2-git-send-email-cw00.choi@samsung.com>
References: <1383530161-24080-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1383530161-24080-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: kgene.kim@samsung.com, t.figa@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4212.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
index 6f34d7f..3081bae 100644
--- a/arch/arm/boot/dts/exynos4212.dtsi
+++ b/arch/arm/boot/dts/exynos4212.dtsi
@@ -56,4 +56,10 @@
 					<0x5 0 &gic 1 12 0>;
 		};
 	};
+
+	pmu {
+		compatible = "arm,cortex-a9-pmu";
+		interrupt-parent = <&combiner>;
+		interrupts = <2 2>, <3 2>;
+	};
 };
-- 
1.8.0
