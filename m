From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 1/5] ARM: dts: rockchip: rk3288-veyron: rename pinctrl node reboot to reset
Date: Wed, 18 Nov 2015 17:50:46 +0800
Message-ID: <1447840246-19744-1-git-send-email-andy.yan@rock-chips.com>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, galak@codeaurora.org, linux@arm.linux.org.uk, linux-rockchip@lists.infradead.org, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, khilman@linaro.org, treding@nvidia.com, wxt@rock-chips.com, sjg@chromium.org, benchan@google.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

rename pinctrl node reboot to reset to match it's lable name

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v3:
 - rename a pinctrl node in rk3288-veyron, the original name will be
   used in the incoming reboot notifier driver

Changes in v2: None

 arch/arm/boot/dts/rk3288-veyron.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 2fa7a0d..292aaaf 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -495,7 +495,7 @@
 		};
 	};
 
-	reboot {
+	reset {
 		ap_warm_reset_h: ap-warm-reset-h {
 			rockchip,pins = <RK_GPIO0 13 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
-- 
1.9.1
