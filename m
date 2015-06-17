From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH-v2 3/3] mfd: devicetree: bindings: Add new 88pm800 mfd binding
Date: Thu, 18 Jun 2015 00:28:08 +0530
Message-ID: <1434567488-6477-5-git-send-email-vaibhav.hiremath@linaro.org>
References: <vaibhav.hiremath@linaro.org>
 <1434567488-6477-1-git-send-email-vaibhav.hiremath@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434567488-6477-1-git-send-email-vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

With addition of DT support to 88pm800 mfd driver, this patch
adds new DT binding documentation along with respective properties.

Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/88pm800.txt | 60 +++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/88pm800.txt

diff --git a/Documentation/devicetree/bindings/mfd/88pm800.txt b/Documentation/devicetree/bindings/mfd/88pm800.txt
new file mode 100644
index 0000000..b8e72df
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/88pm800.txt
@@ -0,0 +1,60 @@
+* Marvell 88PM8xx Power Management IC
+
+Required parent device properties:
+- compatible : "marvell,88pm800", "marvell,88pm805", "marvell,88pm860"
+- reg : the I2C slave address for the 88pm8xx chip
+- interrupts : IRQ line for the 88pm8xx chip
+- interrupt-controller: describes the 88pm8xx as an interrupt controller
+- #interrupt-cells : should be 1.
+		- The cell is the 88pm8xx local IRQ number
+
+Optional parent device properties:
+- marvell,irq-clr-on-write: indicates whether interrupt status is cleared
+  by write or read.
+  If enabled, interrupt is cleared by write else just read would do.
+
+88pm8xx family of devices consists of varied group of sub-devices:
+
+Device		 	Supply Names	 Description
+------		 	------------	 -----------
+88pm80x-onkey		:		: On key
+88pm80x-rtc		:		: RTC
+88pm80x-regulator	:		: Regulators
+
+Note: More device list will follow
+
+Example:
+
+	pmic: 88pm800@30 {
+		compatible = "marvell,88pm800";
+		reg = <0x30>;
+		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		marvell,irq-clr-on-write;
+
+		regulators {
+			compatible = "marvell,88pm80x-regulator";
+
+			buck1a: BUCK1A {
+				regulator-compatible = "88PM800-BUCK1A";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			ldo1: LDO1 {
+				regulator-compatible = "88PM800-LDO1";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+
+		rtc {
+			compatible = "marvell,88pm80x-rtc";
+		};
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
