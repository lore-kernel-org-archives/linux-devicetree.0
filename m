From: Jandy Gou <qingsong.gou-iOBi6ErZv8IxpvK4C0GaPQ@public.gmane.org>
Subject: [PATCH 2/2] iio: magnetometer: mmc35240: Add DT binding doc
Date: Fri, 17 Jul 2015 16:34:36 +0800
Message-ID: <1437122076-29816-3-git-send-email-qingsong.gou@ck-telecom.com>
References: <1437122076-29816-1-git-send-email-qingsong.gou@ck-telecom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437122076-29816-1-git-send-email-qingsong.gou-iOBi6ErZv8IxpvK4C0GaPQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, viorel.suman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jandy Gou <qingsong.gou-iOBi6ErZv8IxpvK4C0GaPQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jandy Gou <qingsong.gou-iOBi6ErZv8IxpvK4C0GaPQ@public.gmane.org>
---
 .../devicetree/bindings/iio/magnetometer/mmc35240.txt       | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/mmc35240.txt

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/mmc35240.txt b/Documentation/devicetree/bindings/iio/magnetometer/mmc35240.txt
new file mode 100644
index 0000000..a01235c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/mmc35240.txt
@@ -0,0 +1,13 @@
+* MEMSIC MMC35240 magnetometer sensor
+
+Required properties:
+
+  - compatible : should be "memsic,mmc35240"
+  - reg : the I2C address of the magnetometer
+
+Example:
+
+mmc35240@30 {
+        compatible = "memsic,mmc35240";
+        reg = <0x30>;
+};
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
