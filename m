From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/2] of: base: use of_property_read_string()
Date: Sun, 23 Jul 2017 19:55:48 +0300
Message-ID: <20170723165748.078949611@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=of-base-use-of_property_read_string.patch
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

of_alias_scan() can use of_property_read_string() -- using the modern DT API
adds some prop sanity checks as a bonus; it does add couple LoCs but only
because the original code violated the 80-column limit...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 drivers/of/base.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

Index: linux/drivers/of/base.c
===================================================================
--- linux.orig/drivers/of/base.c
+++ linux/drivers/of/base.c
@@ -1662,11 +1662,13 @@ void of_alias_scan(void * (*dt_alloc)(u6
 
 	if (of_chosen) {
 		/* linux,stdout-path and /aliases/stdout are for legacy compatibility */
-		const char *name = of_get_property(of_chosen, "stdout-path", NULL);
-		if (!name)
-			name = of_get_property(of_chosen, "linux,stdout-path", NULL);
+		const char *name = NULL;
+
+		if (of_property_read_string(of_chosen, "stdout-path", &name))
+			of_property_read_string(of_chosen, "linux,stdout-path",
+						&name);
 		if (IS_ENABLED(CONFIG_PPC) && !name)
-			name = of_get_property(of_aliases, "stdout", NULL);
+			of_property_read_string(of_aliases, "stdout", &name);
 		if (name)
 			of_stdout = of_find_node_opts_by_path(name, &of_stdout_options);
 	}

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
