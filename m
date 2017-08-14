From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v3 06/10] arm64: dts: hikey960: Add pstore support
Date: Mon, 14 Aug 2017 17:50:45 +0800
Message-ID: <20170814095049.27701-7-guodong.xu@linaro.org>
References: <20170814095049.27701-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170814095049.27701-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, keescook@chromium.org, anton@enomsg.org, ccross@android.com, tony.luck@intel.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Guodong Xu <guodong.xu@linaro.org>, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch reserves some memory in the DTS and sets up a
pstore device tree node to enable pstore support on HiKey960.

Cc: John Stultz <john.stultz@linaro.org>
Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index ce5e874..7770ec7 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -39,6 +39,20 @@
 		reg = <0x0 0x0 0x0 0x0>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops@32000000 {
+			compatible = "ramoops";
+			reg = <0x0 0x32000000 0x0 0x00100000>;
+			record-size	= <0x00020000>;
+			console-size	= <0x00020000>;
+			ftrace-size	= <0x00020000>;
+		};
+	};
+
 	reboot-mode-syscon@32100000 {
 		compatible = "syscon", "simple-mfd";
 		reg = <0x0 0x32100000 0x0 0x00001000>;
-- 
2.10.2
