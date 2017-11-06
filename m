From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 3/4] arm64: dts: hisilicon: hi6220-hikey: Allow USR1 LED to notify kernel panic
Date: Mon,  6 Nov 2017 12:38:15 +0530
Message-ID: <c3407f283fab925ce9097dd05dde41c8a4956265.1509951550.git.amit.kucheria@linaro.org>
References: <cover.1509951550.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1509951550.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1509951550.git.amit.kucheria@linaro.org>
References: <cover.1509951550.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: amit.kucheria@linaro.org, linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, xuwei5@hisilicon.com, andy.gross@linaro.org, manivannan.sadhasivam@linaro.org, devicetree@vger.kernel.org, timur@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
List-Id: devicetree@vger.kernel.org

Blink the LED on a kernel panic.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Acked-by: Guodong Xu <guodong.xu@linaro.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 3aee612..e94fa1a 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -359,6 +359,7 @@
 		user_led1 {
 			label = "user_led1";
 			gpios = <&gpio4 3 0>; /* <&gpio_user_led_4>; */
+			panic-indicator;
 			linux,default-trigger = "cpu0";
 		};
 
-- 
2.7.4
