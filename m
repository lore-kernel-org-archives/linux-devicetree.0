From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 2/3] dt-bindings: reset: Add K2G reset definitions
Date: Thu, 27 Oct 2016 16:49:40 -0500
Message-ID: <20161027214941.24641-3-afd@ti.com>
References: <20161027214941.24641-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161027214941.24641-1-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F . Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add identifiers for the K2G resets managed by the PMMC.

Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
---
 MAINTAINERS                     |  1 +
 include/dt-bindings/reset/k2g.h | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 include/dt-bindings/reset/k2g.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d8068df..accf991 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11900,6 +11900,7 @@ F:	Documentation/devicetree/bindings/clock/ti,sci-clk.txt
 F:	include/dt-bindings/clock/k2g.h
 F:	drivers/clk/keystone/sci-clk.c
 F:	Documentation/devicetree/bindings/reset/ti,sci-reset.txt
+F:	include/dt-bindings/reset/k2g.h
 
 THANKO'S RAREMONO AM/FM/SW RADIO RECEIVER USB DRIVER
 M:	Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
diff --git a/include/dt-bindings/reset/k2g.h b/include/dt-bindings/reset/k2g.h
new file mode 100644
index 0000000..00e2a9b
--- /dev/null
+++ b/include/dt-bindings/reset/k2g.h
@@ -0,0 +1,22 @@
+/*
+ * TI K2G SoC reset definitions
+ *
+ * Copyright (C) 2015-2016 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __DT_BINDINGS_RESET_K2G_H__
+#define __DT_BINDINGS_RESET_K2G_H__
+
+#define K2G_DEV_CGEM0_DSP0_RESET	0x1
+
+#endif
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
