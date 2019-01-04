From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/4] ARM: dts: rockchip: rv1108: Add spim0 and spim1 pinctrl groups
Date: Thu,  3 Jan 2019 23:40:21 -0200
Message-ID: <20190104014023.17973-2-otavio@ossystems.com.br>
References: <20190104014023.17973-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190104014023.17973-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Jason Zhu <jason.zhu@rock-chips.com>, Vicent Chi <vicent.chi@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Philipp Tomsic <philipp.tomsich@theobroma-systems.com>, Otavio Salvador <otavio@ossystems.com.br>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add the pin settings for the SPI pins so they can be used across
multiple boards.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 arch/arm/boot/dts/rv1108.dtsi | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index cb26d9d98c34..f47ac86d2852 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -834,6 +834,42 @@
 			};
 		};
 
+		spim0 {
+			spim0_clk: spim0-clk {
+				rockchip,pins = <1 RK_PD0 RK_FUNC_2 &pcfg_pull_up>;
+			};
+
+			spim0_cs0: spim0-cs0 {
+				rockchip,pins = <1 RK_PD1 RK_FUNC_2 &pcfg_pull_up>;
+			};
+
+			spim0_tx: spim0-tx {
+				rockchip,pins = <1 RK_PD3 RK_FUNC_2 &pcfg_pull_up>;
+			};
+
+			spim0_rx: spim0-rx {
+				rockchip,pins = <1 RK_PD2 RK_FUNC_2 &pcfg_pull_up>;
+			};
+		};
+
+		spim1 {
+			spim1_clk: spim1-clk {
+				rockchip,pins = <0 RK_PA3 RK_FUNC_1 &pcfg_pull_up>;
+			};
+
+			spim1_cs0: spim1-cs0 {
+				rockchip,pins = <0 RK_PA4 RK_FUNC_1 &pcfg_pull_up>;
+			};
+
+			spim1_rx: spim1-rx {
+				rockchip,pins = <0 RK_PB0 RK_FUNC_1 &pcfg_pull_up>;
+			};
+
+			spim1_tx: spim1-tx {
+				rockchip,pins = <0 RK_PA7 RK_FUNC_1 &pcfg_pull_up>;
+			};
+		};
+
 		tsadc {
 			otp_out: otp-out {
 				rockchip,pins = <0 RK_PB7 RK_FUNC_1 &pcfg_pull_none>;
-- 
2.20.1
