Return-Path: <SRS0=kFSR=FN=gmail.com=joel.stan@kernel.org>
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 1/3] dt-bindings: aspeed-lpc: Document LPC Host Interface Controller
Date: Mon, 19 Feb 2018 17:54:20 +1030
Message-Id: <20180219072422.22733-2-joel@jms.id.au>
In-Reply-To: <20180219072422.22733-1-joel@jms.id.au>
References: <20180219072422.22733-1-joel@jms.id.au>
To: Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Cyril Bur <cyrilbur@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Lei YU <mine260309@gmail.com>
List-ID: <devicetree@vger.kernel.org>

The LPC Host Interface Controller is part of a BMC SoC that is used for
communication with the host.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Move the content to below the Host Node Children heading
 - Add Rob's review tag
---
 .../devicetree/bindings/mfd/aspeed-lpc.txt         | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
index 514d82ced95b..69aadee00d5f 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
+++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
@@ -109,9 +109,50 @@ lpc: lpc@1e789000 {
 	};
 };
 
+BMC Node Children
+==================
+
+
 Host Node Children
 ==================
 
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
 LPC Host Controller
 -------------------
 
-- 
2.15.1
