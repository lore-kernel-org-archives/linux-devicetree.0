From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 1/3] dt-bindings: aspeed-lpc: Document LPC Host Interface Controller
Date: Mon, 12 Feb 2018 17:38:45 +1030
Message-ID: <20180212070847.32387-2-joel@jms.id.au>
References: <20180212070847.32387-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180212070847.32387-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Cyril Bur <cyrilbur@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Lei YU <mine260309@gmail.com>
List-Id: devicetree@vger.kernel.org

The LPC Host Interface Controller is part of a BMC SoC that is used for
communication with the host.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/mfd/aspeed-lpc.txt         | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
index 514d82ced95b..94a31de109c4 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
+++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
@@ -109,6 +109,46 @@ lpc: lpc@1e789000 {
 	};
 };
 
+BMC Node Children
+==================
+
+LPC Host Interface Controller
+-------------------
+
+The LPC Host Interface Controller manages functions exposed to the host such as
+LPC firmware hub cycles, configuration of the LPC-to-AHB mapping, UART
+management and bus snoop configuration.
+
+Required properties:
+
+- compatible:	One of:
+		"aspeed,ast2400-lpc-ctrl";
+		"aspeed,ast2500-lpc-ctrl";
+
+- reg:		contains offset/length values of the host interface controller
+		memory regions
+
+- clocks:	contains a phandle to the syscon node describing the clocks.
+		There should then be one cell representing the clock to use
+
+- memory-region: A phandle to a reserved_memory region to be used for the LPC
+		to AHB mapping
+
+- flash:	A phandle to the SPI flash controller containing the flash to
+		be exposed over the LPC to AHB mapping
+
+Example:
+
+lpc-host@80 {
+	lpc_ctrl: lpc-ctrl@0 {
+		compatible = "aspeed,ast2500-lpc-ctrl";
+		reg = <0x0 0x80>;
+		clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
+		memory-region = <&flash_memory>;
+		flash = <&spi>;
+	};
+};
+
 Host Node Children
 ==================
 
-- 
2.15.1
