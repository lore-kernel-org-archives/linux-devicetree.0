From: Daniel Jeong <gshark.jeong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v3 2/2] backlight: device tree: add new tps611xx backlight driver
Date: Tue, 24 Jun 2014 16:18:50 +0900
Message-ID: <1403594330-15387-3-git-send-email-gshark.jeong@gmail.com>
References: <1403594330-15387-1-git-send-email-gshark.jeong@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403594330-15387-1-git-send-email-gshark.jeong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Daniel Jeong <daniel.jeong-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Jeong <gshark.jeong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit is about tps611xx device tree documentation.

Signed-off-by: Daniel Jeong <gshark.jeong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../video/backlight/tps611xx-backlight.txt         |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/backlight/tps611xx-backlight.txt

diff --git a/Documentation/devicetree/bindings/video/backlight/tps611xx-backlight.txt b/Documentation/devicetree/bindings/video/backlight/tps611xx-backlight.txt
new file mode 100644
index 0000000..01f110d
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/backlight/tps611xx-backlight.txt
@@ -0,0 +1,16 @@
+TPS611xx family of backlight driver based on EasyScale.
+
+It supports tps61158, tps61161, tps61163 and tps61165.
+
+Required properties:
+- compatible: "ti,tps61158_bl", "ti,tps61161_bl", "ti,tps61163_bl", "ti,tps61165_bl"
+- rfa_en: enable request for acknowledge. ( 0 : disable , 1 : enable )
+- en_gpio_num: gpio number for en pin.
+
+Example:
+
+	backlight {
+		compatible = "ti,tps61163_bl";
+		rfa_en = <1>;
+		en_gpio_num = <45>;
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
