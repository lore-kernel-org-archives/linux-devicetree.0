From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 04/13] arm64: dts: rockchip: add default px30 emmc pinctrl
Date: Tue, 17 Sep 2019 10:26:50 +0200
Message-ID: <20190917082659.25549-4-heiko@sntech.de>
References: <20190917082659.25549-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917082659.25549-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-rockchip@lists.infradead.org, christoph.muellner@theobroma-systems.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

emmc chips are normally hooked up in standard ways using the full 8bit
bus connection, so there should be no need for all future boards to define
this on their own. So add default pin setups for 8bit busses and special
boards really only needing 4 or 1 bit connections can override.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index a178d6e2c279..f2bbdfa0e4aa 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -794,6 +794,8 @@
 		clock-names = "biu", "ciu", "ciu-drv", "ciu-sample";
 		fifo-depth = <0x100>;
 		max-frequency = <150000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&emmc_clk &emmc_cmd &emmc_bus8>;
 		power-domains = <&power PX30_PD_MMC_NAND>;
 		status = "disabled";
 	};
-- 
2.20.1
