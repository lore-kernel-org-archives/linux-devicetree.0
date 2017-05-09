From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH v5 2/7] dt-bindings: media: Add MAX2175 binding description
Date: Tue,  9 May 2017 14:37:33 +0100
Message-ID: <20170509133738.16414-3-ramesh.shanmugasundaram@bp.renesas.com>
References: <20170509133738.16414-1-ramesh.shanmugasundaram@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170509133738.16414-1-ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, crope-X3B1VOXEql0@public.gmane.org
Cc: chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree binding documentation for MAX2175 RF to bits tuner
device.

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v5:
 - pF in property-units.txt is renamed to pico-farads (Geert)
 - "maxim,refout-load-pF" is renamed to "maxim,refout-load".
---
 .../devicetree/bindings/media/i2c/max2175.txt      | 61 ++++++++++++++++++++++
 .../devicetree/bindings/property-units.txt         |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/max2175.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/max2175.txt b/Documentation/devicetree/bindings/media/i2c/max2175.txt
new file mode 100644
index 000000000000..dce421857efe
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/max2175.txt
@@ -0,0 +1,61 @@
+Maxim Integrated MAX2175 RF to Bits tuner
+-----------------------------------------
+
+The MAX2175 IC is an advanced analog/digital hybrid-radio receiver with
+RF to Bits® front-end designed for software-defined radio solutions.
+
+Required properties:
+--------------------
+- compatible: "maxim,max2175" for MAX2175 RF-to-bits tuner.
+- clocks: phandle to the fixed xtal clock.
+- clock-names: name of the fixed xtal clock, shall be "xtal".
+- port: child port node corresponding to the I2S output, in accordance with
+	the video interface bindings defined in
+	Documentation/devicetree/bindings/media/video-interfaces.txt. The port
+	node must contain at least one endpoint.
+
+Optional properties:
+--------------------
+- maxim,master	      : phandle to the master tuner if it is a slave. This
+			is used to define two tuners in diversity mode
+			(1 master, 1 slave). By default each tuner is an
+			individual master.
+- maxim,refout-load   : load capacitance value (in pico-farads) on reference
+			output drive level. The possible load values are:
+			 0 (default - refout disabled)
+			10
+			20
+			30
+			40
+			60
+			70
+- maxim,am-hiz-filter : empty property indicates the AM Hi-Z filter is used
+			in this hardware for AM antenna input.
+
+Example:
+--------
+
+Board specific DTS file
+
+/* Fixed XTAL clock node */
+maxim_xtal: clock {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <36864000>;
+};
+
+/* A tuner device instance under i2c bus */
+max2175_0: tuner@60 {
+	compatible = "maxim,max2175";
+	reg = <0x60>;
+	clocks = <&maxim_xtal>;
+	clock-names = "xtal";
+	maxim,refout-load = <10>;
+
+	port {
+		max2175_0_ep: endpoint {
+			remote-endpoint = <&slave_rx_device>;
+		};
+	};
+
+};
diff --git a/Documentation/devicetree/bindings/property-units.txt b/Documentation/devicetree/bindings/property-units.txt
index 0849618a9df0..2d1d28843c96 100644
--- a/Documentation/devicetree/bindings/property-units.txt
+++ b/Documentation/devicetree/bindings/property-units.txt
@@ -30,6 +30,7 @@ Electricity
 -micro-ohms	: micro Ohms
 -microwatt-hours: micro Watt-hours
 -microvolt	: micro volts
+-pico-farads	: picofarads
 
 Temperature
 ----------------------------------------
-- 
2.12.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
