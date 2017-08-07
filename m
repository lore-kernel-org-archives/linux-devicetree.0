From: Zhong Kaihua <zhongkaihua@huawei.com>
Subject: [PATCH 2/2] dts: arm64: bind stub clock driver for Hi3660
Date: Mon, 7 Aug 2017 17:19:15 +0800
Message-ID: <1502097555-11541-2-git-send-email-zhongkaihua@huawei.com>
References: <1502097555-11541-1-git-send-email-zhongkaihua@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1502097555-11541-1-git-send-email-zhongkaihua@huawei.com>
Sender: linux-clk-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org, puck.chen@hisilicon.com, leo.yan@linaro.org, wangruyi@huawei.com, zhongkaihua@huawei.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: john.stultz@linaro.org, guodong.xu@linaro.org, zhangfei.gao@linaro.org, jason.liu@linaro.org, dan.zhao@hisilicon.com, suzhuangluan@hisilicon.com, xuezhiliang@hisilicon.com, xupeng7@huawei.com, chenjun14@huawei.com, hanwei.hanwei@huawei.com, hezetong@huawei.com, wuze1@huawei.com, Kai Zhao <zhaokai1@hisilicon.com>, Tao Wang <kevin.wangtao@hisilicon.com>
List-Id: devicetree@vger.kernel.org

From: Kaihua Zhong <zhongkaihua@huawei.com>

Add binding to stub clock driver.

Signed-off-by: Kai Zhao <zhaokai1@hisilicon.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Tao Wang <kevin.wangtao@hisilicon.com>
Signed-off-by: Ruyi Wang <wangruyi@huawei.com>
Tested-by: Kaihua Zhong <zhongkaihua@huawei.com>

---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index ac20065..f23df62 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -299,6 +299,14 @@
 			#mbox-cells = <3>;
 		};
 
+		stub_clock: stub_clock {
+			compatible = "hisilicon,hi3660-stub-clk";
+			reg = <0x0 0xe896b500 0x0 0x0100>;
+			#clock-cells = <1>;
+			mbox-names = "mbox-tx";
+			mboxes = <&mailbox 13 3 0>;
+		};
+
 		dual_timer0: timer@fff14000 {
 			compatible = "arm,sp804", "arm,primecell";
 			reg = <0x0 0xfff14000 0x0 0x1000>;
-- 
1.8.3.2

