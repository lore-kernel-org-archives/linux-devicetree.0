From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH net-next v9 1/2] dt-bindings: net: add DT bindings for
 Socionext UniPhier AVE
Date: Thu, 28 Dec 2017 15:58:11 +0900
Message-ID: <1514444292-20643-2-git-send-email-hayashi.kunihiko@socionext.com>
References: <1514444292-20643-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1514444292-20643-1-git-send-email-hayashi.kunihiko@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Miller <davem@davemloft.net>, netdev@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

DT bindings for the AVE ethernet controller found on Socionext's
UniPhier platforms.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../bindings/net/socionext,uniphier-ave4.txt       | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt

diff --git a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt
new file mode 100644
index 0000000..270ea4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt
@@ -0,0 +1,48 @@
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
+
+			ethphy: ethphy@1 {
+				reg = <1>;
+			};
+		};
+	};
-- 
2.7.4
