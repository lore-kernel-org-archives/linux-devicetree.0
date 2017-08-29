From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH 2/2] arm64: dts: hi6220: enable watchdog
Date: Tue, 29 Aug 2017 15:58:38 +0800
Message-ID: <1503993518-24428-2-git-send-email-leo.yan@linaro.org>
References: <1503993518-24428-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503993518-24428-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Zhangfei Gao <zhangfei.gao@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Dmitry Shmidt <dimitrysh@google.com>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Dmitry Shmidt <dimitrysh@google.com>

This patch is to add watchdog binding for Hi6220 on Hikey board.

Signed-off-by: Dmitry Shmidt <dimitrysh@google.com>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index eacbe0d..77dc28f 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -809,6 +809,14 @@
 			pinctrl-1 = <&sdio_pmx_idle &sdio_clk_cfg_idle &sdio_cfg_idle>;
 		};
 
+		watchdog0: watchdog@f8005000 {
+			compatible = "arm,sp805-wdt", "arm,primecell";
+			reg = <0x0 0xf8005000 0x0 0x1000>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ao_ctrl HI6220_WDT0_PCLK>;
+			clock-names = "apb_pclk";
+		};
+
 		tsensor: tsensor@0,f7030700 {
 			compatible = "hisilicon,tsensor";
 			reg = <0x0 0xf7030700 0x0 0x1000>;
-- 
2.7.4
