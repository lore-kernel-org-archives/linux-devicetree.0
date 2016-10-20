From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] ARM: dts: rockchip: add i2c-bus subnode to edp
Date: Thu, 20 Oct 2016 10:07:25 +0200
Message-ID: <1476950845-28242-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Randy Li <randy.li@rock-chips.com>, Jon Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add an empty 'i2c-bus' subnode to the edp node just so that the I2C core
doesn't attemp to parse the 'ports' subnode as containing i2c devices.

This is to avoid spurious failure messages such as:

i2c i2c-6: of_i2c: modalias failure on /dp@ff970000/ports

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Randy Li <randy.li@rock-chips.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm/boot/dts/rk3288.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 2f814ffeb605..94f4b7eecca2 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1075,6 +1075,11 @@
 				};
 			};
 		};
+
+		i2c-bus {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
 	};
 
 	hdmi: hdmi@ff980000 {
-- 
2.7.4
