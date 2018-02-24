From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: bcm283x: Move arm-pmu out of soc node
Date: Sat, 24 Feb 2018 15:15:22 +0100
Message-ID: <1519481722-22738-3-git-send-email-stefan.wahren@i2se.com>
References: <1519481722-22738-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1519481722-22738-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The ARM PMU doesn't have a reg address, so fix the following DTC warning
(requires W=1):
Node /soc/arm-pmu missing or empty reg/ranges property

Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
---
 arch/arm/boot/dts/bcm2835.dtsi |  6 +++---
 arch/arm/boot/dts/bcm2836.dtsi | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
index 0e3d2a5..a5c3824 100644
--- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -18,10 +18,10 @@
 	soc {
 		ranges = <0x7e000000 0x20000000 0x02000000>;
 		dma-ranges = <0x40000000 0x00000000 0x20000000>;
+	};
 
-		arm-pmu {
-			compatible = "arm,arm1176-pmu";
-		};
+	arm-pmu {
+		compatible = "arm,arm1176-pmu";
 	};
 };
 
diff --git a/arch/arm/boot/dts/bcm2836.dtsi b/arch/arm/boot/dts/bcm2836.dtsi
index e47f2e9..c933e84 100644
--- a/arch/arm/boot/dts/bcm2836.dtsi
+++ b/arch/arm/boot/dts/bcm2836.dtsi
@@ -16,12 +16,12 @@
 			#interrupt-cells = <2>;
 			interrupt-parent = <&local_intc>;
 		};
+	};
 
-		arm-pmu {
-			compatible = "arm,cortex-a7-pmu";
-			interrupt-parent = <&local_intc>;
-			interrupts = <9 IRQ_TYPE_LEVEL_HIGH>;
-		};
+	arm-pmu {
+		compatible = "arm,cortex-a7-pmu";
+		interrupt-parent = <&local_intc>;
+		interrupts = <9 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	timer {
-- 
2.7.4
