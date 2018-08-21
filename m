From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: [PATCH 1/3] dt-bindings: connector: Add support for USB-PD PPS APDOs
 to bindings
Date: Tue, 21 Aug 2018 13:28:21 +0100
Message-ID: <0d3a589560b519ab07ed6aaaf012959098c5a2ea.1534853047.git.Adam.Thomson.Opensource@diasemi.com>
References: <cover.1534853047.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1534853047.git.Adam.Thomson.Opensource@diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hans de Goede <hdegoede@redhat.com>, Li Jun <jun.li@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, support.opensource@diasemi.com
List-Id: devicetree@vger.kernel.org

Add support for PPS APDOs to connector bindings so a port controller
can specify support for PPS, as per existing FIXED/BATT/VAR PDOs.

Signed-off-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
---
 .../bindings/connector/usb-connector.txt           |  8 +++----
 include/dt-bindings/usb/pd.h                       | 26 ++++++++++++++++++++++
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
index 8855bfc..d90e17e 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.txt
+++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
@@ -29,15 +29,15 @@ Required properties for usb-c-connector with power delivery support:
   in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.2
   Source_Capabilities Message, the order of each entry(PDO) should follow
   the PD spec chapter 6.4.1. Required for power source and power dual role.
-  User can specify the source PDO array via PDO_FIXED/BATT/VAR() defined in
-  dt-bindings/usb/pd.h.
+  User can specify the source PDO array via PDO_FIXED/BATT/VAR/PPS_APDO()
+  defined in dt-bindings/usb/pd.h.
 - sink-pdos: An array of u32 with each entry providing supported power
   sink data object(PDO), the detailed bit definitions of PDO can be found
   in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.3
   Sink Capabilities Message, the order of each entry(PDO) should follow
   the PD spec chapter 6.4.1. Required for power sink and power dual role.
-  User can specify the sink PDO array via PDO_FIXED/BATT/VAR() defined in
-  dt-bindings/usb/pd.h.
+  User can specify the sink PDO array via PDO_FIXED/BATT/VAR/PPS_APDO() defined
+  in dt-bindings/usb/pd.h.
 - op-sink-microwatt: Sink required operating power in microwatt, if source
   can't offer the power, Capability Mismatch is set. Required for power
   sink and power dual role.
diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb/pd.h
index 7b7a92f..985f2bb 100644
--- a/include/dt-bindings/usb/pd.h
+++ b/include/dt-bindings/usb/pd.h
@@ -59,4 +59,30 @@
 	(PDO_TYPE(PDO_TYPE_VAR) | PDO_VAR_MIN_VOLT(min_mv) |	\
 	 PDO_VAR_MAX_VOLT(max_mv) | PDO_VAR_MAX_CURR(max_ma))
 
+#define APDO_TYPE_PPS		0
+
+#define PDO_APDO_TYPE_SHIFT	28	/* Only valid value currently is 0x0 - PPS */
+#define PDO_APDO_TYPE_MASK	0x3
+
+#define PDO_APDO_TYPE(t)	((t) << PDO_APDO_TYPE_SHIFT)
+
+#define PDO_PPS_APDO_MAX_VOLT_SHIFT	17	/* 100mV units */
+#define PDO_PPS_APDO_MIN_VOLT_SHIFT	8	/* 100mV units */
+#define PDO_PPS_APDO_MAX_CURR_SHIFT	0	/* 50mA units */
+
+#define PDO_PPS_APDO_VOLT_MASK	0xff
+#define PDO_PPS_APDO_CURR_MASK	0x7f
+
+#define PDO_PPS_APDO_MIN_VOLT(mv)	\
+	((((mv) / 100) & PDO_PPS_APDO_VOLT_MASK) << PDO_PPS_APDO_MIN_VOLT_SHIFT)
+#define PDO_PPS_APDO_MAX_VOLT(mv)	\
+	((((mv) / 100) & PDO_PPS_APDO_VOLT_MASK) << PDO_PPS_APDO_MAX_VOLT_SHIFT)
+#define PDO_PPS_APDO_MAX_CURR(ma)	\
+	((((ma) / 50) & PDO_PPS_APDO_CURR_MASK) << PDO_PPS_APDO_MAX_CURR_SHIFT)
+
+#define PDO_PPS_APDO(min_mv, max_mv, max_ma)					\
+	(PDO_TYPE(PDO_TYPE_APDO) | PDO_APDO_TYPE(APDO_TYPE_PPS) |		\
+	 PDO_PPS_APDO_MIN_VOLT(min_mv) | PDO_PPS_APDO_MAX_VOLT(max_mv) |	\
+	 PDO_PPS_APDO_MAX_CURR(max_ma))
+
  #endif /* __DT_POWER_DELIVERY_H */
-- 
1.9.1
