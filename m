From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH 5/5] ARM: dts: enable the uart0 for bluetooth module
Date: Tue, 22 Dec 2015 17:33:53 +0800
Message-ID: <1450776833-27639-6-git-send-email-wxt@rock-chips.com>
References: <1450776833-27639-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450776833-27639-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, keescook@google.com, leozwang@google.com, leecam@google.com, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Caesar Wang <wxt@rock-chips.com>
---

 arch/arm/boot/dts/rk3036-kylin.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3036-kylin.dts b/arch/arm/boot/dts/rk3036-kylin.dts
index ed0466f..700f79a 100644
--- a/arch/arm/boot/dts/rk3036-kylin.dts
+++ b/arch/arm/boot/dts/rk3036-kylin.dts
@@ -338,6 +338,10 @@
 	pinctrl-0 = <&sdio_clk &sdio_cmd &sdio_bus4 &bt_wake_h>;
 };
 
+&uart0 {
+	status = "okay";
+};
+
 &uart2 {
 	status = "okay";
 };
-- 
1.9.1
