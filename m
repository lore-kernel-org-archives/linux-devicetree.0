From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 1/7] ARM: dts: rockchip: rk3066: add HCLK_HDMI to pmu node
Date: Sat, 29 Dec 2018 14:33:12 +0100
Message-ID: <20181229133318.18128-2-jbx6244@gmail.com>
References: <20181229133318.18128-1-jbx6244@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181229133318.18128-1-jbx6244@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: hjc@rock-chips.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

A MK808 TV stick with rk3066 processor
boots normal with logo and console,
but after booting the monitor remains black.
This patch fixes a vblank wait time out
by adding HCLK_HDMI to the pmu node.
The HCLK_HDMI clock is now part of the logic
that enables the RK3066_PD_VIO power domain.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3066a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 30dc8af0b..b6b3a77da 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -669,6 +669,7 @@
 				 <&cru SCLK_CIF0>,
 				 <&cru ACLK_CIF0>,
 				 <&cru HCLK_CIF0>,
+				 <&cru HCLK_HDMI>,
 				 <&cru ACLK_IPP>,
 				 <&cru HCLK_IPP>,
 				 <&cru ACLK_RGA>,
-- 
2.11.0
