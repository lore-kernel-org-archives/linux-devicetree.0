From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCHv2 2/2] Documentation: DT: Document rx51-battery binding
Date: Sat,  1 Mar 2014 21:22:45 +0100
Message-ID: <1393705366-32420-3-git-send-email-sre@debian.org>
References: <1393375569-21751-1-git-send-email-sre@debian.org>
 <1393705366-32420-1-git-send-email-sre@debian.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393705366-32420-1-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add devicetree binding documentation for rx51-battery,
which is a simple A/D converter consumer.

Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/power/rx51-battery.txt     | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/rx51-battery.txt

diff --git a/Documentation/devicetree/bindings/power/rx51-battery.txt b/Documentation/devicetree/bindings/power/rx51-battery.txt
new file mode 100644
index 0000000..9043845
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/rx51-battery.txt
@@ -0,0 +1,25 @@
+Binding for Nokia N900 battery
+
+The Nokia N900 battery status can be read via the TWL4030's A/D converter.
+
+Required properties:
+- compatible: Should contain one of the following:
+ * "nokia,n900-battery"
+- io-channels: Should contain IIO channel specifiers
+               for each element in io-channel-names.
+- io-channel-names: Should contain the following values:
+ * "temp" - The ADC channel for temperature reading
+ * "bsi"  - The ADC channel for battery size identification
+ * "vbat" - The ADC channel to measure the battery voltage
+
+Example from Nokia N900:
+
+battery: n900-battery {
+	compatible = "nokia,n900-battery";
+	io-channels = <&twl4030_madc 0>,
+		      <&twl4030_madc 4>,
+		      <&twl4030_madc 12>;
+	io-channel-names = "temp",
+			   "bsi",
+			   "vbat";
+};
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
