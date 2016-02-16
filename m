From: Sanchayan Maity <maitysanchayan@gmail.com>
Subject: [PATCH v3 3/3] ARM: dts: vfxxx: Add iio_hwmon node for ADC temperature channel
Date: Tue, 16 Feb 2016 10:30:55 +0530
Message-ID: <88b677c3ab62d965b70846618fe566523f95c9bb.1455597464.git.maitysanchayan@gmail.com>
References: <cover.1455597464.git.maitysanchayan@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1455597464.git.maitysanchayan@gmail.com>
In-Reply-To: <cover.1455597464.git.maitysanchayan@gmail.com>
References: <cover.1455597464.git.maitysanchayan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@roeck-us.net, shawnguo@kernel.org
Cc: jdelvare@suse.com, stefan@agner.ch, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org, Sanchayan Maity <maitysanchayan@gmail.com>
List-Id: devicetree@vger.kernel.org

Add iio-hwmon node to expose the temperature channel on Vybrid as
hardware monitor device using the iio_hwmon driver.

Signed-off-by: Sanchayan Maity <maitysanchayan@gmail.com>
---
 arch/arm/boot/dts/vfxxx.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index a5f07e3..24ac5b1 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -673,5 +673,10 @@
 				status = "disabled";
 			};
 		};
+
+		iio-hwmon {
+			compatible = "iio-hwmon";
+			io-channels = <&adc0 16>, <&adc1 16>;
+		};
 	};
 };
-- 
2.7.1
