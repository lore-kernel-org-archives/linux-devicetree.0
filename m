From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v5 3/4] dt-bindings: clk: at91: add bindings for SAM9X60's slow clock controller
Date: Thu, 27 Jun 2019 17:47:20 +0300
Message-ID: <1561646841-7663-4-git-send-email-claudiu.beznea@microchip.com>
References: <1561646841-7663-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561646841-7663-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: devicetree@vger.kernel.org

Add bindings for SAM9X60's slow clock controller.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/at91-clock.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/at91-clock.txt b/Documentation/devicetree/bindings/clock/at91-clock.txt
index b520280e33ff..13f45db3b66d 100644
--- a/Documentation/devicetree/bindings/clock/at91-clock.txt
+++ b/Documentation/devicetree/bindings/clock/at91-clock.txt
@@ -9,10 +9,11 @@ Slow Clock controller:
 Required properties:
 - compatible : shall be one of the following:
 	"atmel,at91sam9x5-sckc",
-	"atmel,sama5d3-sckc" or
-	"atmel,sama5d4-sckc":
+	"atmel,sama5d3-sckc",
+	"atmel,sama5d4-sckc" or
+	"microchip,sam9x60-sckc":
 		at91 SCKC (Slow Clock Controller)
-- #clock-cells : shall be 0.
+- #clock-cells : shall be 1 for "microchip,sam9x60-sckc" otherwise shall be 0.
 - clocks : shall be the input parent clock phandle for the clock.
 
 Optional properties:
-- 
2.7.4
