Return-Path: <soeren.brinkmann@gmail.com>
Sender: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soeren.brinkmann@gmail.com>
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH 6/7] tty: cadence: Document DT binding
Date: Mon, 10 Mar 2014 14:21:17 -0700
Message-Id: <1394486478-31037-7-git-send-email-soren.brinkmann@xilinx.com>
In-Reply-To: <1394486478-31037-1-git-send-email-soren.brinkmann@xilinx.com>
References: <1394486478-31037-1-git-send-email-soren.brinkmann@xilinx.com>
To: Russell King <linux@arm.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: Michal Simek <michal.simek@xilinx.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

Add binding documentation for the Cadence UART.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
Acked-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/serial/cdns,uart.txt         | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/cdns,uart.txt

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.txt b/Documentation/devicetree/bindings/serial/cdns,uart.txt
new file mode 100644
index 000000000000..a3eb154c32ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.txt
@@ -0,0 +1,20 @@
+Binding for Cadence UART Controller
+
+Required properties:
+- compatible : should be "cdns,uart-r1p8", or "xlnx,xuartps"
+- reg: Should contain UART controller registers location and length.
+- interrupts: Should contain UART controller interrupts.
+- clocks: Must contain phandles to the UART clocks
+  See ../clocks/clock-bindings.txt for details.
+- clock-names: Tuple to identify input clocks, must contain "uart_clk" and "pclk"
+  See ../clocks/clock-bindings.txt for details.
+
+
+Example:
+	uart@e0000000 {
+		compatible = "cdns,uart-r1p8";
+		clocks = <&clkc 23>, <&clkc 40>;
+		clock-names = "uart_clk", "pclk";
+		reg = <0xE0000000 0x1000>;
+		interrupts = <0 27 4>;
+	};
-- 
1.9.0.1.g4196000
