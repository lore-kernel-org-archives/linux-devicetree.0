From: Finley Xiao <finley.xiao@rock-chips.com>
Subject: [PATCH v5 2/4] ARM: dts: rockchip: update compatible strings for Rockchip efuse
Date: Thu,  1 Sep 2016 20:16:55 -0700
Message-ID: <1472786217-52214-3-git-send-email-finley.xiao@rock-chips.com>
References: <1472786217-52214-1-git-send-email-finley.xiao@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472786217-52214-1-git-send-email-finley.xiao@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, maxime.ripard@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, dianders@chromium.org
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, wxt@rock-chips.com, zhengsq@rock-chips.com, jay.xu@rock-chips.com, huangtao@rock-chips.com, tony.xie@rock-chips.com, cl@rock-chips.com, Finley Xiao <finley.xiao@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/boot/dts/rk3066a.dtsi | 2 +-
 arch/arm/boot/dts/rk3188.dtsi  | 2 +-
 arch/arm/boot/dts/rk3288.dtsi  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index c0ba86c..5387cc8 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -162,7 +162,7 @@
 	};
 
 	efuse: efuse@20010000 {
-		compatible = "rockchip,rockchip-efuse";
+		compatible = "rockchip,rk3066a-efuse";
 		reg = <0x20010000 0x4000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index 31f81b2..869e189 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -147,7 +147,7 @@
 	};
 
 	efuse: efuse@20010000 {
-		compatible = "rockchip,rockchip-efuse";
+		compatible = "rockchip,rk3188-efuse";
 		reg = <0x20010000 0x4000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index cd33f01..0eadb96 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1073,7 +1073,7 @@
 	};
 
 	efuse: efuse@ffb40000 {
-		compatible = "rockchip,rockchip-efuse";
+		compatible = "rockchip,rk3288-efuse";
 		reg = <0xffb40000 0x20>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.7.4
