From: Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH v2 2/2] ARM: dts: enable init rate for clock
Date: Thu,  9 Oct 2014 21:50:30 -0700
Message-ID: <1412916630-8256-3-git-send-email-kever.yang@rock-chips.com>
References: <1412916630-8256-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412916630-8256-1-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, Mike Turquette <mturquette@linaro.org>
Cc: dianders@chromium.org, sonnyrao@chromium.org, addy.ke@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, hj@rock-chips.com, huangtao@rock-chips.com, dkl@rock-chips.com, Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We need to initialize PLL rate and some of bus clock rate while
kernel init, for there is no other module will do that.

Basically on rk3288 we use GPLL for cpu bus, peripheral bus and
most of peripheral clock, CPLL for devices who require 50M/200M
clock rate, leave NPLL behind for special requirement from
display system.

The common-clock-framework will help us to select best source for
child clocks after we init the PLLs propriety.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Doug Anderson <dianders@chromium.org>
Tested-by: Doug Anderson <dianders@chromium.org>
---

Changes in v2:
- add review and test tag
- add some explanation in commit message

 arch/arm/boot/dts/rk3288.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 874e66d..2f4519b 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -455,6 +455,16 @@
 		rockchip,grf = <&grf>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+		assigned-clocks = <&cru PLL_GPLL>, <&cru PLL_CPLL>,
+				  <&cru PLL_NPLL>, <&cru ACLK_CPU>,
+				  <&cru HCLK_CPU>, <&cru PCLK_CPU>,
+				  <&cru ACLK_PERI>, <&cru HCLK_PERI>,
+				  <&cru PCLK_PERI>;
+		assigned-clock-rates = <594000000>, <400000000>,
+				       <500000000>, <300000000>,
+				       <150000000>, <75000000>,
+				       <300000000>, <150000000>,
+				       <75000000>;
 	};
 
 	grf: syscon@ff770000 {
-- 
1.9.1
