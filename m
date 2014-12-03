From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 08/11] usb: gadget: at91_udc: Update DT binding documentation
Date: Wed,  3 Dec 2014 12:32:07 +0100
Message-ID: <1417606330-17753-9-git-send-email-boris.brezillon@free-electrons.com>
References: <1417606330-17753-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417606330-17753-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Three compatible strings have been added to the at91_udc driver.
Update the documentation accordingly.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 Documentation/devicetree/bindings/usb/atmel-usb.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
index 6007231..54a8121 100644
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
@@ -33,7 +33,11 @@ usb1: ehci@00800000 {
 AT91 USB device controller
 
 Required properties:
- - compatible: Should be "atmel,at91rm9200-udc"
+ - compatible: Should be one of the following
+	       "atmel,at91rm9200-udc"
+	       "atmel,at91sam9260-udc"
+	       "atmel,at91sam9261-udc"
+	       "atmel,at91sam9263-udc"
  - reg: Address and length of the register set for the device
  - interrupts: Should contain macb interrupt
  - clocks: Should reference the peripheral and the AHB clocks
-- 
1.9.1
