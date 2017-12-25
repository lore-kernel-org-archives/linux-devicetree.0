From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH net-next v8 1/2] dt-bindings: net: add DT bindings for Socionext UniPhier AVE
Date: Mon, 25 Dec 2017 10:10:37 +0900
Message-ID: <1514164238-28901-2-git-send-email-hayashi.kunihiko@socionext.com>
References: <1514164238-28901-1-git-send-email-hayashi.kunihiko@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1514164238-28901-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: devicetree@vger.kernel.org

DT bindings for the AVE ethernet controller found on Socionext's
UniPhier platforms.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/net/socionext,uniphier-ave4.txt       | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt

diff --git a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt
new file mode 100644
index 0000000..8b03668
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt
@@ -0,0 +1,47 @@
+* Socionext AVE ethernet controller
+
+This describes the devicetree bindings for AVE ethernet controller
+implemented on Socionext UniPhier SoCs.
+
+Required properties:
+ - compatible: Should be
+	- "socionext,uniphier-pro4-ave4" : for Pro4 SoC
+	- "socionext,uniphier-pxs2-ave4" : for PXs2 SoC
+	- "socionext,uniphier-ld11-ave4" : for LD11 SoC
+	- "socionext,uniphier-ld20-ave4" : for LD20 SoC
+ - reg: Address where registers are mapped and size of region.
+ - interrupts: Should contain the MAC interrupt.
+ - phy-mode: See ethernet.txt in the same directory. Allow to choose
+	"rgmii", "rmii", or "mii" according to the PHY.
+ - phy-handle: Should point to the external phy device.
+	See ethernet.txt file in the same directory.
+ - clocks: A phandle to the clock for the MAC.
+
+Optional properties:
+ - resets: A phandle to the reset control for the MAC.
+ - local-mac-address: See ethernet.txt in the same directory.
+
+Required subnode:
+ - mdio: A container for child nodes representing phy nodes.
+         See phy.txt in the same directory.
+
+Example:
+
+	ether: ethernet@65000000 {
+		compatible = "socionext,uniphier-ld20-ave4";
+		reg = <0x65000000 0x8500>;
+		interrupts = <0 66 4>;
+		phy-mode = "rgmii";
+		phy-handle = <&ethphy>;
+		clocks = <&sys_clk 6>;
+		resets = <&sys_rst 6>;
+		local-mac-address = [00 00 00 00 00 00];
+
+		mdio {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			ethphy: ethphy@1 {
+				reg = <1>;
+			};
+		};
+	};
-- 
2.7.4
