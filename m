From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 2/5] arm64: dts: hi3660: Add stub clock node
Date: Tue, 15 May 2018 10:53:12 +0800
Message-ID: <1526352795-6991-3-git-send-email-leo.yan@linaro.org>
References: <1526352795-6991-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526352795-6991-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Kaihua Zhong <zhongkaihua@huawei.com>, Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Kaihua Zhong <zhongkaihua@huawei.com>

Add stub clock node for hi3660 platform.

Reviewed-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Kaihua Zhong <zhongkaihua@huawei.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
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
