From: Baruch Siach <baruch@tkos.co.il>
Subject: [RFC PATCH] dt-binding: net: sfp binding documentation
Date: Sun, 20 Aug 2017 13:28:06 +0300
Message-ID: <d73b635069a2054d110632f1f4196cd4bc281e7f.1503224886.git.baruch@tkos.co.il>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Russell King <rmk+kernel@arm.linux.org.uk>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>
List-Id: devicetree@vger.kernel.org

Add device-tree binding documentation SFP transceivers. Support for SFP
transceivers has been recently introduced (drivers/net/phy/sfp.c).

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---

The SFP driver is on net-next.

Not sure about the rate-select-gpio property name. The SFP+ standard
(not supported yet) uses two signals, RS0 and RS1. RS0 is compatible
with the SFP rate select signal, while RS1 controls the Tx rate.
---
 Documentation/devicetree/bindings/net/sff-sfp.txt | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sff-sfp.txt

diff --git a/Documentation/devicetree/bindings/net/sff-sfp.txt b/Documentation/devicetree/bindings/net/sff-sfp.txt
new file mode 100644
index 000000000000..f0c27bc3925e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/sff-sfp.txt
@@ -0,0 +1,24 @@
+Small Form Factor (SFF) Committee Small Form-factor Pluggable (SFP)
+Transceiver
+
+Required properties:
+
+- compatible : must be "sff,sfp"
+
+Optional Properties:
+
+- i2c-bus : phandle of an I2C bus controller for the SFP two wire serial
+  interface
+
+- moddef0-gpio : phandle of the MOD-DEF0 (AKA Mod_ABS) module presence input
+  gpio signal
+
+- los-gpio : phandle of the Receiver Loss of Signal Indication input gpio
+  signal
+
+- tx-fault-gpio : phandle of the Module Transmitter Fault input gpio signal
+
+- tx-disable-gpio : phandle of the Transmitter Disable output gpio signal
+
+- rate-select-gpio : phandle of the Rx Signaling Rate Select (AKA RS0) output
+  gpio
-- 
2.14.1
