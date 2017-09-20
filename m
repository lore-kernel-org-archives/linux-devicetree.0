From: Dave Stevenson <dave.stevenson-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: [PATCH v3 1/4] [media] v4l2-common: Add helper function for fourcc to string
Date: Wed, 20 Sep 2017 17:07:54 +0100
Message-ID: <e6dfbe4afd3f1db4c3f8a81c0813dc418896f5e1.1505916622.git.dave.stevenson@raspberrypi.org>
References: <cover.1505916622.git.dave.stevenson@raspberrypi.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1505916622.git.dave.stevenson-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
In-Reply-To: <cover.1505916622.git.dave.stevenson-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
References: <cover.1505916622.git.dave.stevenson-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Dave Stevenson <dave.stevenson-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
List-Id: devicetree@vger.kernel.org

New helper function char *v4l2_fourcc2s(u32 fourcc, char *buf)
that converts a fourcc into a nice printable version.

Signed-off-by: Dave Stevenson <dave.stevenson-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
---

No changes from v2 to v3

 drivers/media/v4l2-core/v4l2-common.c | 18 ++++++++++++++++++
 include/media/v4l2-common.h           |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index a5ea1f5..0219895 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -405,3 +405,21 @@ void v4l2_get_timestamp(struct timeval *tv)
 	tv->tv_usec = ts.tv_nsec / NSEC_PER_USEC;
 }
 EXPORT_SYMBOL_GPL(v4l2_get_timestamp);
+
+char *v4l2_fourcc2s(u32 fourcc, char *buf)
+{
+	buf[0] = fourcc & 0x7f;
+	buf[1] = (fourcc >> 8) & 0x7f;
+	buf[2] = (fourcc >> 16) & 0x7f;
+	buf[3] = (fourcc >> 24) & 0x7f;
+	if (fourcc & (1 << 31)) {
+		buf[4] = '-';
+		buf[5] = 'B';
+		buf[6] = 'E';
+		buf[7] = '\0';
+	} else {
+		buf[4] = '\0';
+	}
+	return buf;
+}
+EXPORT_SYMBOL_GPL(v4l2_fourcc2s);
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index aac8b7b..5b0fff9 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -264,4 +264,7 @@ const struct v4l2_frmsize_discrete *v4l2_find_nearest_format(
 
 void v4l2_get_timestamp(struct timeval *tv);
 
+#define V4L2_FOURCC_MAX_SIZE 8
+char *v4l2_fourcc2s(u32 fourcc, char *buf);
+
 #endif /* V4L2_COMMON_H_ */
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
