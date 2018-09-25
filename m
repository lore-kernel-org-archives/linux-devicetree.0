Return-Path: <SRS0=Rgu5=MH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43585 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729299AbeIYUkP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Sep 2018 16:40:15 -0400
Received: by mail-lj1-f196.google.com with SMTP id m84-v6so21919118lje.10
        for <devicetree@vger.kernel.org>; Tue, 25 Sep 2018 07:32:28 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] spi: Add a DT binding for high-impedance turn-around
Date: Tue, 25 Sep 2018 16:32:19 +0200
Message-Id: <20180925143220.19007-1-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Some 3WIRE SPI devices require the host to insert a
"high-impedance turn-around" essentially a clock pulse after
switching the one line from output to input.

This is needed to support the TPO TPG110 panel to use
the 3WIRE SPI bindings.

Cc: devicetree@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Change some spelling, instert dash in high-impedance
  use turn-around instead of turnaround.
---
 Documentation/devicetree/bindings/spi/spi-bus.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-bus.txt b/Documentation/devicetree/bindings/spi/spi-bus.txt
index 1f6e86f787ef..d0b2d88a20ee 100644
--- a/Documentation/devicetree/bindings/spi/spi-bus.txt
+++ b/Documentation/devicetree/bindings/spi/spi-bus.txt
@@ -70,6 +70,10 @@ All slave nodes can contain the following optional properties:
 - spi-cs-high     - Empty property indicating device requires chip select
 		    active high.
 - spi-3wire       - Empty property indicating device requires 3-wire mode.
+- spi-3wire-high-impedance-turn-around - Empty property indicating that a
+		    3wire host need to insert a high-impedance turn-around
+		    clock cycle after turning the one output line into an
+		    input line.
 - spi-lsb-first   - Empty property indicating device requires LSB first mode.
 - spi-tx-bus-width - The bus width (number of data wires) that is used for MOSI.
 		    Defaults to 1 if not present.
-- 
2.17.1
