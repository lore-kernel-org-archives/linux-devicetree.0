From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/3] jnx: Introduce board_ids.h
Date: Fri,  7 Oct 2016 18:15:25 +0300
Message-ID: <1475853325-21796-4-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853325-21796-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475853325-21796-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Debjit Ghosh <dghosh-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, JawaharBalaji Thirumalaisamy <jawaharb-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Mohammad Kamil <mkamil-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Rajat Jain <rajatjain-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Rajat Jain <rajatjain-3r7Miqu9kMnR7s880joybQ@public.gmane.org>

Introduce header file to contain the Juniper Assembly IDs.

Signed-off-by: Mohammad Kamil <mkamil-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
Signed-off-by: Rajat Jain <rajatjain-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
Signed-off-by: Debjit Ghosh <dghosh-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
Signed-off-by: Guenter Roeck <groeck-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 include/linux/jnx/board_ids.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 include/linux/jnx/board_ids.h

diff --git a/include/linux/jnx/board_ids.h b/include/linux/jnx/board_ids.h
new file mode 100644
index 0000000..74ce25a
--- /dev/null
+++ b/include/linux/jnx/board_ids.h
@@ -0,0 +1,31 @@
+/*
+ * Juniper Assembly ID(s) - for Juniper Boards
+ *
+ * Rajat Jain <rajatjain-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
+ * Copyright (c) 2014 Juniper Networks
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#ifndef __JNX_BOARD_IDS__
+#define __JNX_BOARD_IDS__
+
+#define JNX_ID_SNG_CB		0x09B3	/* Sangria Control Board */
+#define JNX_ID_SNG_PMB		0x09B7	/* Sangria CB/FPC PMB Board */
+#define JNX_ID_SNG_VDV_BASE_P2	0x09BC	/* Sangria Vaudville FPC Base P2 */
+#define JNX_ID_HENDRICKS_FPC_P2	0x0B9B	/* Hendricks FPC (new Serdes added) */
+#define JNX_ID_HENDRICKS_CB	0x0BA8  /* Hendricks Control Board */
+#define JNX_ID_GLD_2T_FPC	0x0BF9	/* Gladiator 2T FPC */
+#define JNX_ID_GLD_3T_FPC	0x0BFA	/* Gladiator 3T FPC */
+#define JNX_ID_POLARIS_RCB	0x0C09	/* Polaris RCB */
+#define JNX_ID_POLARIS_MLC	0x0C0A	/* Polaris Mono Line Card */
+#define JNX_ID_POLARIS_RCB_P2	0x0C51	/* Polaris RCB P2 */
+#define JNX_ID_OMEGA_RCB	0x0C6B	/* Omega RCB */
+
+#endif /* __JNX_BOARD_IDS__ */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
