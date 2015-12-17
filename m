From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v1 6/6] ARM: dts: add the sdio node for kylin board
Date: Thu, 17 Dec 2015 22:21:52 +0800
Message-ID: <1450362112-8075-7-git-send-email-wxt@rock-chips.com>
References: <1450362112-8075-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450362112-8075-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, leozwang@google.com, keescook@google.com, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Let's enable the sdio for wifi module on kylin board.

Signed-off-by: Caesar Wang <wxt@rock-chips.com>

---

 arch/arm/boot/dts/rk3036-kylin.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/rk3036-kylin.dts b/arch/arm/boot/dts/rk3036-kylin.dts
index 296139b..581e954 100644
--- a/arch/arm/boot/dts/rk3036-kylin.dts
+++ b/arch/arm/boot/dts/rk3036-kylin.dts
@@ -304,6 +304,20 @@
 	status = "okay";
 };
 
+&sdio {
+	status = "okay";
+
+	broken-cd;
+	bus-width = <4>;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	non-removable;
+	num-slots = <1>;
+	default-sample-phase = <90>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdio_clk &sdio_cmd &sdio_bus4>;
+};
+
 &uart2 {
 	status = "okay";
 };
-- 
1.9.1
