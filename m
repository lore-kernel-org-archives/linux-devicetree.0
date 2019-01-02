From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH] ARM: dts: rockchip: rk3188: remove qos_cif1
Date: Wed,  2 Jan 2019 20:35:52 +0100
Message-ID: <20190102193552.5853-1-jbx6244@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

While the rk3066 does have 2 camera interfaces, the rk3188 does not, so
there also isn't a QoS block for that non-existing interface, so remove it.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3188.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index 4acb501dd..3ed49898f 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -719,7 +719,6 @@
 			pm_qos = <&qos_lcdc0>,
 				 <&qos_lcdc1>,
 				 <&qos_cif0>,
-				 <&qos_cif1>,
 				 <&qos_ipp>,
 				 <&qos_rga>;
 		};
-- 
2.11.0
