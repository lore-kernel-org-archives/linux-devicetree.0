From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 3/4] ARM: dts: Add FIMD node to Origen4210 board
Date: Tue, 11 Jun 2013 11:59:51 +0530
Message-ID: <1370932192-19365-4-git-send-email-sachin.kamat@linaro.org>
References: <1370932192-19365-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1370932192-19365-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.figa@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

Added FIMD and display timing node to Origen4210 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
No change since v1.
---
 arch/arm/boot/dts/exynos4210-origen.dts |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index bcf8079..4c6c3cd 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -290,4 +290,25 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	fimd@11c00000 {
+		pinctrl-0 = <&lcd_en &lcd_clk &lcd_data24 &pwm0_out>;
+		pinctrl-names = "default";
+		status = "okay";
+	};
+
+	display-timings {
+		native-mode = <&timing0>;
+		timing0: timing {
+			clock-frequency = <50000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <64>;
+			hback-porch = <16>;
+			hsync-len = <48>;
+			vback-porch = <64>;
+			vfront-porch = <16>;
+			vsync-len = <3>;
+		};
+	};
 };
-- 
1.7.9.5
