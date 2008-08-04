From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: [RFC] add alias support to fdt_path_offset
Date: Mon, 4 Aug 2008 17:25:17 -0500 (CDT)
Message-ID: <Pine.LNX.4.64.0808041722001.328@blarg.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: gvb.uboot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Here's my attempt at adding alias support to fdt_path_offset()

I don't care for the path_buf[256], but not sure how else to do that.

(this is based on discussion on the u-boot list).

- k

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 69af7bb..1cc5bc6 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -135,8 +135,37 @@ int fdt_path_offset(const void *fdt, const char *path)

 	CHECK_HEADER(fdt);

-	if (*path != '/')
-		return -FDT_ERR_BADPATH;
+	/* see if we have an alias */
+	if (*path != '/') {
+		int i = 0, aliasoffset = fdt_path_offset(fdt, "/aliases");
+		char path_buf[256];
+		const char *q;
+
+		if (aliasoffset < 0)
+			return -FDT_ERR_BADPATH;
+
+		q = strchr(path, '/');
+		if (!q)
+			q = end;
+
+		while (p != q)
+			path_buf[i++] = *p++;
+		path_buf[i] = '\0';
+
+		p = fdt_getprop(fdt, aliasoffset, path_buf, NULL);
+
+		if (!p)
+			return -FDT_ERR_BADPATH;
+
+		i = 0;
+		while (*p)
+			path_buf[i++] = *p++;
+		while (*q)
+			path_buf[i++] = *q++;
+		path_buf[i] = '\0';
+
+		return fdt_path_offset(fdt, path_buf);
+	}

 	while (*p) {
 		const char *q;
