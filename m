From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 1/5] dt-binding: rtci-pcf8523: add quartz_load property
Date: Fri,  7 Sep 2018 21:35:04 +0200
Message-ID: <20180907193508.24974-2-sam@ravnborg.org>
References: <20180822183555.GA24084@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180822183555.GA24084@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Jeffery <andrew@aj.id.au>, Fabio Estevam <fabio.estevam@nxp.com>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>
List-Id: devicetree@vger.kernel.org

From: Søren Andersen <san@skov.dk>

The NXP pcf8523 supports two different quartz loads.
- 7 pF (default)
- 12.5 pF (minimum power consumption)

The pcf8523 needs to know the size of the quartz load,
otherwise the the RTC will have a bad precision.

The default for the rtc (after power-on) is 7 pF.
Add a property that tells if the external capacitor is 12.5 pF.

Signed-off-by: Søren Andersen <san@skov.dk>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
---
 Documentation/devicetree/bindings/rtc/nxp,pcf8523.txt | 19 +++++++++++++++++++
 Documentation/devicetree/bindings/trivial-devices.txt |  1 -
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf8523.txt

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf8523.txt b/Documentation/devicetree/bindings/rtc/nxp,pcf8523.txt
new file mode 100644
index 000000000000..7c5e93f5077c
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf8523.txt
@@ -0,0 +1,19 @@
+* NXP PCF8523 Real Time Clock
+
+NXP PCF8523 Real Time Clock
+
+Required properties:
+- compatible: Should contain "nxp,pcf8523".
+- reg: I2C address for chip.
+
+Optional property:
+- nxp,quartz_load_12.5pF: The capacitive load on the quartz is 12.5 pF,
+  which differ from the default value of 7 pF
+
+Example:
+
+pcf8523: pcf8523@68 {
+	compatible = "nxp,pcf85063";
+	reg = <0x68>;
+	nxp,quartz_load_12.5pF;
+};
diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
index 763a2808a95c..297dc82b67ad 100644
--- a/Documentation/devicetree/bindings/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/trivial-devices.txt
@@ -169,7 +169,6 @@ nxp,pca9556		Octal SMBus and I2C registered interface
 nxp,pca9557		8-bit I2C-bus and SMBus I/O port with reset
 nxp,pcf2127		Real-time clock
 nxp,pcf2129		Real-time clock
-nxp,pcf8523		Real-time Clock
 nxp,pcf8563		Real-time clock/calendar
 nxp,pcf85063		Tiny Real-Time Clock
 oki,ml86v7667		OKI ML86V7667 video decoder
-- 
2.12.0
