From: David Lechner <david@lechnology.com>
Subject: [PATCH 3/3] ARM: da850-lego-ev3: Add device tree node for sound
Date: Tue,  7 Feb 2017 13:22:09 -0600
Message-ID: <1486495329-2789-4-git-send-email-david@lechnology.com>
References: <1486495329-2789-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1486495329-2789-1-git-send-email-david@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

This adds a device tree node for sound on LEGO MINDSTORMS EV3. The EV3
uses one of the SoC PWMs connected to an amplifier to create sound from
a speaker.

The PWM is passed through a low-pass filter, so it is actually possible
to do PCM playback, but there is no existing driver, so just using
pwm-beeper for now, since it is also a compatible mode of operation.

Signed-off-by: David Lechner <david@lechnology.com>
---
 arch/arm/boot/dts/da850-lego-ev3.dts | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/da850-lego-ev3.dts b/arch/arm/boot/dts/da850-lego-ev3.dts
index 0309537..c20580a 100644
--- a/arch/arm/boot/dts/da850-lego-ev3.dts
+++ b/arch/arm/boot/dts/da850-lego-ev3.dts
@@ -123,6 +123,14 @@
 		pinctrl-0 = <&system_power_pin>;
 	};
 
+	sound {
+		compatible = "pwm-beeper";
+		pinctrl-names = "default";
+		pinctrl-0 = <&ehrpwm0b_pins>;
+		pwms = <&ehrpwm0 1 1000000 0>;
+		amp-supply = <&amp>;
+	};
+
 	/*
 	 * This is a 5V current limiting regulator that is shared by USB,
 	 * the sensor (input) ports, the motor (output) ports and the A/DC.
@@ -152,6 +160,18 @@
 		regulator-boot-on;
 		vin-supply = <&vcc5v>;
 	};
+
+	/*
+	 * This is the amplifier for the speaker.
+	 */
+	amp: regulator3 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&amp_pins>;
+		compatible = "regulator-fixed";
+		regulator-name = "amp";
+		gpio = <&gpio 111 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &pmx_core {
@@ -208,6 +228,13 @@
 			0x4c 0x00008000 0x0000f000
 		>;
 	};
+
+	amp_pins: pinmux_amp_pins {
+		pinctrl-single,bits = <
+			/* GP6[15] */
+			0x34 0x00000008 0x0000000f
+		>;
+	};
 };
 
 &pinconf {
@@ -316,6 +343,10 @@
 	};
 };
 
+&ehrpwm0 {
+	status = "okay";
+};
+
 &gpio {
 	status = "okay";
 };
-- 
2.7.4
