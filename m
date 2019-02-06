From: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [RESEND PATCH] dt-bindings: arm: atmel: add new sam9x60 SFR binding
Date: Wed, 6 Feb 2019 19:04:25 +0100
Message-ID: <20190206180425.27324-1-nicolas.ferre@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: devicetree@vger.kernel.org

Add this SFR compatible definition for the sam9x60 SoC. Will be needed
in OHCI driver: ohci-at91.c.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
Hi Rob,
It seems that this patch was lost in my series "[PATCH 0/8] ARM: at91/dt:
update to existing drivers for the sam9x60 SoC". I split it and resend it only
for USB tree.

Hi Greg,

This DT bindind goes with the patch already queued in your usb-next tree "USB:
host: ohci-at91: add sam9x60-sfr definition for ohci".

Once Rob added his tag, can you please queue it in your tree as I reviewed my
first idea of adding it to the arm-soc tree?

Best regards,
  Nicolas

 Documentation/devicetree/bindings/arm/atmel-sysregs.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
index badce6ef3ab3..dfc91bc02b97 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -148,6 +148,7 @@ required properties:
 - compatible: Should be "atmel,<chip>-sfr", "syscon" or
 	"atmel,<chip>-sfrbu", "syscon"
   <chip> can be "sama5d3", "sama5d4" or "sama5d2".
+  It also can be "microchip,sam9x60-sfr", "syscon".
 - reg: Should contain registers location and length
 
 	sfr@f0038000 {
-- 
2.17.1
