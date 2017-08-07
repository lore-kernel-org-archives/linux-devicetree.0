From: Zhong Kaihua <zhongkaihua@huawei.com>
Subject: [PATCH 2/3] dts: arm64: add mailbox binding for hi3660
Date: Mon, 7 Aug 2017 17:17:13 +0800
Message-ID: <1502097434-11136-2-git-send-email-zhongkaihua@huawei.com>
References: <1502097434-11136-1-git-send-email-zhongkaihua@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502097434-11136-1-git-send-email-zhongkaihua@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, jassisinghbrar@gmail.com, puck.chen@hisilicon.com, leo.yan@linaro.org, wangruyi@huawei.com, zhongkaihua@huawei.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: john.stultz@linaro.org, guodong.xu@linaro.org, zhangfei.gao@linaro.org, jason.liu@linaro.org, dan.zhao@hisilicon.com, suzhuangluan@hisilicon.com, xuezhiliang@hisilicon.com, xupeng7@huawei.com, chenjun14@huawei.com, hanwei.hanwei@huawei.com, hezetong@huawei.com, wuze1@huawei.com
List-Id: devicetree@vger.kernel.org

From: Kaihua Zhong <zhongkaihua@huawei.com>

Add binding for mailbox driver.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Ruyi Wang <wangruyi@huawei.com>
Tested-by: Kaihua Zhong <zhongkaihua@huawei.com>

---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index eca984c..ac20065 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -291,6 +291,14 @@
 			#reset-cells = <2>;
 		};
 
+		mailbox: mailbox@e896b000 {
+			compatible = "hisilicon,hi3660-mbox";
+			reg = <0x0 0xe896b000 0x0 0x1000>;
+			interrupts = <0x0 0xc0 0x4>,
+			<0x0 0xc1 0x4>;
+			#mbox-cells = <3>;
+		};
+
 		dual_timer0: timer@fff14000 {
 			compatible = "arm,sp804", "arm,primecell";
 			reg = <0x0 0xfff14000 0x0 0x1000>;
-- 
1.8.3.2
