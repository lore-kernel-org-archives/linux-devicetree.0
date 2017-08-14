From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v3 04/10] arm64: dts: hikey960: Add optee node
Date: Mon, 14 Aug 2017 17:50:43 +0800
Message-ID: <20170814095049.27701-5-guodong.xu@linaro.org>
References: <20170814095049.27701-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170814095049.27701-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, keescook@chromium.org, anton@enomsg.org, ccross@android.com, tony.luck@intel.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Victor Chong <victor.chong@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Victor Chong <victor.chong@linaro.org>

This patch adds op-tee node for hikey960

Signed-off-by: Victor Chong <victor.chong@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index 6609b0f..b96d865 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -159,6 +159,13 @@
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
 };
 
 &i2c0 {
-- 
2.10.2
