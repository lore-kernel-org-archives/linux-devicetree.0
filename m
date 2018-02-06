From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 08/10] ARM: sun8i: h3: Add SY8106A regulator
 to Orange Pi PC
Date: Tue,  6 Feb 2018 12:49:03 +0800
Message-ID: <20180206044905.30508-9-icenowy@aosc.io>
References: <20180206044905.30508-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBTPI4TJQKGQEXAVZ7CA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180206044905.30508-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

Add SY8106A regulator to r_i2c bus and enable the r_i2c bus on
Orange Pi PC, then set the power supply of the ARM cores to this
regulator, in order to enable DVFS.

Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
[Icenowy: Enable DVFS in this patch, slight changes and change commit
 message]
Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
Changes in v2:
- Reduce maximum voltage to 1.3V.
- Slightly changed the comment at 1.0V minimum voltage for taking BSP
  DVFS table instead of Armbian one.

 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
index d22546df1b82..ded9d8d6d008 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
@@ -98,6 +98,10 @@
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_sy8106a>;
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -160,6 +164,29 @@
 	};
 };
 
+&r_i2c {
+	status = "okay";
+
+	reg_sy8106a: regulator@65 {
+		compatible = "silergy,sy8106a";
+		reg = <0x65>;
+		regulator-name = "vdd-cpux";
+		/*
+		 * The datasheet uses 1.1V as the minimum value of VDD-CPUX,
+		 * however both the Armbian DVFS table and the official one
+		 * have operating points with voltage under 1.1V, and both
+		 * DVFS table are known to work properly at the lowest
+		 * operating point.
+		 *
+		 * Use 1.0V as the minimum voltage instead.
+		 */
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
 &r_pio {
 	leds_r_opc: led_pins {
 		pins = "PL10";
-- 
2.15.1
