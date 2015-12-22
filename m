From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH 1/5] ARM: dts: set the pinctrl default setting for i2s
Date: Tue, 22 Dec 2015 17:33:49 +0800
Message-ID: <1450776833-27639-2-git-send-email-wxt@rock-chips.com>
References: <1450776833-27639-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450776833-27639-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, keescook@google.com, leozwang@google.com, leecam@google.com, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Sometime will hang if you set the i2s pinctrl as the none setting.
Let's set the pinctrl as the default setting to enable the gpio up/down.

Signed-off-by: Caesar Wang <wxt@rock-chips.com>
---

 arch/arm/boot/dts/rk3036.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index b9567c1..8f1bb0f 100644
--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -579,12 +579,12 @@
 
 		i2s {
 			i2s_bus: i2s-bus {
-				rockchip,pins = <1 0 RK_FUNC_1 &pcfg_pull_none>,
-						<1 1 RK_FUNC_1 &pcfg_pull_none>,
-						<1 2 RK_FUNC_1 &pcfg_pull_none>,
-						<1 3 RK_FUNC_1 &pcfg_pull_none>,
-						<1 4 RK_FUNC_1 &pcfg_pull_none>,
-						<1 5 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <1 0 RK_FUNC_1 &pcfg_pull_default>,
+						<1 1 RK_FUNC_1 &pcfg_pull_default>,
+						<1 2 RK_FUNC_1 &pcfg_pull_default>,
+						<1 3 RK_FUNC_1 &pcfg_pull_default>,
+						<1 4 RK_FUNC_1 &pcfg_pull_default>,
+						<1 5 RK_FUNC_1 &pcfg_pull_default>;
 			};
 		};
 
-- 
1.9.1
