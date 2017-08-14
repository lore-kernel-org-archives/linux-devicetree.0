From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v3 08/10] arm64: dts: hikey960: change bluetooth uart max-speed to 3mbps
Date: Mon, 14 Aug 2017 17:50:47 +0800
Message-ID: <20170814095049.27701-9-guodong.xu@linaro.org>
References: <20170814095049.27701-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170814095049.27701-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, keescook@chromium.org, anton@enomsg.org, ccross@android.com, tony.luck@intel.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

Update bluetooth UART max-speed to 3Mbps

Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index 7770ec7..fd4705c 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -230,7 +230,7 @@
 	bluetooth {
 		compatible = "ti,wl1837-st";
 		enable-gpios = <&gpio15 6 GPIO_ACTIVE_HIGH>;
-		max-speed = <921600>;
+		max-speed = <3000000>;
 	};
 };
 
-- 
2.10.2
