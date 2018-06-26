Return-Path: <SRS0=bntt=JN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00081.outbound.protection.outlook.com ([40.107.0.81]:10426
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753093AbeF0ACb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Jun 2018 20:02:31 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v8 01/14] dt-bindings: connector: add properties for typec
Date: Wed, 27 Jun 2018 07:45:19 +0800
Message-Id: <1530056732-9640-2-git-send-email-jun.li@nxp.com>
In-Reply-To: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, jun.li@nxp.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Add bindings supported by current typec driver, so user can pass
all those properties via dt.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 .../bindings/connector/usb-connector.txt           | 44 +++++++++++++++
 include/dt-bindings/usb/pd.h                       | 62 ++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
index e1463f1..8855bfc 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.txt
+++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
@@ -15,6 +15,33 @@ Optional properties:
 - type: size of the connector, should be specified in case of USB-A, USB-B
   non-fullsize connectors: "mini", "micro".
 
+Optional properties for usb-c-connector:
+- power-role: should be one of "source", "sink" or "dual"(DRP) if typec
+  connector has power support.
+- try-power-role: preferred power role if "dual"(DRP) can support Try.SNK
+  or Try.SRC, should be "sink" for Try.SNK or "source" for Try.SRC.
+- data-role: should be one of "host", "device", "dual"(DRD) if typec
+  connector supports USB data.
+
+Required properties for usb-c-connector with power delivery support:
+- source-pdos: An array of u32 with each entry providing supported power
+  source data object(PDO), the detailed bit definitions of PDO can be found
+  in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.2
+  Source_Capabilities Message, the order of each entry(PDO) should follow
+  the PD spec chapter 6.4.1. Required for power source and power dual role.
+  User can specify the source PDO array via PDO_FIXED/BATT/VAR() defined in
+  dt-bindings/usb/pd.h.
+- sink-pdos: An array of u32 with each entry providing supported power
+  sink data object(PDO), the detailed bit definitions of PDO can be found
+  in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.3
+  Sink Capabilities Message, the order of each entry(PDO) should follow
+  the PD spec chapter 6.4.1. Required for power sink and power dual role.
+  User can specify the sink PDO array via PDO_FIXED/BATT/VAR() defined in
+  dt-bindings/usb/pd.h.
+- op-sink-microwatt: Sink required operating power in microwatt, if source
+  can't offer the power, Capability Mismatch is set. Required for power
+  sink and power dual role.
+
 Required nodes:
 - any data bus to the connector should be modeled using the OF graph bindings
   specified in bindings/graph.txt, unless the bus is between parent node and
@@ -73,3 +100,20 @@ ccic: s2mm005@33 {
 		};
 	};
 };
