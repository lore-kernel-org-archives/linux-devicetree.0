From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 2/3] doc: dt-binding: generic onboard USB HUB
Date: Tue, 8 Dec 2015 09:37:49 +0800
Message-ID: <1449538670-7954-3-git-send-email-peter.chen@freescale.com>
References: <1449538670-7954-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449538670-7954-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add dt-binding documentation for generic onboard USB HUB.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 .../bindings/usb/generic-onboard-hub.txt           | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/generic-onboard-hub.txt

diff --git a/Documentation/devicetree/bindings/usb/generic-onboard-hub.txt b/Documentation/devicetree/bindings/usb/generic-onboard-hub.txt
new file mode 100644
index 0000000..ea92205
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/generic-onboard-hub.txt
@@ -0,0 +1,28 @@
+Generic Onboard USB HUB
+
+Required properties:
+- compatible: should be "generic-onboard-hub"
+
+Optional properties:
+- clocks: the input clock for HUB.
+
+- clock-names: Should be "external_clk"
+
+- hub-reset-gpios: Should specify the GPIO for reset.
+
+- hub-reset-active-high: the active reset signal is high, if this property is
+  not set, the active reset signal is low.
+
+- hub-reset-duration-us: the duration for assert reset signal, the time unit
+  is microsecond.
+
+Example:
+
+	usb_hub1 {
+		compatible = "generic-onboard-hub";
+		clocks = <&clks IMX6QDL_CLK_CKO>;
+		clock-names = "external_clk";
+		hub-reset-gpios = <&gpio7 12 0>;
+		hub-reset-active-high;
+		hub-reset-duration-us = <2>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
