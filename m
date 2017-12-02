From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH net-next 1/2 v6] net: ethernet: Add DT bindings for the Gemini ethernet
Date: Sat,  2 Dec 2017 12:06:39 +0100
Message-ID: <20171202110640.5284-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tobias Waldvogel <tobias.waldvogel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the device tree bindings for the Gemini ethernet
controller. It is pretty straight-forward, using standard
bindings and modelling the two child ports as child devices
under the parent ethernet controller device.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tobias Waldvogel <tobias.waldvogel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/net/cortina,gemini-ethernet.txt       | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/cortina,gemini-ethernet.txt

diff --git a/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.txt b/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.txt
new file mode 100644
index 000000000000..35fa3abd1c73
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.txt
@@ -0,0 +1,92 @@
+Cortina Systems Gemini Ethernet Controller
+==========================================
+
+This ethernet controller is found in the Gemini SoC family:
+StorLink SL3512 and SL3516, also known as Cortina Systems
+CS3512 and CS3516.
+
+Required properties:
+- compatible: must be "cortina,gemini-ethernet"
+- reg: must contain the global registers and the V-bit and A-bit
+  memory areas, in total three register sets.
+- syscon: a phandle to the system controller
+- #address-cells: must be specified, must be <1>
+- #size-cells: must be specified, must be <1>
+- ranges: should be state like this giving a 1:1 address translation
+  for the subnodes
+
+The subnodes represents the two ethernet ports in this device.
+They are not independent of each other since they share resources
+in the parent node, and are thus children.
+
+Required subnodes:
+- port0: contains the resources for ethernet port 0
+- port1: contains the resources for ethernet port 1
+
+Required subnode properties:
+- compatible: must be "cortina,gemini-ethernet-port"
+- reg: must contain two register areas: the DMA/TOE memory and
+  the GMAC memory area of the port
+- interrupts: should contain the interrupt line of the port.
+  this is nominally a level interrupt active high.
+- resets: this must provide an SoC-integrated reset line for
+  the port.
+- clocks: this should contain a handle to the PCLK clock for
+  clocking the silicon in this port
+- clock-names: must be "PCLK"
+
+Optional subnode properties:
+- phy-mode: see ethernet.txt
+- phy-handle: see ethernet.txt
+
+Example:
+
+mdio-bus {
+	(...)
+	phy0: ethernet-phy@1 {
+		reg = <1>;
+		device_type = "ethernet-phy";
+	};
+	phy1: ethernet-phy@3 {
+		reg = <3>;
+		device_type = "ethernet-phy";
+	};
+};
+
+
+ethernet@60000000 {
+	compatible = "cortina,gemini-ethernet";
+	reg = <0x60000000 0x4000>, /* Global registers, queue */
+	      <0x60004000 0x2000>, /* V-bit */
+	      <0x60006000 0x2000>; /* A-bit */
+	syscon = <&syscon>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges;
+
+	gmac0: port0 {
+		compatible = "cortina,gemini-ethernet-port";
+		reg = <0x60008000 0x2000>, /* Port 0 DMA/TOE */
+		      <0x6000a000 0x2000>; /* Port 0 GMAC */
+		interrupt-parent = <&intcon>;
+		interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+		resets = <&syscon GEMINI_RESET_GMAC0>;
+		clocks = <&syscon GEMINI_CLK_GATE_GMAC0>;
+		clock-names = "PCLK";
+		phy-mode = "rgmii";
+		phy-handle = <&phy0>;
+	};
+
+	gmac1: port1 {
+		compatible = "cortina,gemini-ethernet-port";
+		reg = <0x6000c000 0x2000>, /* Port 1 DMA/TOE */
+		      <0x6000e000 0x2000>; /* Port 1 GMAC */
+		interrupt-parent = <&intcon>;
+		interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+		resets = <&syscon GEMINI_RESET_GMAC1>;
+		clocks = <&syscon GEMINI_CLK_GATE_GMAC1>;
+		clock-names = "PCLK";
+		phy-mode = "rgmii";
+		phy-handle = <&phy1>;
+	};
+};
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
