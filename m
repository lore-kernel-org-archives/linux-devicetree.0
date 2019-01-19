From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 1/6] devicetree: property-units: Add femtofarads unit
Date: Sat, 19 Jan 2019 10:00:26 +0100
Message-ID: <20190119090031.29147-2-sam@ravnborg.org>
References: <20190119090031.29147-1-sam@ravnborg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119090031.29147-1-sam@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Andrew Jeffery <andrew@aj.id.au>, Fabio Estevam <fabio.estevam@nxp.com>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, =?UTF-8?q?Urs=20F=C3=A4ssler?= <urs.fassler@bbv.ch>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
List-Id: devicetree@vger.kernel.org

When dealing with capacitance of 0.5 pF then
a smaller unit is preferred.
Add femtofarads to deal with this.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 Documentation/devicetree/bindings/property-units.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/property-units.txt b/Documentation/devicetree/bindings/property-units.txt
index 45ce054d844d..bfd33734faca 100644
--- a/Documentation/devicetree/bindings/property-units.txt
+++ b/Documentation/devicetree/bindings/property-units.txt
@@ -31,6 +31,7 @@ Electricity
 -microwatt-hours: micro Watt-hours
 -microvolt	: micro volts
 -picofarads	: picofarads
+-femtofarads	: femtofarads
 
 Temperature
 ----------------------------------------
-- 
2.12.0
