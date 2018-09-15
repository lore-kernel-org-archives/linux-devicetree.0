From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH net-next 1/5] dt-bindings: net: lantiq,xrx200-net: Use lower case in hex
Date: Sat, 15 Sep 2018 14:08:45 +0200
Message-ID: <20180915120849.24630-2-hauke@hauke-m.de>
References: <20180915120849.24630-1-hauke@hauke-m.de>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180915120849.24630-1-hauke@hauke-m.de>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

Use lower case letters in the addresses of the device tree binding.
In addition replace eth with ethernet and fix the size of the reg
element in the example. The additional range does not contain any
registers but is used for the IP block on the this SoC.

Fixes: 839790e88a3c ("dt-bindings: net: Add lantiq, xrx200-net DT bindings")
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt
index 8a2fe5200cdc..5ff5e68bbbb6 100644
--- a/Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt
+++ b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt
@@ -11,11 +11,11 @@ Required properties:
 
 Example:
 
-eth0: eth@E10B308 {
+ethernet@e10b308 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	compatible = "lantiq,xrx200-net";
-	reg = <0xE10B308 0x30>;
+	reg = <0xe10b308 0xcf8>;
 	interrupts = <73>, <72>;
 	interrupt-names = "tx", "rx";
 };
-- 
2.11.0
