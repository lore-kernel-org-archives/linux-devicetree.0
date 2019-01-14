From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2] arm64/hisilicon: fix SDcard detection
Date: Mon, 14 Jan 2019 09:24:34 +0100
Message-ID: <1547454274-1674-1-git-send-email-vincent.guittot@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
List-Id: devicetree@vger.kernel.org

The SDcard detection of hikey960 is active low so cd-inverted is wrong.
Instead of adding cd-inverted, we should better set correctly cd-gpios
to use GPIO_ACTIVE_LOW.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---

SD card detection was not working on v5.0-rc1 but patch
https://marc.info/?l=linux-mmc&m=154637189021211&w=2 makes it work.
Nevertheles, latest changes in of_mmc_detection makes possible to have 
a correct DT config.

 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index 71bfe41..dc314e7 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -665,8 +665,7 @@
 	sd-uhs-sdr50;
 	sd-uhs-sdr104;
 	disable-wp;
-	cd-inverted;
-	cd-gpios = <&gpio25 3 0>;
+	cd-gpios = <&gpio25 3 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sd_pmx_func
 		     &sd_clk_cfg_func
-- 
2.7.4
