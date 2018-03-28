From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v4 01/13] dt-bindings: connector: add properties for typec
Date: Thu, 29 Mar 2018 00:06:06 +0800
Message-ID: <1522253178-32414-2-git-send-email-jun.li@nxp.com>
References: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, peter.chen@nxp.com, linux-usb@vger.kernel.org, a.hajda@samsung.com, linux-imx@nxp.com, jun.li@nxp.com, shufan_lee@richtek.com
List-Id: devicetree@vger.kernel.org

Add bingdings supported by current typec driver, so user can pass
all those properties via dt.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 .../bindings/connector/usb-connector.txt           | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
index e1463f1..922f22b 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.txt
+++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
@@ -15,6 +15,29 @@ Optional properties:
 - type: size of the connector, should be specified in case of USB-A, USB-B
   non-fullsize connectors: "mini", "micro".
 
+Optional properties for usb-c-connector:
+- power-type: should be one of "source", "sink" or "dual"(DRP) if typec
+  connector has power support.
+- try-power-role: preferred power role if "dual"(DRP) can support Try.SNK
+  or Try.SRC, should be "sink" for Try.SNK or "source" for Try.SRC.
+- data-type: should be one of "host", "device", "dual"(DRD) if typec
+  connector supports USB data.
+
+Required properties for usb-c-connector with power delivery support:
+- source-pdos: An array of u32 with each entry providing supported power
+  source data object(PDO), the detailed bit definitions of PDO can be found
+  in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.2
+  Source_Capabilities Message, the order of each entry(PDO) should follow
+  the PD spec chapter 6.4.1. Required for power source and power dual role.
+- sink-pdos: An array of u32 with each entry providing supported power
+  sink data object(PDO), the detailed bit definitions of PDO can be found
+  in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.3
+  Sink Capabilities Message, the order of each entry(PDO) should follow
+  the PD spec chapter 6.4.1. Required for power sink and power dual role.
+- op-sink-microwatt-hours: Sink required operating power in micro
+  watt-hours, if source offered power is less then it, Capability Mismatch
+  is set, required for power sink and power dual role.
+
 Required nodes:
 - any data bus to the connector should be modeled using the OF graph bindings
   specified in bindings/graph.txt, unless the bus is between parent node and
@@ -73,3 +96,19 @@ ccic: s2mm005@33 {
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
+		power-type = "dual";
+		try-power-role = "sink";
+		source-pdos = <0x380190c8>;
+		sink-pdos = <0x380190c8 0x3802d0c8>;
+		op-sink-microwatt-hours = <9000000>;
+	};
+};
-- 
2.7.4
