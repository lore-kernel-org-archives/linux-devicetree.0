From: Quentin Schulz <quentin.schulz@free-electrons.com>
Subject: [PATCH 6/7] ARM: dtsi: sun8i-a33: add A33 thermal sensor
Date: Tue, 20 Dec 2016 11:27:08 +0100
Message-ID: <20161220102709.9504-7-quentin.schulz@free-electrons.com>
References: <20161220102709.9504-1-quentin.schulz@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161220102709.9504-1-quentin.schulz@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@free-electrons.com, wens@csie.org, lee.jones@linaro.org, linux@armlinux.org.uk, stefan.mavrodiev@gmail.com
Cc: Quentin Schulz <quentin.schulz@free-electrons.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, thomas.petazzoni@free-electrons.com
List-Id: devicetree@vger.kernel.org

This adds the DT node for the thermal sensor present in the Allwinner
A33 GPADC.

Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
---
 arch/arm/boot/dts/sun8i-a33.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
index 2878a77..1fcae81 100644
--- a/arch/arm/boot/dts/sun8i-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a33.dtsi
@@ -151,6 +151,13 @@
 			reset-names = "ahb";
 		};
 
+		rtp: rtp@01c25000 {
+			compatible = "allwinner,sun8i-a33-gpadc-iio";
+			reg = <0x01c25000 0x100>;
+			#thermal-sensor-cells = <0>;
+			#io-channel-cells = <0>;
+		};
+
 		fe0: display-frontend@01e00000 {
 			compatible = "allwinner,sun8i-a33-display-frontend";
 			reg = <0x01e00000 0x20000>;
@@ -261,6 +268,11 @@
 			};
 		};
 	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&rtp>;
+	};
 };
 
 &ccu {
-- 
2.9.3
