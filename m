From: Ben Whitten <ben.whitten@gmail.com>
Subject: [PATCH lora-next 01/11] dt-bindings: net: lora: sx130x: add power lut binding
Date: Mon, 28 Jan 2019 16:12:55 +0000
Message-ID: <20190128161306.27805-2-ben.whitten@lairdtech.com>
References: <20190128161306.27805-1-ben.whitten@lairdtech.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128161306.27805-1-ben.whitten@lairdtech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de
Cc: linux-lpwan@lists.infradead.org, Ben Whitten <ben.whitten@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Ben Whitten <ben.whitten@gmail.com>

Adding power lookup table for the concentrator specified in DT.

These values are calibrated for the hardware and are unique to hardware
designs and certifications.

First byte is signed power in dBm measured at the rf connector.
Second byte is unsigned value for DIGITAL gain.
Third byte is unsigned value for PA gain, 2 bits only.
Fourth byte is unsigned value for DAC gain, 2 bits only.
Fifth byte is unsigned value for MIXER gain, 4 bits only.

Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
---
 .../bindings/net/lora/semtech,sx130x.yaml           | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
index 24fad1218735..187fa2090a0b 100644
--- a/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
+++ b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
@@ -37,6 +37,15 @@ properties:
     maxItems: 1
     description: A connection of the reset gpio line.
 
+  power-lut:
+    description: Power lookup table for the concentrator.
+      Consisting of maximum 16 entries, each entry having the following format;
+      First byte is signed power in dBm measured at the rf connector.
+      Second byte is unsigned value for DIGITAL gain.
+      Third byte is unsigned value for PA gain, 2 bits only.
+      Fourth byte is unsigned value for DAC gain, 2 bits only.
+      Fifth byte is unsigned value for MIXER gain, 4 bits only.
+
   radio-spi:
     type: object
     description: The concentrator can have two radios connected which are
@@ -83,6 +92,10 @@ examples:
         reset-gpios = <&pioB 27 GPIO_ACTIVE_HIGH>;
         spi-max-frequency = <8000000>;
 
+	power-lut =   [	00 00 00 03 09
+			03 00 00 03 0C
+			04 00 00 03 0D ];
+
         radio-spi {
           #address-cells = <1>;
           #size-cells = <0>;
-- 
2.17.1
