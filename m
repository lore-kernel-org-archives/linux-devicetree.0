From: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 5/7] Adding SKY81452 regulator device tree bindings document
Date: Thu, 28 Aug 2014 19:58:38 +0900
Message-ID: <1409223518-23566-1-git-send-email-jack.yoo@skyworksinc.com>
References: <1409222307-23225-1-git-send-email-jack.yoo@skyworksinc.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409222307-23225-1-git-send-email-jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

v2:
Added 'compatible' attribute in child drivers

---
 .../bindings/regulator/sky81452-regulator.txt          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/sky81452-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/sky81452-regulator.txt b/Documentation/devicetree/bindings/regulator/sky81452-regulator.txt
new file mode 100644
index 0000000..7b9ff18
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/sky81452-regulator.txt
@@ -0,0 +1,18 @@
+SKY81452 voltage regulator
+
+Required properties:
+- compatible	: Must be "skyworks,sky81452-regulator"
+- any required generic properties defined in regulator.txt
+
+Optional properties:
+- any available generic properties defined in regulator.txt
+
+Example:
+
+	regulator {
+		compatible = "skyworks,sky81452-regulator";
+		/* generic regulator properties */
+		regulator-name = "touch_en";
+		regulator-min-microvolt = <4500000>;
+		regulator-max-microvolt = <8000000>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
