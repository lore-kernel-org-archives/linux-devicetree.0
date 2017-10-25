From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v9 5/5] dt-bindings: watchdog: Add bindings for RAVE SP watchdog driver
Date: Wed, 25 Oct 2017 12:04:21 -0700
Message-ID: <20171025190421.18415-6-andrew.smirnov@gmail.com>
References: <20171025190421.18415-1-andrew.smirnov@gmail.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171025190421.18415-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add Device Tree bindings for RAVE SP watchdog drvier - an MFD cell of
parent RAVE SP driver (documented in
Documentation/devicetree/bindings/mfd/zii,rave-sp.txt).

Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../bindings/watchdog/zii,rave-sp-wdt.txt          | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.txt b/Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.txt
new file mode 100644
index 000000000000..ab16659e781d
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.txt
@@ -0,0 +1,39 @@
+Zodiac Inflight Innovations RAVE Supervisory Processor Watchdog Bindings
+
+RAVE SP watchdog device is a "MFD cell" device corresponding to
+watchdog functionality of RAVE Supervisory Processor. It is expected
+that its Device Tree node is specified as a child of the node
+corresponding to the parent RAVE SP device (as documented in
+Documentation/devicetree/bindings/mfd/zii,rave-sp.txt)
+
+Required properties:
+- compatible:	Should be "zii,rave-sp-watchdog"
+
+Optional properties:
+
+- wdt-timeout:	Two byte nvmem cell specified as per
+		Documentation/devicetree/bindings/nvmem/nvmem.txt
+
+Example:
+
+	rave-sp {
+		compatible = "zii,rave-sp-rdu1";
+		current-speed = <38400>;
+
+		eeprom {
+			compatible = "zii,pic-main-eeprom";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			wdt_timeout: wdt-timeout@8E {
+				reg = <0x8E 2>;
+			};
+		};
+
+		watchdog {
+			compatible = "zii,rave-sp-watchdog";
+			nvmem-cells = <&wdt_timeout>;
+			nvmem-cell-names = "wdt-timeout";
+		};
+	}
+
-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
