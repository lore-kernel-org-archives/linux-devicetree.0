From: David Bauer <mail@david-bauer.net>
Subject: [PATCH v3 1/3] dt-bindings: net: add PHY reset controller binding
Date: Wed, 17 Apr 2019 23:59:20 +0200
Message-ID: <20190417215922.30472-2-mail@david-bauer.net>
References: <20190417215922.30472-1-mail@david-bauer.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190417215922.30472-1-mail@david-bauer.net>
Sender: netdev-owner@vger.kernel.org
To: devicetree@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the documentation for PHY reset lines controlled by a reset controller.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 Documentation/devicetree/bindings/net/phy.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/phy.txt b/Documentation/devicetree/bindings/net/phy.txt
index 17c1d2bd00f6..9b9e5b1765dd 100644
--- a/Documentation/devicetree/bindings/net/phy.txt
+++ b/Documentation/devicetree/bindings/net/phy.txt
@@ -51,6 +51,10 @@ Optional Properties:
   to ensure the integrated PHY is used. The absence of this property indicates
   the muxers should be configured so that the external PHY is used.
 
+- resets: The reset-controller phandle and specifier for the PHY reset signal.
+
+- reset-names: Must be "phy" for the PHY reset signal.
+
 - reset-gpios: The GPIO phandle and specifier for the PHY reset signal.
 
 - reset-assert-us: Delay after the reset was asserted in microseconds.
@@ -67,6 +71,8 @@ ethernet-phy@0 {
 	interrupts = <35 IRQ_TYPE_EDGE_RISING>;
 	reg = <0>;
 
+	resets = <&rst 8>;
+	reset-names = "phy";
 	reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
 	reset-assert-us = <1000>;
 	reset-deassert-us = <2000>;
-- 
2.21.0
