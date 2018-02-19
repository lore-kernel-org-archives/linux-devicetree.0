Return-Path: <SRS0=kFSR=FN=gmail.com=joel.stan@kernel.org>
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 1/3] dt-bindings: aspeed-lpc: Add reset controller
Date: Mon, 19 Feb 2018 17:24:36 +1030
Message-Id: <20180219065438.19933-2-joel@jms.id.au>
In-Reply-To: <20180219065438.19933-1-joel@jms.id.au>
References: <20180219065438.19933-1-joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, Andrew Jeffery <andrew@aj.id.au>
Cc: Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>

This describes the reset controller present in the LPC address space.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/mfd/aspeed-lpc.txt          | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
index 514d82ced95b..721a2b1eb40f 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
+++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
@@ -135,3 +135,24 @@ lhc: lhc@20 {
 	compatible = "aspeed,ast2500-lhc";
 	reg = <0x20 0x24 0x48 0x8>;
 };
+
+LPC reset control
+-----------------
+
+The UARTs present in the ASPEED SoC can have their resets tied to the reset
+state of the LPC bus. Some systems may chose to modify this configuration.
+
+Required properties:
+
+ - comaptible:		"aspeed,ast2500-lpc-reset" or
+ 			"aspeed,ast2400-lpc-reset"
+ - reg:			offset and length of the IP in the LHC memory region
+ - #reset-controller	indacates the number of reset cells excepted
+
+Example:
+
+lpc_reset: reset-controller@18 {
+        compatible = "aspeed,ast2500-lpc-reset";
+        reg = <0x18 0x4>;
+        #reset-cells = <1>;
+};
-- 
2.15.1
