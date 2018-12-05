Return-Path: <SRS0=O9KN=OO=linux.intel.com=andriy.shevchenko@kernel.org>
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/4] dt-bindings: sc16is7xx: Add alternative clock-frequence property
Date: Wed,  5 Dec 2018 16:11:30 +0200
Message-Id: <20181205141133.9305-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org, Georgii Staroselskii <georgii.staroselskii@emlid.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

For the platforms which have no clock provider for the sc16is7xx type of UART,
introduce an alternative clock-frequency property which would be used instead.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt b/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt
index e7921a8e276b..b8cf38a1e43c 100644
--- a/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt
+++ b/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt
@@ -12,6 +12,8 @@ Required properties:
 - reg: I2C address of the SC16IS7xx device.
 - interrupts: Should contain the UART interrupt
 - clocks: Reference to the IC source clock.
+	OR
+- clock-frequency: The source clock frequency for the IC.
 
 Optional properties:
 - gpio-controller: Marks the device node as a GPIO controller.
-- 
2.19.2
