From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH RESEND] arm64: dts: hi6220: enable watchdog
Date: Thu,  1 Mar 2018 20:18:47 +0800
Message-ID: <1519906727-11135-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Dmitry Shmidt <dimitrysh@google.com>
List-Id: devicetree@vger.kernel.org

From: Dmitry Shmidt <dimitrysh@google.com>

This patch is to add watchdog binding for Hi6220 on Hikey board.

Signed-off-by: Dmitry Shmidt <dimitrysh@google.com>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 6a180d1..e9d5bb6 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -817,6 +817,14 @@
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
