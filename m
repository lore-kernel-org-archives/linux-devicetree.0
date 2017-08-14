From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v3 03/10] arm64: dts: hi3660: add pmu dt node for hi3660
Date: Mon, 14 Aug 2017 17:50:42 +0800
Message-ID: <20170814095049.27701-4-guodong.xu@linaro.org>
References: <20170814095049.27701-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170814095049.27701-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, keescook@chromium.org, anton@enomsg.org, ccross@android.com, tony.luck@intel.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, YiPing Xu <xuyiping@hisilicon.com>, Zhong Kaihua <zhongkaihua@huawei.com>, Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

From: YiPing Xu <xuyiping@hisilicon.com>

Add pmu dt node for hi3660

Signed-off-by: YiPing Xu <xuyiping@hisilicon.com>
Signed-off-by: Zhong Kaihua <zhongkaihua@huawei.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
Tested-by: Jumana Mundichipparakkal <jumana.mp@arm.com>
---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index 1cdd03b..5fd5686 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -202,6 +202,26 @@
 					 IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>,
+				     <&cpu2>,
+				     <&cpu3>,
+				     <&cpu4>,
+				     <&cpu5>,
+				     <&cpu6>,
+				     <&cpu7>;
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
-- 
2.10.2
