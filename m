From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH v2 2/5] dt-bindings: clock: add description of LPC32xx USB clock controller
Date: Sun,  6 Dec 2015 12:45:54 +0200
Message-ID: <1449398757-16834-3-git-send-email-vz@mleia.com>
References: <1449398757-16834-1-git-send-email-vz@mleia.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1449398757-16834-1-git-send-email-vz@mleia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@arm.linux.org.uk>, Roland Stigge <stigge@antcom.de>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

NXP LPC32xx USB controller has a subdevice, which controls USB AHB
slave, USB OTG, USB OHCI, USB device and I2C controller to USB phy
clocks, this change adds description of the clock controller, for more
details reference LPC32xx User's Manual, namely USB control, OTG clock
control and OTG clock status registers.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
Changes from v1 to v2:
- use lowercase hex numbers in a DT binding example

 .../bindings/clock/nxp,lpc3220-usb-clk.txt         | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/nxp,lpc3220-usb-clk.txt

diff --git a/Documentation/devicetree/bindings/clock/nxp,lpc3220-usb-clk.txt b/Documentation/devicetree/bindings/clock/nxp,lpc3220-usb-clk.txt
new file mode 100644
index 0000000..0aa2494
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nxp,lpc3220-usb-clk.txt
@@ -0,0 +1,22 @@
+NXP LPC32xx USB Clock Controller
+
+Required properties:
+- compatible: should be "nxp,lpc3220-usb-clk"
+- reg:  should contain clock controller registers location and length
+- #clock-cells: must be 1, the cell holds id of a clock provided by the
+  USB clock controller
+
+Examples:
+
+	usb {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges = <0x0 0x31020000 0x00001000>;
+
+		usbclk: clock-controller@f00 {
+			compatible = "nxp,lpc3220-usb-clk";
+			reg = <0xf00 0x100>;
+			#clock-cells = <1>;
+		};
+	};
-- 
2.1.4

