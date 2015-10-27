From: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] devicetree: watchdog: add binding for Sigma Designs SMP8642 watchdog
Date: Tue, 27 Oct 2015 18:34:20 +0000
Message-ID: <1445970861-19832-1-git-send-email-mans@mansr.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: slash.tmp-GANU6spQydw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds a binding for the watchdog in Sigma Designs SMP8642 and
similar devices.

Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/watchdog/sigma,8642-wdt.txt        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/sigma,8642-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/sigma,8642-wdt.txt b/Documentation/devicetree/bindings/watchdog/sigma,8642-wdt.txt
new file mode 100644
index 0000000..31fef37
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/sigma,8642-wdt.txt
@@ -0,0 +1,14 @@
+Sigma Designs SMP86xx watchdog
+
+Required properties:
+- compatible: Should be "sigma,smp8642-wdt"
+- reg: Specifies the physical address region
+- clocks: Should be a phandle to the clock
+
+Example:
+
+watchdog@1fd00 {
+	compatible = "sigma,smp8642-wdt";
+	reg = <0x1fd00 8>;
+	clocks = <&xtal_in_clk>;
+};
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
