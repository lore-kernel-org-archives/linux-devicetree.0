From: Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 2/3] ARM: dts: rockchip: phycore: Fix supply node for card's power
Date: Tue, 13 Feb 2018 10:44:33 +0100
Message-ID: <1518515074-22526-2-git-send-email-d.schultz@phytec.de>
References: <1518515074-22526-1-git-send-email-d.schultz@phytec.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518515074-22526-1-git-send-email-d.schultz@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Wadim Egorov <w.egorov@phytec.de>

The card is powered by the RK818 switch vdd_sd which is supplied
by VCC9 (VDD_3V3_IO).

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 arch/arm/boot/dts/rk3288-phycore-rdk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288-phycore-rdk.dts b/arch/arm/boot/dts/rk3288-phycore-rdk.dts
index 1241cbc..ecb26f0 100644
--- a/arch/arm/boot/dts/rk3288-phycore-rdk.dts
+++ b/arch/arm/boot/dts/rk3288-phycore-rdk.dts
@@ -265,7 +265,7 @@
 	disable-wp;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
-	vmmc-supply = <&vdd_io_sd>;
+	vmmc-supply = <&vdd_sd>;
 	vqmmc-supply = <&vdd_io_sd>;
 	status = "okay";
 };
-- 
2.7.4
