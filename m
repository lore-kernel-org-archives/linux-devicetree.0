From: David Lechner <david@lechnology.com>
Subject: [PATCH 1/3] ARM: da850-lego-ev3: Add device tree node for A/DC
Date: Tue,  7 Feb 2017 13:22:07 -0600
Message-ID: <1486495329-2789-2-git-send-email-david@lechnology.com>
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

This adds a node for the TI ADS7957 analog/digital converter on LEGO
MINDSTORMS EV3 as well as a regulator node that is used by the A/DC node.

Signed-off-by: David Lechner <david@lechnology.com>
---
 arch/arm/boot/dts/da850-lego-ev3.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/da850-lego-ev3.dts b/arch/arm/boot/dts/da850-lego-ev3.dts
index 112ec92..0309537 100644
--- a/arch/arm/boot/dts/da850-lego-ev3.dts
+++ b/arch/arm/boot/dts/da850-lego-ev3.dts
@@ -139,6 +139,19 @@
 		enable-active-high;
 		regulator-boot-on;
 	};
+
+	/*
+	 * This is a simple voltage divider on VCC5V to provide a 2.5V
+	 * reference signal to the ADC.
+	 */
+	adc_ref: regulator2 {
+		compatible = "regulator-fixed";
+		regulator-name = "adc ref";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+		regulator-boot-on;
+		vin-supply = <&vcc5v>;
+	};
 };
 
 &pmx_core {
@@ -293,6 +306,14 @@
 			};
 		};
 	};
+
+	adc: adc@3 {
+		compatible = "ti,ads7957";
+		reg = <3>;
+		#io-channel-cells = <1>;
+		spi-max-frequency = <10000000>;
+		vref-supply = <&adc_ref>;
+	};
 };
 
 &gpio {
-- 
2.7.4
