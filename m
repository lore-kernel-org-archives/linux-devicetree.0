From: Alexander Kochetkov <al.kochet@gmail.com>
Subject: [PATCH v4 2/9] ARM: dts: rockchip: update compatible property for rk3228 timer
Date: Tue, 29 Nov 2016 19:14:45 +0300
Message-ID: <1480436092-10728-3-git-send-email-al.kochet@gmail.com>
References: <1480343486-25539-1-git-send-email-al.kochet@gmail.com>
 <1480436092-10728-1-git-send-email-al.kochet@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480436092-10728-1-git-send-email-al.kochet@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Heiko Stuebner <heiko@sntech.de>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Caesar Wang <wxt@rock-chips.com>, Huang Tao <huangtao@rock-chips.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Alexander Kochetkov <al.kochet@gmail.com>
List-Id: devicetree@vger.kernel.org

Property set to '"rockchip,rk3228-timer", "rockchip,rk3288-timer"'
to match devicetree bindings.

Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>
---
 arch/arm/boot/dts/rk3228-evb.dts |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3228-evb.dts b/arch/arm/boot/dts/rk3228-evb.dts
index 904668e..38eab87 100644
--- a/arch/arm/boot/dts/rk3228-evb.dts
+++ b/arch/arm/boot/dts/rk3228-evb.dts
@@ -70,3 +70,7 @@
 &uart2 {
 	status = "okay";
 };
+
+&timer {
+	compatible = "rockchip,rk3228-timer", "rockchip,rk3288-timer";
+};
-- 
1.7.9.5
