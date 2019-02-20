Return-Path: <SRS0=W9ao=Q3=renesas.com=gareth.williams.jx@kernel.org>
From: Gareth Williams <gareth.williams.jx@renesas.com>
Subject: [PATCH v3 1/2] dt: snps,designware-i2c: Add clock bindings documentation
Date: Wed, 20 Feb 2019 13:25:47 +0000
Message-Id: <1550669148-6027-2-git-send-email-gareth.williams.jx@renesas.com>
In-Reply-To: <1550669148-6027-1-git-send-email-gareth.williams.jx@renesas.com>
References: <1550669148-6027-1-git-send-email-gareth.williams.jx@renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Phil Edworthy <phil.edworthy@renesas.com>, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Phil Edworthy <phil.edworthy@renesas.com>

The driver requires an undocumented clock property, so detail it.
Add documentation for a separate, optional, bus clock.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

v3:
 - Changed clocks and clock-names sections to use term "peripheral clock"
   (pclk) instead of "bus clock" (busclk).
v2:
 - No changes.
v1:
 - Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-designware.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-designware.txt b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
index 3e4bcc2..f94aa59 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-designware.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
@@ -6,12 +6,21 @@ Required properties :
                 or "mscc,ocelot-i2c" with "snps,designware-i2c" for fallback
  - reg : Offset and length of the register set for the device
  - interrupts : <IRQ> where IRQ is the interrupt number.
+ - clocks : phandles for the clocks, see the description of clock-names below.
+   The phandle for the "ic_clk" clock is required. The phandle for the "pclk"
+   clock is optional. If a single clock is specified but no clock-name, it is
+   the "ic_clk" clock. If both clocks are listed, the "ic_clk" must be first.
 
 Recommended properties :
 
  - clock-frequency : desired I2C bus clock frequency in Hz.
 
 Optional properties :
+
+ - clock-names : Contains the names of the clocks:
+    "ic_clk", for the core clock used to generate the external I2C clock.
+    "pclk", the peripheral clock, required for register accesses.
+
  - reg : for "mscc,ocelot-i2c", a second register set to configure the SDA hold
    time, named ICPU_CFG:TWI_DELAY in the datasheet.
 
-- 
2.7.4
