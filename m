From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 18/39] media: Add userspace header file for i.MX
Date: Mon, 27 Mar 2017 17:40:35 -0700
Message-ID: <1490661656-10318-19-git-send-email-steve_longerbeam@mentor.com>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, linux@armlinux.org.uk, mchehab@kernel.org, hverkuil@xs4all.nl, nick@shmanahar.org, markus.heiser@darmarIT.de, p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com, bparrot@ti.com, geert@linux-m68k.org, arnd@arndb.de, sudipm.mukherjee@gmail.com, minghsiu.tsai@mediatek.com, tiffany.lin@mediatek.com, jean-christophe.trotin@st.com, horms+renesas@verge.net.au, niklas.soderlund+renesas@ragnatech.se, robert.jarzmik@free.fr, songjun.wu@microchip.com, andrew-ct.chen@mediatek.com, gregkh@linuxfoundation.org, shuah@kernel.org, sakari.ailus@linux.intel.com, pavel@ucw.cz
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Steve Longerbeam <steve_longerbeam@mentor.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds a header file for use by userspace programs wanting to interact
with the i.MX media driver. It defines custom events and v4l2 controls for
the i.MX v4l2 subdevices.

Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
---
 include/linux/imx-media.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 include/linux/imx-media.h

diff --git a/include/linux/imx-media.h b/include/linux/imx-media.h
new file mode 100644
index 0000000..267777f
--- /dev/null
+++ b/include/linux/imx-media.h
@@ -0,0 +1,27 @@
+/*
+ * Copyright (c) 2014-2017 Mentor Graphics Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version
+ */
+
+#ifndef __LINUX_IMX_MEDIA_H__
+#define __LINUX_IMX_MEDIA_H__
+
+/*
+ * events from the subdevs
+ */
+#define V4L2_EVENT_IMX_CLASS                V4L2_EVENT_PRIVATE_START
+#define V4L2_EVENT_IMX_FRAME_INTERVAL_ERROR (V4L2_EVENT_IMX_CLASS + 1)
+
+enum imx_ctrl_id {
+	V4L2_CID_IMX_FIM_ENABLE = (V4L2_CID_USER_IMX_BASE + 0),
+	V4L2_CID_IMX_FIM_NUM,
+	V4L2_CID_IMX_FIM_TOLERANCE_MIN,
+	V4L2_CID_IMX_FIM_TOLERANCE_MAX,
+	V4L2_CID_IMX_FIM_NUM_SKIP,
+};
+
+#endif
-- 
2.7.4
