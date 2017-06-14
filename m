From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] fdt: Allow stacked overlays phandle references
Date: Wed, 14 Jun 2017 17:52:25 +0300
Message-ID: <1497451946-15443-2-git-send-email-pantelis.antoniou@konsulko.com>
References: <1497451946-15443-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497451946-15443-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch enables an overlay to refer to a previous overlay's
labels by performing a merge of symbol information at application
time.

In a nutshell it allows an overlay to refer to a symbol that a previous
overlay has defined. It requires both the base and all the overlays
to be compiled with the -@ command line switch so that symbol
information is included.

base.dts
--------

	/dts-v1/;
	/ {
		foo: foonode {
			foo-property;
		};
	};

	$ dtc -@ -I dts -O dtb -o base.dtb base.dts

bar.dts
-------

	/dts-v1/;
	/plugin/;
	/ {
		fragment@1 {
			target = <&foo>;
			__overlay__ {
				overlay-1-property;
				bar: barnode {
					bar-property;
				};
			};
		};
	};

	$ dtc -@ -I dts -O dtb -o bar.dtb bar.dts

baz.dts
-------

	/dts-v1/;
	/plugin/;
	/ {
		fragment@1 {
			target = <&bar>;
			__overlay__ {
				overlay-2-property;
				baz: baznode {
					baz-property;
				};
			};
		};
	};

	$ dtc -@ -I dts -O dtb -o baz.dtb baz.dts

Applying the overlays:

	$ fdtoverlay -i base.dtb -o target.dtb bar.dtb baz.dtb

Dumping:

	$ fdtdump target.dtb
	/ {
            foonode {
                overlay-1-property;
                foo-property;
                linux,phandle = <0x00000001>;
                phandle = <0x00000001>;
                barnode {
                    overlay-2-property;
                    phandle = <0x00000002>;
                    linux,phandle = <0x00000002>;
                    bar-property;
                    baznode {
                        phandle = <0x00000003>;
                        linux,phandle = <0x00000003>;
                        baz-property;
                    };
                };
            };
            __symbols__ {
                baz = "/foonode/barnode/baznode";
                bar = "/foonode/barnode";
                foo = "/foonode";
            };
	};

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 .gitignore           |   1 +
 libfdt/fdt_overlay.c | 148 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 545b899..f333c28 100644
--- a/.gitignore
+++ b/.gitignore
@@ -15,3 +15,4 @@ lex.yy.c
 /fdtput
 /patches
 /.pc
+/fdtoverlay
diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index ceb9687..59fd7f3 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -590,7 +590,7 @@ static int overlay_apply_node(void *fdt, int target,
  *
  * overlay_merge() merges an overlay into its base device tree.
  *
- * This is the final step in the device tree overlay application
+ * This is the next to last step in the device tree overlay application
  * process, when all the phandles have been adjusted and resolved and
  * you just have to merge overlay into the base device tree.
  *
@@ -630,6 +630,148 @@ static int overlay_merge(void *fdt, void *fdto)
 	return 0;
 }
 
+/**
+ * overlay_symbol_update - Update the symbols of base tree after a merge
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ *
+ * overlay_symbol_update() updates the symbols of the base tree with the
+ * symbols of the applied overlay
+ *
+ * This is the last step in the device tree overlay application
+ * process, allowing the reference of overlay symbols by subsequent
+ * overlay operations.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_symbol_update(void *fdt, void *fdto)
+{
+	int root_sym, ov_sym, prop, path_len, fragment, target;
+	int len, frag_name_len, ret, rel_path_len;
+	const char *s;
+	const char *path;
+	const char *name;
+	const char *frag_name;
+	const char *rel_path;
+	char *buf = NULL;
+
+	root_sym = fdt_subnode_offset(fdt, 0, "__symbols__");
+	ov_sym = fdt_subnode_offset(fdto, 0, "__symbols__");
+
+	/* if neither exist we can't update symbols, but that's OK */
+	if (root_sym < 0 || ov_sym < 0)
+		return 0;
+
+	buf = malloc(FDT_PATH_MAX);
+	if (!buf)
+		return -FDT_ERR_NOSPACE;
+
+	/* iterate over each overlay symbol */
+	fdt_for_each_property_offset(prop, fdto, ov_sym) {
+
+		path = fdt_getprop_by_offset(fdto, prop, &name, &path_len);
+		if (!path) {
+			ret = path_len;
+			goto out;
+		}
+
+		/* skip autogenerated properties */
+		if (!strcmp(name, "name"))
+			continue;
+
+		/* format: /<fragment-name>/__overlay__/<relative-subnode-path> */
+
+		if (*path != '/') {
+			ret = -FDT_ERR_BADVALUE;
+			goto out;
+		}
+
+		/* get frag name first */
+		s = strchr(path + 1, '/');
+		if (!s) {
+			ret = -FDT_ERR_BADVALUE;
+			goto out;
+		}
+		frag_name = path + 1;
+		frag_name_len = s - path - 1;
+
+		/* verify format */
+		len = strlen("/__overlay__/");
+		if (strncmp(s, "/__overlay__/", len)) {
+			ret = -FDT_ERR_NOTFOUND;
+			goto out;
+		}
+
+		rel_path = s + len;
+		rel_path_len = strlen(rel_path);
+
+		/* find the fragment index in which the symbol lies */
+		fdt_for_each_subnode(fragment, fdto, 0) {
+
+			s = fdt_get_name(fdto, fragment, &len);
+			if (!s)
+				continue;
+
+			/* name must match */
+			if (len == frag_name_len && !memcmp(s, frag_name, len))
+				break;
+		}
+
+		/* not found? */
+		if (fragment < 0) {
+			ret = -FDT_ERR_NOTFOUND;
+			goto out;
+		}
+
+		/* an __overlay__ subnode must exist */
+		ret = fdt_subnode_offset(fdto, fragment, "__overlay__");
+		if (ret < 0)
+			goto out;
+
+		/* get the target of the fragment */
+		ret = overlay_get_target(fdt, fdto, fragment);
+		if (ret < 0)
+			goto out;
+		target = ret;
+
+		/* get the path of the target */
+		ret = fdt_get_path(fdt, target, buf, FDT_PATH_MAX);
+		if (ret < 0)
+			goto out;
+
+		len = strlen(buf);
+
+		/* if the target is root strip leading / */
+		if (len == 1 && buf[0] == '/')
+			len = 0;
+
+		/* make sure we have enough space */
+		if (len + 1 + rel_path_len + 1 > FDT_PATH_MAX) {
+			ret = -FDT_ERR_NOSPACE;
+			goto out;
+		}
+
+		/* create new symbol path in place */
+		buf[len] = '/';
+		memcpy(buf + len + 1, rel_path, rel_path_len);
+		buf[len + 1 + rel_path_len] = '\0';
+
+		ret = fdt_setprop_string(fdt, root_sym, name, buf);
+		if (ret < 0)
+			goto out;
+	}
+
+	ret = 0;
+
+out:
+	if (buf)
+		free(buf);
+
+	return ret;
+}
+
 int fdt_overlay_apply(void *fdt, void *fdto)
 {
 	uint32_t delta = fdt_get_max_phandle(fdt);
@@ -654,6 +796,10 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	if (ret)
 		goto err;
 
+	ret = overlay_symbol_update(fdt, fdto);
+	if (ret)
+		goto err;
+
 	/*
 	 * The overlay has been damaged, erase its magic.
 	 */
-- 
2.1.4
