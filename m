From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] of: Provide dummy of_device_compatible_match() for compile-testing
Date: Tue, 25 Apr 2017 19:38:48 +0200
Message-ID: <1493141928-29251-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Most of_device_*() functions have dummy versions for CONFIG_OF=n,
but of_device_compatible_match() hasn't.  Fix that to improve the
ability to do compile-testing.

Fixes: b9c13fe32faaa71c ("dt: Add of_device_compatible_match()")
Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 include/linux/of.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 21e6323de0f3b786..bfd1a23221735161 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -620,6 +620,12 @@ static inline int of_device_is_compatible(const struct device_node *device,
 	return 0;
 }
 
+static inline  int of_device_compatible_match(struct device_node *device,
+					      const char *const *compat)
+{
+	return 0;
+}
+
 static inline bool of_device_is_available(const struct device_node *device)
 {
 	return false;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
