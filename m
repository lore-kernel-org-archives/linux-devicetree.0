From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 2/2] doc: dt: add documentation for nxp,lpc1773-spifi
Date: Thu,  9 Jul 2015 22:19:07 +0200
Message-ID: <1436473147-31063-3-git-send-email-manabian@gmail.com>
References: <1436473147-31063-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436473147-31063-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add device tree binding documentation for the SPI Flash Interface
(SPIFI) found on NXP LPC18xx and LPC43xx devies.

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/mtd/nxp-spifi.txt          | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nxp-spifi.txt

diff --git a/Documentation/devicetree/bindings/mtd/nxp-spifi.txt b/Documentation/devicetree/bindings/mtd/nxp-spifi.txt
new file mode 100644
index 000000000000..f8b6b250654e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nxp-spifi.txt
@@ -0,0 +1,58 @@
+* NXP SPI Flash Interface (SPIFI)
+
+NXP SPIFI is a specialized SPI interface for serial Flash devices.
+It supports one Flash device with 1-, 2- and 4-bits width in SPI
+mode 0 or 3. The controller operates in either command or memory
+mode. In memory mode the Flash is accessible from the CPU as
+normal memory.
+
+Required properties:
+  - compatible : Should be "nxp,lpc1773-spifi"
+  - reg : the first contains the register location and length,
+          the second contains the memory mapping address and length
+  - reg-names: Should contain the reg names "spifi" and "flash"
+  - interrupts : Should contain the interrupt for the device
+  - clocks : The clocks needed by the SPIFI controller
+  - clock-names : Should contain the clock names "spifi" and "reg"
+
+Optional properties:
+ - resets : phandle + reset specifier
+
+The SPI Flash must be a child of the SPIFI node and must have a
+compatible property as specified in bindings/mtd/jedec,spi-nor.txt
+
+Optionally it can also contain the following properties.
+ - spi-cpol : Controller only supports mode 0 and 3 so either
+              both spi-cpol and spi-cpha should be present or
+              none of them
+ - spi-cpha : See above
+ - spi-rx-bus-width : Used to select how many pins that are used
+                      for input on the controller
+
+See bindings/spi/spi-bus.txt for more information.
+
+Example:
+spifi: spifi@40003000 {
+	compatible = "nxp,lpc1773-spifi";
+	reg = <0x40003000 0x1000>, <0x14000000 0x4000000>;
+	reg-names = "spifi", "flash";
+	interrupts = <30>;
+	clocks = <&ccu1 CLK_SPIFI>, <&ccu1 CLK_CPU_SPIFI>;
+	clock-names = "spifi", "reg";
+	resets = <&rgu 53>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		spi-cpol;
+		spi-cpha;
+		spi-rx-bus-width = <4>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "data";
+			reg = <0 0x200000>;
+		};
+	};
+};
+
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
