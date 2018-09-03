Return-Path: <SRS0=vRyP=LR=linaro.org=linus.walleij@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/4] spi: Add a DT binding for high impedance turnaround
Date: Mon,  3 Sep 2018 23:50:34 +0200
Message-Id: <20180903215035.17265-4-linus.walleij@linaro.org>
In-Reply-To: <20180903215035.17265-1-linus.walleij@linaro.org>
References: <20180903215035.17265-1-linus.walleij@linaro.org>
To: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Some 3WIRE SPI devices require the host to insert a "high
impedance turnaround" essentially a clock pulse after
switching the one line from output to input.

This is needed to support the TPO TPG110 panel to use
the 3WIRE SPI bindings.

Cc: devicetree@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/spi/spi-bus.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-bus.txt b/Documentation/devicetree/bindings/spi/spi-bus.txt
index 1f6e86f787ef..ee08be2894eb 100644
--- a/Documentation/devicetree/bindings/spi/spi-bus.txt
+++ b/Documentation/devicetree/bindings/spi/spi-bus.txt
@@ -70,6 +70,10 @@ All slave nodes can contain the following optional properties:
 - spi-cs-high     - Empty property indicating device requires chip select
 		    active high.
 - spi-3wire       - Empty property indicating device requires 3-wire mode.
+- spi-3wire-high-impedance-turnaround - Empty property indicating that a
+		    3wire host need to insert a high impedance turn-around
+		    clock cycle after turning the one output line into an
+		    input line.
 - spi-lsb-first   - Empty property indicating device requires LSB first mode.
 - spi-tx-bus-width - The bus width (number of data wires) that is used for MOSI.
 		    Defaults to 1 if not present.
-- 
2.17.1
