From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 07/10] ARM: sun8i: h3: add SY8113B regulator
 used by Orange Pi One board
Date: Tue,  6 Feb 2018 12:49:02 +0800
Message-ID: <20180206044905.30508-8-icenowy@aosc.io>
References: <20180206044905.30508-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBR7I4TJQKGQEDIZHKPI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180206044905.30508-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Orange Pi One board has a SY8113B regulator, which is controlled via
GPIO and capable of outputing 1.1V when the PL6 GPIO is set to output 0
or 1.3V when the PL6 GPIO is set to input or output 1, and the output is
the power supply of the ARM cores in H3 SoC.

Add the device tree node of this regulator and set the cpu's cpu-supply
property to it.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
New patch in v2.

 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
index 82e5d28cd698..d8250aacfda1 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
@@ -88,6 +88,27 @@
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	reg_sy8113b: gpio-regulator {
+		compatible = "regulator-gpio";
+		regulator-name = "vdd-cpux";
+		regulator-type = "voltage";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1300000>;
+		regulator-ramp-delay = <50>; /* 4ms */
+
+		gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
+		enable-active-high;
+		gpios-states = <0x1>;
+		states = <1100000 0x0
+			  1300000 0x1>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_sy8113b>;
 };
 
 &ehci0 {
-- 
2.15.1
