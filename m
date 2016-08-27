From: Ziyuan Xu <xzy.xu@rock-chips.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: add eMMC's power domain support for rk3399
Date: Sat, 27 Aug 2016 21:41:03 +0800
Message-ID: <20160827134103.28160-3-xzy.xu@rock-chips.com>
References: <20160827134103.28160-1-xzy.xu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160827134103.28160-1-xzy.xu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ulf.hansson@linaro.org, robh+dt@kernel.org, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, Ziyuan Xu <xzy.xu@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, devicetree@vger.kernel.org, David Wu <david.wu@rock-chips.com>, Caesar Wang <wxt@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, Shunqian Zheng <zhengsq@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will.deacon@arm.com>, Jianqun Xu <jay.xu@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, Xing Zheng <zhengxing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Control power domain for eMMC via genpd to reduce power consumption.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Ziyuan Xu <xzy.xu@rock-chips.com>

---

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 32aebc8..71733d4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -239,6 +239,7 @@
 		#clock-cells = <0>;
 		phys = <&emmc_phy>;
 		phy-names = "phy_arasan";
+		power-domains = <&power RK3399_PD_EMMC>;
 		status = "disabled";
 	};
 
@@ -611,6 +612,11 @@
 		status = "disabled";
 	};
 
+	qos_emmc: qos@ffa58000 {
+		compatible = "syscon";
+		reg = <0x0 0xffa58000 0x0 0x20>;
+	};
+
 	qos_hdcp: qos@ffa90000 {
 		compatible = "syscon";
 		reg = <0x0 0xffa90000 0x0 0x20>;
@@ -739,6 +745,11 @@
 			};
 
 			/* These power domains are grouped by VD_LOGIC */
+			pd_emmc@RK3399_PD_EMMC {
+				reg = <RK3399_PD_EMMC>;
+				clocks = <&cru ACLK_EMMC>;
+				pm_qos = <&qos_emmc>;
+			};
 			pd_vio@RK3399_PD_VIO {
 				reg = <RK3399_PD_VIO>;
 				#address-cells = <1>;
-- 
2.9.2
