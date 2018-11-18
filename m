From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/7] dt-bindings: net: phy: add bindings for the IC Plus Corp. IP101A/G PHYs
Date: Sun, 18 Nov 2018 22:23:54 +0100
Message-ID: <20181118212359.32414-3-martin.blumenstingl@googlemail.com>
References: <20181118212359.32414-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181118212359.32414-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The IP101A and IP101G series both have various models. Depending on the
board implementation we need a special property for the IP101GR (32-pin
LQFP package) PHY:
pin 21 ("RXER/INTR_32") outputs the "receive error" signal by default
(LOW means "normal operation", HIGH means that there's either a decoding
error of the received signal or that the PHY is receiving LPI). This pin
can also be switched to INTR32 mode, where the interrupt signal is
routed to this pin. The other PHYs don't need this special handling
because they have more pins available so the interrupt function gets a
dedicated pin.

This adds two properties to either select the "receive error" or
"interrupt" function of pin 21. Not specifying any function means that
the default set by the bootloader is used. This is required because the
IP101GR cannot be differentiated between other IP101 PHYs as the PHY
identification registers on all of these is 0x02430c54.

The IP101G (sold as die only, without package) may suffer from the same
issue depending on how it's integrated into a multi chip package by
another manufacturer. If only the RXER/INTR_32 pin is routed then the
users of the die-only variant may also have to explicitly configure the
mode of hte RXER/INTR_32 pin. This is the reason why no "is-ip101gr"
property was added. I have no evidence though which would confirm this
theory - so the binding itself is independent of that.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 .../bindings/net/icplus-ip101ag.txt           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/icplus-ip101ag.txt

diff --git a/Documentation/devicetree/bindings/net/icplus-ip101ag.txt b/Documentation/devicetree/bindings/net/icplus-ip101ag.txt
new file mode 100644
index 000000000000..a784592bbb15
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/icplus-ip101ag.txt
@@ -0,0 +1,19 @@
+IC Plus Corp. IP101A / IP101G Ethernet PHYs
+
+There are different models of the IP101G Ethernet PHY:
+- IP101GR (32-pin QFN package)
+- IP101G (die only, no package)
+- IP101GA (48-pin LQFP package)
+
+There are different models of the IP101A Ethernet PHY (which is the
+predecessor of the IP101G):
+- IP101A (48-pin LQFP package)
+- IP101AH (48-pin LQFP package)
+
+Optional properties for the IP101GR (32-pin QFN package):
+
+- icplus,select-rx-error:
+  pin 21 ("RXER/INTR_32") will output the receive error status.
+  interrupts are not routed outside the PHY in this mode.
+- icplus,select-interrupt:
+  pin 21 ("RXER/INTR_32") will output the interrupt signal.
-- 
2.19.1
