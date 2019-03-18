Return-Path: <SRS0=wFt+=RV=linux.intel.com=andriy.shevchenko@kernel.org>
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/4] dt-bindings: sc16is7xx: Add alternative clock-frequency property
Date: Mon, 18 Mar 2019 12:29:14 +0200
Message-Id: <20190318102917.47318-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190318102917.47318-1-andriy.shevchenko@linux.intel.com>
References: <20190318102917.47318-1-andriy.shevchenko@linux.intel.com>
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
index e7921a8e276b..c1091a923a89 100644
--- a/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt
+++ b/Documentation/devicetree/bindings/serial/nxp,sc16is7xx.txt
@@ -12,6 +12,8 @@ Required properties:
 - reg: I2C address of the SC16IS7xx device.
 - interrupts: Should contain the UART interrupt
 - clocks: Reference to the IC source clock.
+	OR (when there is no clock provider visible to the platform)
+- clock-frequency: The source clock frequency for the IC.
 
 Optional properties:
 - gpio-controller: Marks the device node as a GPIO controller.
-- 
2.20.1
