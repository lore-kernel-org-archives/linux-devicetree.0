From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH 08/12] arm64: dts: hikey960: add WL1837 Bluetooth device node
Date: Wed, 17 May 2017 16:37:41 +0800
Message-ID: <20170517083745.24479-9-guodong.xu@linaro.org>
References: <20170517083745.24479-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170517083745.24479-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, wangkefeng.wang@huawei.com, puck.chen@hisilicon.com, xuejiancheng@hisilicon.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

This adds the serial slave device for the WL1837 Bluetooth interface.

Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index 513c496..69aa207 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -9,6 +9,7 @@
 
 #include "hi3660.dtsi"
 #include "hikey960-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "HiKey960";
@@ -55,6 +56,16 @@
 	status = "okay";
 };
 
+&uart4 {
+	status = "okay";
+	max-speed = <921600>;
+
+	bluetooth {
+		compatible = "ti,wl1837-st";
+		enable-gpios = <&gpio15 6 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &uart6 {
 	status = "okay";
 };
-- 
2.10.2
