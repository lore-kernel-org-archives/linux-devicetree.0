From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: [PATCH 1/2] device: Add dev_of_node() accessor
Date: Mon, 16 Feb 2015 14:59:08 +1100
Message-ID: <1424059148.21410.37.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Suggested by Arnd Bergmann, this gives a practical accessor for
the of_node field of struct device while instructing the compiler
that it will be NULL if CONFIG_OF is not set.

Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
---

This is what we discussed back in November and I had forgotten
to finish :)

 include/linux/device.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index fb50673..08128288 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -916,6 +916,13 @@ static inline void device_lock_assert(struct device *dev)
 	lockdep_assert_held(&dev->mutex);
 }
 
+static inline struct device_node *dev_of_node(struct device *dev)
+{
+	if (!IS_ENABLED(CONFIG_OF))
+		return NULL;
+	return dev->of_node;
+}
+
 void driver_init(void);
 
 /*



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
