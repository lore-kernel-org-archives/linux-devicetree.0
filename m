From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH 2/5] dts: arm64: hi3660: Add stub clock node
Date: Wed,  4 Apr 2018 11:14:32 +0800
Message-ID: <1522811675-12741-3-git-send-email-leo.yan@linaro.org>
References: <1522811675-12741-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522811675-12741-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Xu <xuwei5@hisilicon.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Leo Yan <leo.yan@linaro.org>, Kaihua Zhong <zhongkaihua@huawei.com>, Tao Wang <kevin.wangtao@hisilicon.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Kaihua Zhong <zhongkaihua@huawei.com>

Add stub clock node for hi3660 platform.

Reviewed-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Kaihua Zhong <zhongkaihua@huawei.com>
---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index b9e7c91..3a3bcff 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -282,6 +282,13 @@
 			#mbox-cells = <3>;
 		};
 
+		stub_clock: stub_clock@e896b500 {
+			compatible = "hisilicon,hi3660-stub-clk";
+			reg = <0x0 0xe896b500 0x0 0x0100>;
+			#clock-cells = <1>;
+			mboxes = <&mailbox 13 3 0>;
+		};
+
 		dual_timer0: timer@fff14000 {
 			compatible = "arm,sp804", "arm,primecell";
 			reg = <0x0 0xfff14000 0x0 0x1000>;
-- 
1.9.1
