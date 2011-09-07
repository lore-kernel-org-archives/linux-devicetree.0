From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 1/6] Add utilfdt for common functions
Date: Wed,  7 Sep 2011 12:54:15 -0700
Message-ID: <1315425260-2711-2-git-send-email-sjg@chromium.org>
References: <1315425260-2711-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1315425260-2711-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds a new utility library for performing libfdt operations.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Remove util_decode_key
- Add utilfdt_decode_type to be used by fdtget/put
- Remove limits on device tree binary size

 utilfdt.c |  120 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 utilfdt.h |   58 +++++++++++++++++++++++++++++
 2 files changed, 178 insertions(+), 0 deletions(-)
 create mode 100644 utilfdt.c
 create mode 100644 utilfdt.h

diff --git a/utilfdt.c b/utilfdt.c
new file mode 100644
index 0000000..5c3682e
--- /dev/null
+++ b/utilfdt.c
@@ -0,0 +1,120 @@
+/*
+ * Copyright 2011 The Chromium Authors, All Rights Reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
+ *                                                                   USA
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/stat.h>
+
+#include "libfdt.h"
+#include "utilfdt.h"
+
+char *util_read_fdt(const char *filename)
+{
+	FILE *fp;
+	char *buf = NULL;
+	struct stat stat_buf;
+	off_t size, upto = 0, toread;
+	int err = 0;
+
+	/* Open the file, or stdin, and work out how many bytes to read */
+	if (strcmp(filename, "-") == 0) {
+		fp = stdin;
+		toread = 64 * 1024;	/* Suitable likely maximum */
+	} else {
+		fp = fopen(filename, "rb");
+		if (fp == NULL) {
+			fprintf(stderr, "unable to open '%s'\n", filename);
+			return NULL;
+		}
+		if (fstat(fileno(fp), &stat_buf)) {
+			fprintf(stderr, "couldn't get size of file\n");
+			return NULL;
+		}
+		toread = stat_buf.st_size;
+	}
+
+	/* Loop until we have everything */
+	size = toread;
+	while (!feof(fp)) {
+		buf = realloc(buf, size);
+		if (!buf) {
+			fprintf(stderr, "couldn't allocate %ld byte buffer\n",
+				size);
+			return NULL;
+		}
+
+		upto += fread(buf + upto, 1, toread, fp);
+		if (ferror(fp)) {
+			fprintf(stderr, "file read error\n");
+			err = -1;
+			break;
+		}
+
+		/* Expand the buffer in case we need to read more */
+		size += toread;
+	}
+
+	/* Clean up, returning NULL on error */
+	if (fp != stdin)
+		fclose(fp);
+	if (err) {
+		free(buf);
+		buf = NULL;
+	}
+	return buf;
+}
+
+int util_write_fdt(const char *buf, const char *filename)
+{
+	FILE *fp;
+	size_t size, written;
+
+	if (strcmp(filename, "-") == 0) {
+		fp = stdout;
+	} else {
+		fp = fopen(filename, "wb");
+		if (fp == NULL) {
+			fprintf(stderr, "unable to open %s\n", filename);
+			return -1;
+		}
+	}
+
+	size = fdt_totalsize(buf);
+	written = fwrite(buf, 1, size, fp);
+	if (size != written) {
+		fprintf(stderr, "file write failed\n");
+		return -1;
+	}
+	return 0;
+}
+
+int utilfdt_decode_type(const char *arg, int *type, int *format)
+{
+	const char *s;
+
+	for (s = arg; *s; s++) {
+		if (strchr("iubs", *s))
+			*type = *s;
+		else if (*s == 'x')
+			*format = *s;
+		else
+			return -1;
+	}
+	return 0;
+}
diff --git a/utilfdt.h b/utilfdt.h
new file mode 100644
index 0000000..7c2828a
--- /dev/null
+++ b/utilfdt.h
@@ -0,0 +1,58 @@
+#ifndef _UTILFDT_H
+#define _UTILFDT_H
+
+/*
+ * Copyright 2011 The Chromium Authors, All Rights Reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
+ *                                                                   USA
+ */
+
+/**
+ * Read a device tree file into a buffer.
+ *
+ * @param filename	The filename to read, or - for stdin
+ * @return		Poiner to allocated buffer containing fdt, or NULL
+ *			on error
+ */
+char *util_read_fdt(const char *filename);
+
+/**
+ * Write a device tree buffer to a file.
+ *
+ * @param filename	The filename to write, or - for stdout
+ * @param buf		Poiner to buffer containing fdt
+ * @return 0 if ok, -1 on error
+ */
+int util_write_fdt(const char *buf, const char *filename);
+
+/**
+ * Decode a data type string.
+ *
+ * The string consists of:
+ *	One optional character (s=string, i=int, u=unsigned b=byte)
+ *	Optional format character (x=hex)
+ *
+ * If either of type or format is not found, then that variable is not
+ * updated, and the caller's default will be used.
+ *
+ * @param arg		Argument string to process
+ * @param type		Returns type found, if any
+ * @param format	Returns format fonud, if any
+ * @return 0 if ok, -1 on error
+ */
+int utilfdt_decode_type(const char *arg, int *type, int *format);
+
+#endif /* _UTILFDT_H */
-- 
1.7.3.1
