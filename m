From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v6 2/2] dt-bindings: mfd: Add bindings for ZII RAVE devices
Date: Mon, 28 Aug 2017 09:31:31 -0700
Message-ID: <20170828163131.24815-3-andrew.smirnov@gmail.com>
References: <20170828163131.24815-1-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170828163131.24815-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, cphealy@gmail.com, Lucas Stach <l.stach@pengutronix.de>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Machek <pavel@ucw.cz>
List-Id: devicetree@vger.kernel.org

Add Device Tree bindings for RAVE Supervisory Processor, an MCU
implementing varoius bits of housekeeping functionality (watchdoging,
backlight control, LED control, etc) on RAVE family of products by
Zodiac Inflight Innovations.

Cc: cphealy@gmail.com
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pavel Machek <pavel@ucw.cz>
Acked-by: Rob Herring <robh+dt@kernel.org>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 .../devicetree/bindings/mfd/zii,rave-sp.txt        | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/zii,rave-sp.txt

diff --git a/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
new file mode 100644
index 000000000000..088eff9ddb78
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
@@ -0,0 +1,39 @@
+Zodiac Inflight Innovations RAVE Supervisory Processor
+
+RAVE Supervisory Processor communicates with SoC over UART. It is
+expected that its Device Tree node is specified as a child of a node
+corresponding to UART controller used for communication.
+
+Required parent device properties:
+
+ - compatible: Should be one of:
+	- "zii,rave-sp-niu"
+	- "zii,rave-sp-mezz"
+	- "zii,rave-sp-esb"
+	- "zii,rave-sp-rdu1"
+	- "zii,rave-sp-rdu2"
+
+ - current-speed: Should be set to baud rate SP device is using
+
+RAVE SP consists of the following sub-devices:
+
+Device				 Description
+------				 -----------
+rave-sp-wdt			: Watchdog
+rave-sp-nvmem			: Interface to onborad EEPROM
+rave-sp-backlight		: Display backlight
+rave-sp-hwmon			: Interface to onboard hardware sensors
+rave-sp-leds			: Interface to onboard LEDs
+rave-sp-input			: Interface to onboard power button
+
+Example of usage:
+
+	rdu {
+		compatible = "zii,rave-sp-rdu2";
+		current-speed = <1000000>;
+
+		watchdog {
+			compatible = "zii,rave-sp-watchdog";
+		};
+	};
+
-- 
2.13.5
