Return-Path: <SRS0=m1Og=FU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-db5eur01on0057.outbound.protection.outlook.com ([104.47.2.57]:65264
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752934AbeBZMF2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 26 Feb 2018 07:05:28 -0500
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v2 10/12] dt-bindings: connector: add properties for typec power delivery
Date: Mon, 26 Feb 2018 19:49:17 +0800
Message-Id: <1519645759-12701-11-git-send-email-jun.li@nxp.com>
In-Reply-To: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, mark.rutland@arm.com, jun.li@nxp.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

In case of usb-c-connector with power delivery support, add bingdings
supported by current typec driver, so user can pass all those properties
via dt.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
Changes for v2:
- Added typec properties are based on general usb connector bindings[1]
  proposed by Andrzej Hajda.
- Use the standard unit suffixes as defined in property-units.txt.

[1] https://patchwork.kernel.org/patch/10231447/

 .../bindings/connector/usb-connector.txt           | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
index e1463f1..242f6df 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.txt
+++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
@@ -15,6 +15,30 @@ Optional properties:
 - type: size of the connector, should be specified in case of USB-A, USB-B
   non-fullsize connectors: "mini", "micro".
 
+Required properties for usb-c-connector with power delivery support:
+- port-type: should be one of "source", "sink" or "dual".
+- default-role: preferred power role if port-type is "dual"(drp), should be
+  "sink" or "source".
+- src-pdos: An array of u32 with each entry providing supported power
+  source data object(PDO), the detailed bit definitions of PDO can be found
+  in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.2
+  Source_Capabilities Message, the order of each entry(PDO) should follow
+  the PD spec chapter 6.4.1. Required for power source and power dual role.
+- snk-pdos: An array of u32 with each entry providing supported power
+  sink data object(PDO), the detailed bit definitions of PDO can be found in
+  "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.3 Sink
+  Capabilities Message, the order of each entry(PDO) should follow the PD
+  spec chapter 6.4.1. Required for power sink and power dual role.
+- max-snk-microvolt: The max voltage the sink can support in micro volts,
+  required for power sink and power dual role.
+- max-snk-microamp: The max current the sink can support in micro amps,
+  required for power sink and power dual role.
+- max-snk-microwatt-hours: The max power the sink can support in micro
+  Watt-hours, required for power sink and power dual role.
+- op-snk-microwatt-hours: Sink required operating power in micro Watt-hours,
+  if source offered power is less then it, Capability Mismatch is set,
+  required for power sink and power dual role.
+
 Required nodes:
 - any data bus to the connector should be modeled using the OF graph bindings
   specified in bindings/graph.txt, unless the bus is between parent node and
@@ -73,3 +97,22 @@ ccic: s2mm005@33 {
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
+		port-type = "dual";
+		default-role = "sink";
+		src-pdos = <0x380190c8>;
+		snk-pdos = <0x380190c8 0x3802d0c8>;
+		max-snk-microvolt = <9000>;
+		max-snk-microamp = <2000>;
+		max-snk-microwatt-hours = <18000>;
+		op-snk-microwatt-hours = <9000>;
+	};
+};
-- 
2.7.4

