Return-Path: <SRS0=5pMM=PL=bootlin.com=thomas.petazzoni@kernel.org>
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 1/4] dt-bindings: gpio: document the new pull-up/pull-down flags
Date: Thu,  3 Jan 2019 17:40:59 +0100
Message-Id: <20190103164102.31437-2-thomas.petazzoni@bootlin.com>
In-Reply-To: <20190103164102.31437-1-thomas.petazzoni@bootlin.com>
References: <20190103164102.31437-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Frank Rowand <frowand.list@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

This commit extends the flags that can be used in GPIO specifiers to
indicate if a pull-up resistor or pull-down resistor should be
enabled.

While some pinctrl DT bindings already offer the capability of
configuring pull-up/pull-down resistors at the pin level, a number of
simple GPIO controllers don't have any pinmuxing capability, and
therefore do not rely on the pinctrl DT bindings.

Such simple GPIO controllers however sometimes allow to configure
pull-up and pull-down resistors on a per-pin basis, and whether such
resistors should be enabled or not is a highly board-specific HW
characteristic.

By using two additional bits of the GPIO flag specifier, we can easily
allow the Device Tree to describe which GPIOs should have their
pull-up or pull-down resistors enabled. Even though the two options
are mutually exclusive, we still need two bits to encode at least
three states: no pull-up/pull-down, pull-up, pull-down.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index f0ba154b5723..03d8adf67c16 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -67,6 +67,10 @@ Optional standard bitfield specifiers for the last cell:
            https://en.wikipedia.org/wiki/Open_collector
 - Bit 3: 0 means the output should be maintained during sleep/low-power mode
          1 means the output state can be lost during sleep/low-power mode
+- Bit 4: 0 means no pull-up resistor should be enabled
+         1 means a pull-up resistor should be enabled
+- Bit 5: 0 means no pull-down resistor should be enabled
+         1 means a pull-down resistor should be enabled
 
 1.1) GPIO specifier best practices
 ----------------------------------
-- 
2.20.1
