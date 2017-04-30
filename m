From: Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH 3/3] ARM: dts: rockchip: List charger as power supply for minnie
Date: Sun, 30 Apr 2017 20:30:54 +0200
Message-ID: <20170430183054.24563-3-contact@paulk.fr>
References: <20170430183054.24563-1-contact@paulk.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170430183054.24563-1-contact@paulk.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Paul Kocialkowski <contact@paulk.fr>
List-Id: devicetree@vger.kernel.org

This lists the GPIO charger node as power supply for the battery, which
in turns allows receiving external power notifications and synchronizing
the charging state as soon as possible.

Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
---
 arch/arm/boot/dts/rk3288-veyron-minnie.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-minnie.dts b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
index 544de6027aaa..3f97f33bd783 100644
--- a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
@@ -151,6 +151,7 @@
 	battery: bq27500@55 {
 		compatible = "ti,bq27500";
 		reg = <0x55>;
+		power-supplies = <&charger>;
 	};
 };
 
-- 
2.12.2
