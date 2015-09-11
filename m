From: Chen Feng <puck.chen@hisilicon.com>
Subject: [PATCH V2 1/3] arm64: dts: Add reset dts config for Hisilicon Hi6220 SoC
Date: Fri, 11 Sep 2015 16:18:36 +0800
Message-ID: <1441959518-178696-1-git-send-email-puck.chen@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: puck.chen@hisilicon.com, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@foxmail.com
Cc: xuyiping@hisilicon.com, bintian.wang@huawei.com, devicetree@vger.kernel.org, dan.zhao@hisilicon.com, suzhuangluan@hisilicon.com, w.f@huawei.com
List-Id: devicetree@vger.kernel.org

Add reset controller for hi6220 hikey-board.

Signed-off-by: Chen Feng <puck.chen@hisilicon.com>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 3f03380..3bbc846 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -167,5 +167,12 @@
 			clocks = <&ao_ctrl 36>, <&ao_ctrl 36>;
 			clock-names = "uartclk", "apb_pclk";
 		};
+
+		reset_ctrl: reset_ctrl@f7030000 {
+			compatible = "hisilicon,hi6220_reset_ctl";
+			reg = <0x0 0xf7030000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 	};
 };
-- 
1.9.1
