From: Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 5/5] ARM: bcm283x: Switch V3D over to using the PM driver
 instead of firmware.
Date: Wed, 12 Dec 2018 15:51:50 -0800
Message-ID: <20181212235150.6491-6-eric@anholt.net>
References: <20181212235150.6491-1-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181212235150.6491-1-eric@anholt.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, Lee Jones <lee.jones@linaro.org>, Stefan Wahren <stefan.wahren@i2se.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The GRAFX domain only contains V3D, and this driver should be the only
accessor of V3D (firmware usage gets disabled when V3D is in the DT),
so we can safely make Linux control the GRAFX and GRAFX_V3D power
domains.

Signed-off-by: Eric Anholt <eric@anholt.net>
---

v4: no change

 arch/arm/boot/dts/bcm2835-rpi.dtsi | 4 ----
 arch/arm/boot/dts/bcm283x.dtsi     | 4 +++-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index cb2d6d78a7fb..21a930148709 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -87,10 +87,6 @@
 	power-domains = <&power RPI_POWER_DOMAIN_USB>;
 };
 
-&v3d {
-	power-domains = <&power RPI_POWER_DOMAIN_V3D>;
-};
-
 &hdmi {
 	power-domains = <&power RPI_POWER_DOMAIN_HDMI>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index 20ed8b1da11b..9777644c6c2b 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/clock/bcm2835-aux.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/soc/bcm2835-pm.h>
 
 /* firmware-provided startup stubs live here, where the secondary CPUs are
  * spinning.
@@ -120,7 +121,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		watchdog@7e100000 {
+		pm: watchdog@7e100000 {
 			compatible = "brcm,bcm2835-pm", "brcm,bcm2835-pm-wdt";
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
@@ -638,6 +639,7 @@
 			compatible = "brcm,bcm2835-v3d";
 			reg = <0x7ec00000 0x1000>;
 			interrupts = <1 10>;
+			power-domains = <&pm BCM2835_POWER_DOMAIN_GRAFX_V3D>;
 		};
 
 		vc4: gpu {
-- 
2.20.0.rc1
