From: Kaihua Zhong <zhongkaihua@huawei.com>
Subject: [PATCH 3/3] arm64: dts: Hi3660: Add binding for stub clock
Date: Fri, 3 Nov 2017 15:25:07 +0800
Message-ID: <1509693907-90682-4-git-send-email-zhongkaihua@huawei.com>
References: <1509693907-90682-1-git-send-email-zhongkaihua@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1509693907-90682-1-git-send-email-zhongkaihua@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, xuejiancheng@hisilicon.com, wenpan@hisilicon.com, leo.yan@linaro.org, zhangfei.gao@linaro.org, guodong.xu@linaro.org, zhongkaihua@huawei.com, chenjun14@huawei.com
Cc: xuezhiliang@hisilicon.com, devicetree@vger.kernel.org, suzhuangluan@hisilicon.com, linux-kernel@vger.kernel.org, kevin.wangtao@hisilicon.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add DT binding for Hi3660 stub clock driver.

Reviewed-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Kai Zhao <zhaokai1@hisilicon.com>
Signed-off-by: Kevin Wang <kevin.wangtao@hisilicon.com>
Signed-off-by: Ruyi Wang <wangruyi@huawei.com>
Signed-off-by: Kaihua Zhong <zhongkaihua@huawei.com>
---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index b7a90d6..89a2a13 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -285,6 +285,14 @@
 			#reset-cells = <2>;
 		};
 
+		stub_clock: stub_clock {
+			compatible = "hisilicon,hi3660-stub-clk";
+			reg = <0x0 0xe896b500 0x0 0x0100>;
+			#clock-cells = <1>;
+			x-names = "mbox-tx";
+			xes = <&mailbox 13 3 0>;
+		};
+
 		dual_timer0: timer@fff14000 {
 			compatible = "arm,sp804", "arm,primecell";
 			reg = <0x0 0xfff14000 0x0 0x1000>;
-- 
1.9.1
