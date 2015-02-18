From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 2/3] dt: power: Add documentation for NI USRP E3x0 soft-poweroff.
Date: Wed, 18 Feb 2015 10:18:15 -0800
Message-ID: <1424283496-4479-3-git-send-email-moritz.fischer@ettus.com>
References: <1424283496-4479-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424283496-4479-1-git-send-email-moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/power/reset/e3x0-poweroff.txt    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/e3x0-poweroff.txt b/Documentation/devicetree/bindings/power/reset/e3x0-poweroff.txt
new file mode 100644
index 0000000..47896e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/e3x0-poweroff.txt
@@ -0,0 +1,16 @@
+National Instruments Ettus Research USRP E3x0 poweroff driver
+
+This module is part of the NI Ettus Research USRP E3x0 SDR.
+
+Required properties:
+- compatible: should be one of the following
+  - "ettus,e3x0-poweroff": For devices such as the NI Ettus Research USRP E3x0
+- syscon: this is the phandle to the register map node
+
+Note: Addresses may vary depending on the FPGA configuration
+
+Example:
+	poweroff0: poweroff@40300000 {
+		compatible = "ettus,e3x0-poweroff";
+		syscon = <&regmapnode>;
+	};
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
