From: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
Subject: [PATCH 2/2] hwmon: (ltc4151) Add devicetree binding for ltc4151
Date: Mon, 25 Jul 2016 13:56:20 +0200
Message-ID: <20160725115616.GA31557@makrotopia.org>
References: <5795A144.2020300@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5795A144.2020300-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, Per =?iso-8859-1?Q?Dal=E9n?= <per.dalen-US8m9dViuwNWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
---
 Documentation/devicetree/bindings/hwmon/ltc4151.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ltc4151.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ltc4151.txt b/Documentation/devicetree/bindings/hwmon/ltc4151.txt
new file mode 100644
index 0000000..aec69ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ltc4151.txt
@@ -0,0 +1,18 @@
+ltc4151 properties
+
+Required properties:
+- compatible: Must be "lltc,ltc4151"
+- reg: I2C address
+
+Optional properties:
+
+- shunt-resistor
+	Shunt resistor value in micro-Ohm
+
+Example:
+
+ltc4151@6e {
+	compatible = "lltc,ltc4151";
+	reg = <0x6e>;
+	shunt-resistor = <1500>;
+};
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
