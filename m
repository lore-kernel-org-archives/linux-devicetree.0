From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v2 01/12] ARM: dts: rockchip: set the pinctrl default setting for rk3036 i2s
Date: Thu,  7 Jan 2016 16:25:44 +0800
Message-ID: <1452155155-16232-2-git-send-email-wxt@rock-chips.com>
References: <1452155155-16232-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452155155-16232-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-rockchip@lists.infradead.org, leecam@google.com, leozwang@google.com, keescook@google.com, Caesar Wang <wxt@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Sometime will hang if you set the i2s pinctrl as the none setting.
Let's set the pinctrl as the default setting to enable the gpio up/down.

Signed-off-by: Caesar Wang <wxt@rock-chips.com>

---

Changes in v2:
- modify the commit.

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
