From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 3/6] dt-binding: pcf8523: add xtal load capacitance
Date: Sat, 19 Jan 2019 10:00:28 +0100
Message-ID: <20190119090031.29147-4-sam@ravnborg.org>
References: <20190119090031.29147-1-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119090031.29147-1-sam@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Andrew Jeffery <andrew@aj.id.au>, Fabio Estevam <fabio.estevam@nxp.com>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, =?UTF-8?q?Urs=20F=C3=A4ssler?= <urs.fassler@bbv.ch>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>
List-Id: devicetree@vger.kernel.org

The NXP pcf8523 supports two different xtal load capacitance
- 7000fF  (7pF)    HW default
- 12500fF (12.5pF) Minimum power consumption, driver default

To obtain a precise RTC the pcf8523 must be configured
with the correct capacitance load of the xtal.

Add a property to specify the xtal capacitance load.
The default value matches that of the current Linux driver.

With a dedicated binding remove the entry in rtc.txt

Signed-off-by: Søren Andersen <san@skov.dk>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>
---
 Documentation/devicetree/bindings/rtc/nxp,pcf8523.txt | 18 ++++++++++++++++++
 Documentation/devicetree/bindings/rtc/rtc.txt         |  1 -
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf8523.txt

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf8523.txt b/Documentation/devicetree/bindings/rtc/nxp,pcf8523.txt
new file mode 100644
index 000000000000..0b1080c60f63
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf8523.txt
@@ -0,0 +1,18 @@
+* NXP PCF8523 Real Time Clock
+
+Required properties:
+- compatible: Should contain "nxp,pcf8523".
+- reg: I2C address for chip.
+
+Optional property:
+- quartz-load-femtofarads: The capacitive load of the quartz(x-tal),
+  expressed in femto Farad (fF). Valid values are 7000 and 12500.
+  Default value (if no value is specified) is 12500fF.
+
+Example:
+
+pcf8523: rtc@68 {
+	compatible = "nxp,pcf8523";
+	reg = <0x68>;
+	quartz-load-femtofarads = <7000>;
+};
diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt b/Documentation/devicetree/bindings/rtc/rtc.txt
index 41eb335ea816..6d726a801d21 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc.txt
@@ -55,7 +55,6 @@ isil,isl12022		Intersil ISL12022 Real-time Clock
 microcrystal,rv3029	Real Time Clock Module with I2C-Bus
 nxp,pcf2127		Real-time clock
 nxp,pcf2129		Real-time clock
-nxp,pcf8523		Real-time Clock
 nxp,pcf8563		Real-time clock/calendar
 nxp,pcf85063		Tiny Real-Time Clock
 pericom,pt7c4338	Real-time Clock Module
-- 
2.12.0
