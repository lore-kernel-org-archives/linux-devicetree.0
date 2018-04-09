From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH net-next 2/3] dt-bindings: net: ave: add syscon-phy-mode
 property to configure phy-mode setting
Date: Mon,  9 Apr 2018 15:38:44 +0900
Message-ID: <1523255925-6469-3-git-send-email-hayashi.kunihiko@socionext.com>
References: <1523255925-6469-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1523255925-6469-1-git-send-email-hayashi.kunihiko@socionext.com>
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

Add "socionext,syscon-phy-mode" property to specify system controller that
configures the settings about phy-mode.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt
index 85e0c49..fc8f017 100644
--- a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt
+++ b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt
@@ -13,7 +13,8 @@ Required properties:
  - reg: Address where registers are mapped and size of region.
  - interrupts: Should contain the MAC interrupt.
  - phy-mode: See ethernet.txt in the same directory. Allow to choose
-	"rgmii", "rmii", or "mii" according to the PHY.
+	"rgmii", "rmii", "mii", or "internal" according to the PHY.
+	The acceptable mode is SoC-dependent.
  - phy-handle: Should point to the external phy device.
 	See ethernet.txt file in the same directory.
  - clocks: A phandle to the clock for the MAC.
@@ -27,6 +28,8 @@ Required properties:
  - reset-names: Should contain
 	- "ether", "gio" for Pro4 SoC
 	- "ether" for others
+ - socionext,syscon-phy-mode: A phandle to syscon with one argument
+	that configures phy mode. The argument is the ID of MAC instance.
 
 Optional properties:
  - local-mac-address: See ethernet.txt in the same directory.
@@ -47,6 +50,7 @@ Example:
 		clocks = <&sys_clk 6>;
 		reset-names = "ether";
 		resets = <&sys_rst 6>;
+		socionext,syscon-phy-mode = <&soc_glue 0>;
 		local-mac-address = [00 00 00 00 00 00];
 
 		mdio {
-- 
2.7.4
