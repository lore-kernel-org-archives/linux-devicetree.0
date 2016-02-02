From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 01/11] MAINTAINERS: Add entry for X-Powers AXP family PMIC drivers
Date: Tue,  2 Feb 2016 18:27:34 +0800
Message-ID: <1454408864-24112-2-git-send-email-wens@csie.org>
References: <1454408864-24112-1-git-send-email-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454408864-24112-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Ramakrishna Pallala <ramakrishna.pallala-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Todd Brandt <todd.e.brandt-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add an entry for X-Powers AXP family PMIC drivers and list myself
as maintainer.

Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Ramakrishna Pallala <ramakrishna.pallala-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Todd Brandt <todd.e.brandt-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f678c37107f5..7ea4e54f566a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11941,6 +11941,12 @@ F:	include/linux/workqueue.h
 F:	kernel/workqueue.c
 F:	Documentation/workqueue.txt
 
+X-POWERS MULTIFUNCTION PMIC DEVICE DRIVERS
+M:	Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
+L:	linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+S:	Maintained
+N:	axp[128]
+
 X.25 NETWORK LAYER
 M:	Andrew Hendry <andrew.hendry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 L:	linux-x25-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
