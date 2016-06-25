From: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Subject: [PATCH v2 12/14] ARM: dts: sun8i: Setup CPU operating
 points for Onrage PI PC
Date: Sat, 25 Jun 2016 05:45:09 +0200
Message-ID: <20160625034511.7966-13-megous@megous.com>
References: <20160625034511.7966-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDXLF6FR5INBBVH4W65QKGQELQFHWSQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160625034511.7966-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

Orange PI PC uses SY8106A regulator for fine grained CPUX voltage
regulation. Setup appropriate operating points for the board.
---
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts | 48 ++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
index 79f0b49..1b029e9 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
@@ -90,6 +90,54 @@
 	};
 };
 
+&cpu0 {
+	operating-points = <
+		/* kHz	  uV */
+		1512000	1400000
+		1440000	1400000
+		1368000	1340000
+		1344000	1340000
+		1296000	1340000
+		1248000	1300000
+		1224000	1300000
+		1200000	1300000
+		1104000	1200000
+		1008000	1140000
+		960000	1100000
+		648000	1100000
+		480000	1100000
+		240000	1100000
+		120000	1100000
+		>;
+	#cooling-cells = <2>;
+	cooling-min-level = <0>;
+	cooling-max-level = <14>;
+	cpu0-supply = <&vdd_cpu>;
+};
+
+&cpu_thermal {
+	cooling-maps {
+		map0 {
+			trip = <&cpu_alert0>;
+			cooling-device = <&cpu0 (-1) (-1)>;
+		};
+	};
+
+	trips {
+		cpu_alert0: cpu_alert0 {
+			temperature = <80000>;
+			hysteresis = <2000>;
+			type = "passive";
+		};
+
+		cpu_crit: cpu_crit {
+			temperature = <100000>;
+			hysteresis = <2000>;
+			type = "critical";
+		};
+	};
+};
+
 &r_twi {
 	status = "okay";
 
-- 
2.9.0
