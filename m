From: Kever Yang <kever.yang@rock-chips.com>
Subject: [RFC PATCH 2/2] arm: dts: rockchip: select npll as parent of DCLK_VOP0
Date: Mon, 17 Nov 2014 22:55:38 +0800
Message-ID: <1416236138-11010-3-git-send-email-kever.yang@rock-chips.com>
References: <1416236138-11010-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416236138-11010-1-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: dianders@chromium.org, sonnyrao@chromium.org, addy.ke@rock-chips.com, cf@rock-chips.com, dkl@rock-chips.com, huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, tomeu.vizoso@collabora.com, sboyd@codeaurora.org, Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The DCLK_VOP0 will change the parent clock's rate, we don't want
to change the PLLs rate other than npll. So we select the npll
as parent directly.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 arch/arm/boot/dts/rk3288.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index c3190f7..6ea6125 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -573,6 +573,8 @@
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_VOP0>, <&cru DCLK_VOP0>, <&cru HCLK_VOP0>;
 		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
+		assigned-clocks = <&cru DCLK_VOP0>;
+		assigned-clock-parents = <3>;
 		resets = <&cru SRST_LCDC0_AXI>, <&cru SRST_LCDC0_AHB>, <&cru SRST_LCDC0_DCLK>;
 		reset-names = "axi", "ahb", "dclk";
 		iommus = <&vopb_mmu>;
-- 
1.9.1
