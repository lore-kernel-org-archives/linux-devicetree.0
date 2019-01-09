From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH] arm64/hisilicon: fix SDcard detection
Date: Wed,  9 Jan 2019 19:01:32 +0100
Message-ID: <1547056892-16527-1-git-send-email-vincent.guittot@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
List-Id: devicetree@vger.kernel.org

commit 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
has changed how cd_gpios phandle and cd-inverted are used to set gpio's flags.

Since this change, hikey960 SDcard is not detected anymore because flags
are not set correctly. Updating cd-gpios to set GPIO_ACTIVE_LOW instead
of high, fixes the problem.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index 4643546..4ef1642 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -582,7 +582,7 @@
 	sd-uhs-sdr104;
 	disable-wp;
 	cd-inverted;
-	cd-gpios = <&gpio25 3 0>;
+	cd-gpios = <&gpio25 3 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sd_pmx_func
 		     &sd_clk_cfg_func
-- 
2.7.4
