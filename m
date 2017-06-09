From: Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: [PATCH] ARM: dts: rk322x: fix i2s1 pinctrl error
Date: Fri,  9 Jun 2017 17:02:47 +0800
Message-ID: <1496998967-31520-1-git-send-email-sugar.zhang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, broonie@kernel.org
Cc: linux-rockchip@lists.infradead.org, Sugar Zhang <sugar.zhang@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

 arch/arm/boot/dts/rk322x.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index 48a0c1c..cc6a27d 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -621,9 +621,9 @@
 						<0 12 RK_FUNC_1 &pcfg_pull_none>,
 						<0 13 RK_FUNC_1 &pcfg_pull_none>,
 						<0 14 RK_FUNC_1 &pcfg_pull_none>,
-						<1 2 RK_FUNC_1 &pcfg_pull_none>,
-						<1 4 RK_FUNC_1 &pcfg_pull_none>,
-						<1 5 RK_FUNC_1 &pcfg_pull_none>;
+						<1 2 RK_FUNC_2 &pcfg_pull_none>,
+						<1 4 RK_FUNC_2 &pcfg_pull_none>,
+						<1 5 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
-- 
1.9.1
