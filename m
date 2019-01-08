From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 1/5] devicetree: property-units: Add femtofarads unit
Date: Tue,  8 Jan 2019 19:54:10 +0100
Message-ID: <20190108185414.26922-2-sam@ravnborg.org>
References: <20190108185414.26922-1-sam@ravnborg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108185414.26922-1-sam@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Jeffery <andrew@aj.id.au>, Fabio Estevam <fabio.estevam@nxp.com>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, =?UTF-8?q?Urs=20F=C3=A4ssler?= <urs.fassler@bbv.ch>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

When dealing with capacitance of 0.5 pF then
a smaller unit is preferred.
Add femtofarads to deal with this.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
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
