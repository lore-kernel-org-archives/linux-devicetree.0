From: Chen Feng <puck.chen@hisilicon.com>
Subject: [PATCH V4 3/3] arm64: dts: Add reset dts config for Hisilicon Hi6220 SoC
Date: Thu, 17 Sep 2015 20:00:02 +0800
Message-ID: <1442491202-211336-3-git-send-email-puck.chen@hisilicon.com>
References: <1442491202-211336-1-git-send-email-puck.chen@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442491202-211336-1-git-send-email-puck.chen@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@foxmail.com, arnd@arndb.de, puck.chen@hisilicon.com
Cc: bintian.wang@huawei.com, xuyiping@hisilicon.com, devicetree@vger.kernel.org, dan.zhao@hisilicon.com, suzhuangluan@hisilicon.com, w.f@huawei.com, kong.kongxinwei@hisilicon.com, yudongbin@hisilicon.com, peter.panshilin@hisilicon.com, qijiwen@hisilicon.com
List-Id: devicetree@vger.kernel.org

Add reset controller for hi6220 hikey-board.

Signed-off-by: Chen Feng <puck.chen@hisilicon.com>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 3f03380..3f055e2 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -167,5 +167,12 @@
 			clocks = <&ao_ctrl 36>, <&ao_ctrl 36>;
 			clock-names = "uartclk", "apb_pclk";
 		};
+
+		reset_ctrl: reset_ctrl@f7030000 {
+			compatible = "hisilicon,hi6220-reset-ctl";
+			reg = <0x0 0xf7030000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 	};
 };
-- 
1.9.1
