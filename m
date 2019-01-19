From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 2/6] dt-bindings: rtc: Add quartz-load-femtofarads property
Date: Sat, 19 Jan 2019 10:00:27 +0100
Message-ID: <20190119090031.29147-3-sam@ravnborg.org>
References: <20190119090031.29147-1-sam@ravnborg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119090031.29147-1-sam@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Andrew Jeffery <andrew@aj.id.au>, Fabio Estevam <fabio.estevam@nxp.com>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, =?UTF-8?q?Urs=20F=C3=A4ssler?= <urs.fassler@bbv.ch>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
List-Id: devicetree@vger.kernel.org

The quartz-load-femtofarads are relevant for
several users. Add it as a common property in rtc.
Note that valid values and default values must be documented.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Suggested-by: Rob Herring <robh+dt@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
---
 Documentation/devicetree/bindings/rtc/rtc.txt | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt b/Documentation/devicetree/bindings/rtc/rtc.txt
index 7c8da6926095..41eb335ea816 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc.txt
@@ -21,12 +21,16 @@ Optional properties
 The following properties may not be supported by all drivers. However, if a
 driver wants to support one of the below features, it should adapt the bindings
 below.
-- trickle-resistor-ohms : Selected resistor for trickle charger. Should be given
-                          if trickle charger should be enabled
-- trickle-diode-disable : Do not use internal trickle charger diode Should be
-                          given if internal trickle charger diode should be
-                          disabled
-- wakeup-source :         Enables wake up of host system on alarm
+- trickle-resistor-ohms :   Selected resistor for trickle charger. Should be given
+                            if trickle charger should be enabled
+- trickle-diode-disable :   Do not use internal trickle charger diode Should be
+                            given if internal trickle charger diode should be
+                            disabled
+- wakeup-source :           Enables wake up of host system on alarm
+- quartz-load-femtofarads : The capacitive load of the quartz(x-tal),
+                            expressed in femto Farad (fF).
+                            The default value shall be listed (if optional),
+                            and likewise all valid values.
 
 Trivial RTCs
 ------------
-- 
2.12.0