+
+3. USB-C connector attached to a typec port controller(ptn5110), which has
+power delivery support and enables drp.
+
+typec: ptn5110@50 {
+	...
+	usb_con: connector {
+		compatible = "usb-c-connector";
+		label = "USB-C";
+		power-role = "dual";
+		try-power-role = "sink";
+		source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
+		sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)
+			     PDO_VAR(5000, 12000, 2000)>;
+		op-sink-microwatt = <10000000>;
+	};
+};
diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb/pd.h
new file mode 100644
index 0000000..7b7a92f
--- /dev/null
+++ b/include/dt-bindings/usb/pd.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_POWER_DELIVERY_H
+#define __DT_POWER_DELIVERY_H
+
+/* Power delivery Power Data Object definitions */
+#define PDO_TYPE_FIXED		0
+#define PDO_TYPE_BATT		1
+#define PDO_TYPE_VAR		2
+#define PDO_TYPE_APDO		3
+
+#define PDO_TYPE_SHIFT		30
+#define PDO_TYPE_MASK		0x3
+
+#define PDO_TYPE(t)	((t) << PDO_TYPE_SHIFT)
+
+#define PDO_VOLT_MASK		0x3ff
+#define PDO_CURR_MASK		0x3ff
+#define PDO_PWR_MASK		0x3ff
+
+#define PDO_FIXED_DUAL_ROLE	(1 << 29) /* Power role swap supported */
+#define PDO_FIXED_SUSPEND	(1 << 28) /* USB Suspend supported (Source) */
+#define PDO_FIXED_HIGHER_CAP	(1 << 28) /* Requires more than vSafe5V (Sink) */
+#define PDO_FIXED_EXTPOWER	(1 << 27) /* Externally powered */
+#define PDO_FIXED_USB_COMM	(1 << 26) /* USB communications capable */
+#define PDO_FIXED_DATA_SWAP	(1 << 25) /* Data role swap supported */
+#define PDO_FIXED_VOLT_SHIFT	10	/* 50mV units */
+#define PDO_FIXED_CURR_SHIFT	0	/* 10mA units */
+
+#define PDO_FIXED_VOLT(mv)	((((mv) / 50) & PDO_VOLT_MASK) << PDO_FIXED_VOLT_SHIFT)
+#define PDO_FIXED_CURR(ma)	((((ma) / 10) & PDO_CURR_MASK) << PDO_FIXED_CURR_SHIFT)
+
+#define PDO_FIXED(mv, ma, flags)			\
+	(PDO_TYPE(PDO_TYPE_FIXED) | (flags) |		\
+	 PDO_FIXED_VOLT(mv) | PDO_FIXED_CURR(ma))
+
+#define VSAFE5V 5000 /* mv units */
+
+#define PDO_BATT_MAX_VOLT_SHIFT	20	/* 50mV units */
+#define PDO_BATT_MIN_VOLT_SHIFT	10	/* 50mV units */
+#define PDO_BATT_MAX_PWR_SHIFT	0	/* 250mW units */
+
+#define PDO_BATT_MIN_VOLT(mv) ((((mv) / 50) & PDO_VOLT_MASK) << PDO_BATT_MIN_VOLT_SHIFT)
+#define PDO_BATT_MAX_VOLT(mv) ((((mv) / 50) & PDO_VOLT_MASK) << PDO_BATT_MAX_VOLT_SHIFT)
+#define PDO_BATT_MAX_POWER(mw) ((((mw) / 250) & PDO_PWR_MASK) << PDO_BATT_MAX_PWR_SHIFT)
+
+#define PDO_BATT(min_mv, max_mv, max_mw)			\
+	(PDO_TYPE(PDO_TYPE_BATT) | PDO_BATT_MIN_VOLT(min_mv) |	\
+	 PDO_BATT_MAX_VOLT(max_mv) | PDO_BATT_MAX_POWER(max_mw))
+
+#define PDO_VAR_MAX_VOLT_SHIFT	20	/* 50mV units */
+#define PDO_VAR_MIN_VOLT_SHIFT	10	/* 50mV units */
+#define PDO_VAR_MAX_CURR_SHIFT	0	/* 10mA units */
+
+#define PDO_VAR_MIN_VOLT(mv) ((((mv) / 50) & PDO_VOLT_MASK) << PDO_VAR_MIN_VOLT_SHIFT)
+#define PDO_VAR_MAX_VOLT(mv) ((((mv) / 50) & PDO_VOLT_MASK) << PDO_VAR_MAX_VOLT_SHIFT)
+#define PDO_VAR_MAX_CURR(ma) ((((ma) / 10) & PDO_CURR_MASK) << PDO_VAR_MAX_CURR_SHIFT)
+
+#define PDO_VAR(min_mv, max_mv, max_ma)				\
+	(PDO_TYPE(PDO_TYPE_VAR) | PDO_VAR_MIN_VOLT(min_mv) |	\
+	 PDO_VAR_MAX_VOLT(max_mv) | PDO_VAR_MAX_CURR(max_ma))
+
+ #endif /* __DT_POWER_DELIVERY_H */
-- 
2.7.4

