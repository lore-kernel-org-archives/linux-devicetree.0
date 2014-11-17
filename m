From: gyungoh@gmail.com
Subject: [RESUBMIT PATCH v7 4/9] devicetree: backlight: Add new SKY81452 backlight binding
Date: Mon, 17 Nov 2014 17:33:05 +0900
Message-ID: <1416213190-20935-5-git-send-email-jack.yoo@skyworksinc.com>
References: <1416213190-20935-1-git-send-email-jack.yoo@skyworksinc.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416213190-20935-1-git-send-email-jack.yoo@skyworksinc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sameo@linux.intel.com, lee.jones@linaro.org, jg1.han@samsung.com, cooloney@gmail.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: jack.yoo@skyworksinc.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, grant.likely@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, pawel.moll@arm.com, heiko@sntech.de, jason@lakedaemon.net, shawn.guo@freescale.com, treding@nvidia.com, florian.vaussard@epfl.ch, trivial@kernel.org, linux@roeck-us.net, andrew@lunn.ch, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

From: Gyungoh Yoo <jack.yoo@skyworksinc.com>

Signed-off-by: Gyungoh Yoo <jack.yoo@skyworksinc.com>
---
Changes v7:
Nothing

Changes v6:
Nothing

Changes v5:
Nothing

Changes v4:
Nothing

Changes v3:
Nothing

Changes v2:
Added reg attribute for I2C slave address

 .../video/backlight/sky81452-backlight.txt         | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/backlight/sky81452-backlight.txt

diff --git a/Documentation/devicetree/bindings/video/backlight/sky81452-backlight.txt b/Documentation/devicetree/bindings/video/backlight/sky81452-backlight.txt
new file mode 100644
index 0000000..2c2d947
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/backlight/sky81452-backlight.txt
@@ -0,0 +1,24 @@
+SKY81452-backlight bindings
+
+Required properties:
+- compatible		: Must be "skyworks,sky81452-backlight"
+
+Optional properties:
+- name			: Name of backlight device. Default is 'lcd-backlight'.
+- gpio-enable		: GPIO to use to EN pin.
+- enable		: Enable mask for current sink channel 1 to 6.
+- ignore-pwm		: Ignore both PWM input
+- dpwm-mode		: Enable DPWM dimming mode, otherwise Analog dimming mode
+- phase-shift		: Enable phase shift mode
+- ovp-level		: Over-voltage protection level. Should be between 14 or 28V.
+- short-detection-threshold	: It should be one of 4, 5, 6 and 7V.
+- boost-current-limit	: It should be one of 800, 1100 and 1500mA.
+
+Example:
+
+	backlight {
+		compatible = "skyworks,sky81452-backlight";
+		name = "pwm-backlight";
+		enable = <0x3F>;
+		ignore-pwm;
+	};
-- 
1.9.1
