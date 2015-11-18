From: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/2] devicetree: watchdog: add binding for Sigma Designs SMP8642 watchdog
Date: Wed, 18 Nov 2015 17:55:42 +0000
Message-ID: <1447869343-25168-1-git-send-email-mans@mansr.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds a binding for the watchdog in Sigma Designs SMP8642 and
similar devices.

Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
---
Changes:
- add timeout-sec property
---
 .../devicetree/bindings/watchdog/sigma,smp8642-wdt.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/sigma,smp8642-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/sigma,smp8642-wdt.txt b/Documentation/devicetree/bindings/watchdog/sigma,smp8642-wdt.txt
new file mode 100644
index 0000000..5b7ec2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/sigma,smp8642-wdt.txt
@@ -0,0 +1,18 @@
+Sigma Designs SMP86xx/SMP87xx watchdog
+
+Required properties:
+- compatible: Should be "sigma,smp8642-wdt"
+- reg: Specifies the physical address region
+- clocks: Should be a phandle to the clock
+
+Optional properties:
+- timeout-sec: watchdog timeout in seconds
+
+Example:
+
+watchdog@1fd00 {
+	compatible = "sigma,smp8642-wdt";
+	reg = <0x1fd00 8>;
+	clocks = <&xtal_in_clk>;
+	timeout-sec = <30>;
+};
-- 
2.6.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
