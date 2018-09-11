From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 4/4] arm64: dts: rockchip: Enable SD card detection for Rock960 boards
Date: Tue, 11 Sep 2018 08:00:31 +0530
Message-ID: <20180911023031.4892-5-manivannan.sadhasivam@linaro.org>
References: <20180911023031.4892-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180911023031.4892-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, robh+dt@kernel.org
Cc: vicencb@gmail.com, shawn.lin@rock-chips.com, ezequiel@collabora.com, enric.balletbo@collabora.com, pbrobinson@gmail.com, tom@vamrs.com, dev@vamrs.com, stephen@vamrs.com, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

For proper working of SD cards, let's add the Card Detect GPIO property
to the common devicetree for Rock960 family boards.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
index 5a5d8e28ef55..f68254831ad9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
@@ -403,6 +403,7 @@
 	cap-sd-highspeed;
 	clock-frequency = <100000000>;
 	clock-freq-min-max = <100000 100000000>;
+	cd-gpios = <&gpio0 7 GPIO_ACTIVE_LOW>;
 	disable-wp;
 	sd-uhs-sdr104;
 	vqmmc-supply = <&vcc_sd>;
-- 
2.17.1
