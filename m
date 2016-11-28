From: Alexander Kochetkov <al.kochet@gmail.com>
Subject: [PATCHv2 03/11] ARM: dts: rockchip: update compatible property for rk3229 timer
Date: Mon, 28 Nov 2016 17:31:18 +0300
Message-ID: <1480343486-25539-4-git-send-email-al.kochet@gmail.com>
References: <1480343486-25539-1-git-send-email-al.kochet@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480343486-25539-1-git-send-email-al.kochet@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Heiko Stuebner <heiko@sntech.de>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Caesar Wang <wxt@rock-chips.com>, Huang Tao <huangtao@rock-chips.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Alexander Kochetkov <al.kochet@gmail.com>
List-Id: devicetree@vger.kernel.org

Property set to '"rockchip,rk3229-timer", "rockchip,rk3288-timer"'
to match devicetree bindings.

Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>
---
 arch/arm/boot/dts/rk3229-evb.dts |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3229-evb.dts b/arch/arm/boot/dts/rk3229-evb.dts
index b6a1203..6629769 100644
--- a/arch/arm/boot/dts/rk3229-evb.dts
+++ b/arch/arm/boot/dts/rk3229-evb.dts
@@ -88,3 +88,7 @@
 &uart2 {
 	status = "okay";
 };
+
+&timer {
+	compatible = "rockchip,rk3229-timer", "rockchip,rk3288-timer";
+};
-- 
1.7.9.5
