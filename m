From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: [PATCH 2/3] dt-bindings: usb: fusb302: Use usb-connector bindings for
 configuration
Date: Mon, 10 Sep 2018 13:19:24 +0100
Message-ID: <552e94b9a1cf89069be7d36d6476d5df26970406.1536580772.git.Adam.Thomson.Opensource@diasemi.com>
References: <cover.1536580772.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1536580772.git.Adam.Thomson.Opensource@diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hans de Goede <hdegoede@redhat.com>, Li Jun <jun.li@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, support.opensource@diasemi.com
List-Id: devicetree@vger.kernel.org

There are now generic usb-connector bindings which can be used
to define a port controllers configuration for USB-PD, so device
specific bindings are no longer necessary.

This update deprecates 'fcs,operating-sink-microwatt', and references
the 'usb-connector' bindings instead to achieve the required port
config.

Signed-off-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/usb/fcs,fusb302.txt        | 32 +++++++++++++++++-----
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt b/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
index 6087dc7..a5d011d 100644
--- a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
+++ b/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
@@ -5,10 +5,19 @@ Required properties :
 - reg                    : I2C slave address
 - interrupts             : Interrupt specifier
 
-Optional properties :
-- fcs,operating-sink-microwatt :
-			   Minimum amount of power accepted from a sink
-			   when negotiating
+Required sub-node:
+- connector : The "usb-c-connector" attached to the FUSB302 IC. The bindings
+  of the connector node are specified in:
+
+	Documentation/devicetree/bindings/connector/usb-connector.txt
+
+Deprecated properties :
+- fcs,max-sink-microvolt : Maximum sink voltage accepted by port controller
+- fcs,max-sink-microamp : Maximum sink current accepted by port controller
+- fcs,max-sink-microwatt : Maximum sink power accepted by port controller
+- fcs,operating-sink-microwatt : Minimum amount of power accepted from a sink
+  when negotiating
+
 
 Example:
 
@@ -17,7 +26,16 @@ fusb302: typec-portc@54 {
 	reg = <0x54>;
 	interrupt-parent = <&nmi_intc>;
 	interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-	fcs,max-sink-microvolt = <12000000>;
-	fcs,max-sink-microamp = <3000000>;
-	fcs,max-sink-microwatt = <36000000>;
+
+	usb_con: connector {
+		compatible = "usb-c-connector";
+		label = "USB-C";
+		power-role = "dual";
+		try-power-role = "sink";
+		source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+		sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+			     PDO_VAR(3000, 12000, 3000)
+			     PDO_PPS_APDO(3000, 11000, 3000)>;
+		op-sink-microwatt = <10000000>;
+	};
 };
-- 
1.9.1
