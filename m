From: Alexandre GRIVEAUX <agriveaux@deutnet.info>
Subject: [PATCH v2 4/5] MIPS: CI20: DTS: Add Leds
Date: Tue, 1 Oct 2019 21:09:30 +0200
Message-ID: <fa61d681bad1d551876ce879643226dd59611316.1569955865.git.agriveaux@deutnet.info>
References: <cover.1569955865.git.agriveaux@deutnet.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1569955865.git.agriveaux@deutnet.info>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, agriveaux@deutnet.info
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Adding leds and related triggers.

Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index c62c36ae94c2..37b93166bf22 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -25,6 +25,34 @@
 		       0x30000000 0x30000000>;
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led0 {
+			label = "ci20:red:led0";
+			gpios = <&gpc 3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "none";
+		};
+
+		led1 {
+			label = "ci20:red:led1";
+			gpios = <&gpc 2 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "nand-disk";
+		};
+
+		led2 {
+			label = "ci20:red:led2";
+			gpios = <&gpc 1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "cpu1";
+		};
+
+		led3 {
+			label = "ci20:red:led3";
+			gpios = <&gpc 0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "cpu0";
+		};
+	};
+
 	eth0_power: fixedregulator@0 {
 		compatible = "regulator-fixed";
 		regulator-name = "eth0_power";
-- 
2.20.1
