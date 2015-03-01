From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] of: Fix premature bootconsole disable with 'stdout-path'
Date: Sun,  1 Mar 2015 12:21:22 -0500
Message-ID: <1425230482-6423-1-git-send-email-peter@hurleysoftware.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Support for devicetree serial consoles via 'stdout-path' causes
bootconsoles to be disabled when the vt dummy console loads, since
there is no preferred console (the preferred console is not added
until the device is probed).

Ensure there is at least a preferred console, even if never matched.

Requires: "console: Fix console name size mismatch"
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Signed-off-by: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
---
 drivers/of/base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 36536b6..83dc8a6 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1885,8 +1885,10 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
 			name = of_get_property(of_chosen, "linux,stdout-path", NULL);
 		if (IS_ENABLED(CONFIG_PPC) && !name)
 			name = of_get_property(of_aliases, "stdout", NULL);
-		if (name)
+		if (name) {
 			of_stdout = of_find_node_opts_by_path(name, &of_stdout_options);
+			add_preferred_console("stdout-path", 0, NULL);
+		}
 	}
 
 	if (!of_aliases)
-- 
2.3.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
