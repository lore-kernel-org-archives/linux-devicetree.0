From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 03/13] RTC: ds1307: Add DS1341 specific
 power-saving options
Date: Tue, 14 Jun 2016 22:59:29 -0700
Message-ID: <1465970379-14703-4-git-send-email-andrew.smirnov@gmail.com>
References: <1465970379-14703-1-git-send-email-andrew.smirnov@gmail.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDKOBWPM5ABRB2G5QO5QKGQEBXYN52Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1465970379-14703-1-git-send-email-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DS1341 specific power-saving options that allow to disable certain
functional aspects of the chip in order to minimize its power
consumption.

Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/rtc/dallas,ds1341.txt      | 23 ++++++++++++++++++
 drivers/rtc/rtc-ds1307.c                           | 28 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/dallas,ds1341.txt

diff --git a/Documentation/devicetree/bindings/rtc/dallas,ds1341.txt b/Documentation/devicetree/bindings/rtc/dallas,ds1341.txt
new file mode 100644
index 0000000..b8be7a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/dallas,ds1341.txt
@@ -0,0 +1,23 @@
+* Dallas DS1341		I2C Serial Real-Time Clock
+
+Required properties:
+
+- compatible: Should contain "dallas,ds1341".
+
+- reg: I2C address for chip
+
+Optional properties:
+
+- disable-oscillator-stop-flag : Configure chip to disable oscillator
+  fault detection circuitry
+
+- enable-glitch-filter : Configure chip to enable crystal oscillator
+  output glitch filtering
+
+Example:
+	ds1341: rtc@68 {
+		compatible = "dallas,ds1341";
+		disable-oscillator-stop-flag;
+		enable-glitch-filter;
+		reg = <0x68>;
+	};
diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index c618c22..54cc527 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -78,6 +78,7 @@ enum ds_type {
 #define DS1337_REG_CONTROL	0x0e
 #	define DS1337_BIT_nEOSC		0x80
 #	define DS1339_BIT_BBSQI		0x20
+#	define DS1341_BIT_EGFIL		0x20
 #	define DS3231_BIT_BBSQW		0x40 /* same as BBSQI */
 #	define DS1337_BIT_RS2		0x10
 #	define DS1337_BIT_RS1		0x08
@@ -93,7 +94,9 @@ enum ds_type {
 #	define DS1340_BIT_OSF		0x80
 #define DS1337_REG_STATUS	0x0f
 #	define DS1337_BIT_OSF		0x80
+#	define DS1341_BIT_DOSF		0x40
 #	define DS3231_BIT_EN32KHZ	0x08
+#	define DS1341_BIT_ECLK		0x04
 #	define DS1337_BIT_A2I		0x02
 #	define DS1337_BIT_A1I		0x01
 #define DS1339_REG_ALARM1_SECS	0x07
@@ -1319,6 +1322,31 @@ static int ds1307_probe(struct i2c_client *client,
 		if (ds1307->regs[0] & DS1337_BIT_nEOSC)
 			ds1307->regs[0] &= ~DS1337_BIT_nEOSC;
 
+		if (ds1307->type == ds_1341) {
+			/* Make sure we are not generating square wave
+			 * output */
+			ds1307->regs[1] &= ~DS1341_BIT_ECLK;
+
+			if (of_property_read_bool(client->dev.of_node,
+						  "disable-oscillator-stop-flag"))
+				ds1307->regs[1] |= DS1341_BIT_DOSF;
+			else
+				ds1307->regs[1] &= ~DS1341_BIT_DOSF;
+
+			if (of_property_read_bool(client->dev.of_node,
+						  "enable-glitch-filter"))
+				ds1307->regs[0] |= DS1341_BIT_EGFIL;
+			else
+				ds1307->regs[0] &= ~DS1341_BIT_EGFIL;
+
+			/*
+			 * Write status register. Control register
+			 * would be set by the code below
+			 */
+			i2c_smbus_write_byte_data(client, DS1337_REG_STATUS,
+						  ds1307->regs[1]);
+		}
+
 		/*
 		 * Disable the square wave and both alarms.
 		 * For some variants, be sure alarms can trigger when we're
-- 
2.5.5

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
