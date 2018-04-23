Return-Path: <SRS0=pQuZ=HM=vger.kernel.org=devicetree-owner@kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:60100 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754067AbeDWHcp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Apr 2018 03:32:45 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: meson-uart: DT fix s/clocks-names/clock-names/
Date: Mon, 23 Apr 2018 09:32:40 +0200
Message-Id: <1524468760-22912-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
index 8ff65fa632fdedd7..c06c045126fc9070 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
@@ -21,7 +21,7 @@ Required properties:
 - interrupts : identifier to the device interrupt
 - clocks : a list of phandle + clock-specifier pairs, one for each
 	   entry in clock names.
-- clocks-names :
+- clock-names :
    * "xtal" for external xtal clock identifier
    * "pclk" for the bus core clock, either the clk81 clock or the gate clock
    * "baud" for the source of the baudrate generator, can be either the xtal
-- 
2.7.4

