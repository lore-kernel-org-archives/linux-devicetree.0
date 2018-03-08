From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: backlight: Add binding for RAVE SP backlight driver
Date: Thu,  8 Mar 2018 11:20:46 -0800
Message-ID: <20180308192046.27670-2-andrew.smirnov@gmail.com>
References: <20180308192046.27670-1-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308192046.27670-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Aleksander Morgado <aleksander@aleksander.es>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add Device Tree bindings for RAVE SP backlight driver - an MFD cell of
parent RAVE SP driver (documented in
Documentation/devicetree/bindings/mfd/zii,rave-sp.txt).

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: linux-kernel@vger.kernel.org
Cc: Chris Healy <cphealy@gmail.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Aleksander Morgado <aleksander@aleksander.es>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Changes since [v1]:

 - Fixed typos in commit message and incorrect node name in example section

[v1] https://lkml.kernel.org/r/20180307024011.25033-2-andrew.smirnov@gmail.com

 .../leds/backlight/zii,rave-sp-backlight.txt       | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt

diff --git a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt
new file mode 100644
index 000000000000..ff5c92138650
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt
@@ -0,0 +1,23 @@
+Zodiac Inflight Innovations RAVE Supervisory Processor Backlight Bindings
+
+RAVE SP backlight device is a "MFD cell" device corresponding to
+backlight functionality of RAVE Supervisory Processor. It is expected
+that its Device Tree node is specified as a child of the node
+corresponding to the parent RAVE SP device (as documented in
+Documentation/devicetree/bindings/mfd/zii,rave-sp.txt)
+
+Required properties:
+
+- compatible: Should be "zii,rave-sp-backlight"
+
+Example:
+
+	rave-sp {
+		compatible = "zii,rave-sp-rdu1";
+		current-speed = <38400>;
+
+		backlight {
+			compatible = "zii,rave-sp-backlight";
+		};
+	}
+
-- 
2.14.3
