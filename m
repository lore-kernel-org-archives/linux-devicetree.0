From: Randy Li <ayaka@soulik.info>
Subject: [PATCH 1/3] ARM: dts: add label leds for rk3288-firefly.dtsi
Date: Thu,  7 Jul 2016 02:22:58 +0800
Message-ID: <1467829380-16242-2-git-send-email-ayaka@soulik.info>
References: <3015470.z4L7UQJKa9@phil>
 <1467829380-16242-1-git-send-email-ayaka@soulik.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467829380-16242-1-git-send-email-ayaka@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org, heiko@sntech.de, Randy Li <ayaka@soulik.info>
List-Id: devicetree@vger.kernel.org

The connected leds are different in firefly release version
and firefly reload.
Adding this label making it is possible to add more leds.

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 arch/arm/boot/dts/rk3288-firefly.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288-firefly.dtsi b/arch/arm/boot/dts/rk3288-firefly.dtsi
index d6cf9ad..1d7f03c 100644
--- a/arch/arm/boot/dts/rk3288-firefly.dtsi
+++ b/arch/arm/boot/dts/rk3288-firefly.dtsi
@@ -99,7 +99,7 @@
 		};
 	};
 
-	leds {
+	leds: leds {
 		compatible = "gpio-leds";
 
 		work {
-- 
2.7.4
