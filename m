From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v2 10/12] ARM: dts: rockchip: add the sdmmc for kylin board
Date: Thu,  7 Jan 2016 16:25:53 +0800
Message-ID: <1452155155-16232-11-git-send-email-wxt@rock-chips.com>
References: <1452155155-16232-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452155155-16232-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-rockchip@lists.infradead.org, leecam@google.com, leozwang@google.com, keescook@google.com, Caesar Wang <wxt@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

We should add the sdmmc but enabling it, since the sdmmc and
uart2 ie reusing the same pin.
That will cause the debug information can't display on console.

Anyway, you only need add the okay status if someone wants to enable
the sdmmc.

e.g.
if you use the adb to debug and run with android os.
you can add the
status = "okay" to enable the sdmmc for sd card working.

Signed-off-by: Caesar Wang <wxt@rock-chips.com>
---

Changes in v2: None

 arch/arm/boot/dts/rk3036-kylin.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/rk3036-kylin.dts b/arch/arm/boot/dts/rk3036-kylin.dts
index c5e46f9..2dbc7bb 100644
--- a/arch/arm/boot/dts/rk3036-kylin.dts
+++ b/arch/arm/boot/dts/rk3036-kylin.dts
@@ -357,6 +357,17 @@
 	pinctrl-0 = <&sdio_clk &sdio_cmd &sdio_bus4>;
 };
 
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	card-detect-delay = <200>;
+	disable-wp;
+	num-slots = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_clk>, <&sdmmc_cmd>, <&sdmmc_cd>, <&sdmmc_bus4>;
+};
+
 &uart2 {
 	status = "okay";
 };
@@ -394,6 +405,12 @@
 		};
 	};
 
+	sdmmc {
+		sdmmc_pwr: sdmmc-pwr {
+			rockchip,pins = <2 28 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	sleep {
 		global_pwroff: global-pwroff {
 			rockchip,pins = <2 7 RK_FUNC_1 &pcfg_pull_none>;
-- 
1.9.1
