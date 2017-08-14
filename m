From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v3 05/10] arm64: dts: hikey960: Add support for syscon-reboot-mode
Date: Mon, 14 Aug 2017 17:50:44 +0800
Message-ID: <20170814095049.27701-6-guodong.xu@linaro.org>
References: <20170814095049.27701-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170814095049.27701-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, keescook@chromium.org, anton@enomsg.org, ccross@android.com, tony.luck@intel.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Guodong Xu <guodong.xu@linaro.org>, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

Add support to hikey960 dts for the syscon-reboot-mode driver.

Cc: John Stultz <john.stultz@linaro.org>
Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index b96d865..ce5e874 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -39,6 +39,20 @@
 		reg = <0x0 0x0 0x0 0x0>;
 	};
 
+	reboot-mode-syscon@32100000 {
+		compatible = "syscon", "simple-mfd";
+		reg = <0x0 0x32100000 0x0 0x00001000>;
+
+		reboot-mode {
+			compatible = "syscon-reboot-mode";
+			offset = <0x0>;
+
+			mode-normal	= <0x77665501>;
+			mode-bootloader	= <0x77665500>;
+			mode-recovery	= <0x77665502>;
+		};
+	};
+
 	keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
-- 
2.10.2
