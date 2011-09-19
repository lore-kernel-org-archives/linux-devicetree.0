From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [RESEND PATCH v3 2/7] Add utilfdt for common functions
Date: Mon, 19 Sep 2011 13:21:03 -0700
Message-ID: <1316463668-976-3-git-send-email-sjg@chromium.org>
References: <1316463668-976-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1316463668-976-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

This is a separate library from libfdt because it performs OS operations,
like open/close/read/write, while libfdt is OS-neutral. These utility
functions are useful within the dtc package, and could potentially even
be generally useful, but should not be part of libfdt.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Remove util_decode_key
- Add utilfdt_decode_type to be used by fdtget/put
- Remove limits on device tree binary size

Changes in v3:
- Change format of -t argument to be more like printf
- Move utilfdt into its own directory and make it a library
- Use code closer to testutils.c implementation
- Use open/close instead of fopen/fclose

 Makefile                 |   31 ++++++++-
 utilfdt/Makefile.utilfdt |    9 +++
 utilfdt/utilfdt.c        |  167 ++++++++++++++++++++++++++++++++++++++++++++++
 utilfdt/utilfdt.h        |   91 +++++++++++++++++++++++++
 4 files changed, 297 insertions(+), 1 deletions(-)
 create mode 100644 utilfdt/Makefile.utilfdt
 create mode 100644 utilfdt/utilfdt.c
 create mode 100644 utilfdt/utilfdt.h

diff --git a/Makefile b/Makefile
index 380a705..4f5ccdd 100644
--- a/Makefile
+++ b/Makefile
@@ -15,7 +15,7 @@ EXTRAVERSION =
 LOCAL_VERSION =
 CONFIG_LOCALVERSION =
 
-CPPFLAGS = -I libfdt
+CPPFLAGS = -I libfdt -I utilfdt
 WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls
 CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
@@ -151,6 +151,35 @@ ifneq ($(DEPTARGETS),)
 -include $(LIBFDT_OBJS:%.o=$(LIBFDT_objdir)/%.d)
 endif
 
+#
+# Rules for utilfdt
+#
+UTILFDT_objdir = utilfdt
+UTILFDT_srcdir = utilfdt
+UTILFDT_archive = $(UTILFDT_objdir)/libutilfdt.a
+UTILFDT_lib = $(UTILFDT_objdir)/libutilfdt-$(DTC_VERSION).$(SHAREDLIB_EXT)
+UTILFDT_include = $(addprefix $(UTILFDT_srcdir)/,$(UTILFDT_INCLUDES))
+
+include $(UTILFDT_srcdir)/Makefile.utilfdt
+
+.PHONY: utilfdt
+utilfdt: $(UTILFDT_archive) $(UTILFDT_lib)
+
+$(UTILFDT_archive): $(addprefix $(UTILFDT_objdir)/,$(UTILFDT_OBJS))
+$(UTILFDT_lib): $(addprefix $(UTILFDT_objdir)/,$(UTILFDT_OBJS))
+
+utilfdt_clean:
+	@$(VECHO) CLEAN "(utilfdt)"
+	rm -f $(addprefix $(UTILFDT_objdir)/,$(STD_CLEANFILES))
+	rm -f $(UTILFDT_objdir)/*.so
+
+ifneq ($(DEPTARGETS),)
+-include $(UTILFDT_OBJS:%.o=$(UTILFDT_objdir)/%.d)
+endif
+
+# Libraries we need to link our tools with
+ALL_LIBS = $(LIBFDT_archive) $(UTILFDT_archive)
+
 # This stops make from generating the lex and bison output during
 # auto-dependency computation, but throwing them away as an
 # intermediate target and building them again "for real"
diff --git a/utilfdt/Makefile.utilfdt b/utilfdt/Makefile.utilfdt
new file mode 100644
index 0000000..e157ad8
--- /dev/null
+++ b/utilfdt/Makefile.utilfdt
@@ -0,0 +1,9 @@
+# Makefile.utilfdt
+#
+# This is not a complete Makefile of itself.  Instead, it is designed to
+# be easily embeddable into other systems of Makefiles.
+#
+UTILFDT_soname = libutilfdt.$(SHAREDLIB_EXT).1
+UTILFDT_VERSION = version.lds
+UTILFDT_SRCS = utilfdt.c
+UTILFDT_OBJS = $(UTILFDT_SRCS:%.c=%.o)
diff --git a/utilfdt/utilfdt.c b/utilfdt/utilfdt.c
new file mode 100644
index 0000000..9870844
--- /dev/null
+++ b/utilfdt/utilfdt.c
@@ -0,0 +1,167 @@
+/*
+ * Copyright 2011 The Chromium Authors, All Rights Reserved.
+ * Copyright (C) 2006 David Gibson, IBM Corporation.
+ *
+ * Portions inspired by vsprintf.c -- Lars Wirzenius & Linus Torvalds.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+
+#include <errno.h>
+#include <fcntl.h>
+#include <unistd.h>
+
+#include "libfdt.h"
+#include "utilfdt.h"
+
+int utilfdt_read_err(const char *filename, char **buffp)
+{
+	int fd = 0;	/* assume stdin */
+	char *buf = NULL;
+	off_t bufsize = 1024, offset = 0;
+	int ret = 0;
+
+	*buffp = NULL;
+	if (strcmp(filename, "-") != 0) {
+		fd = open(filename, O_RDONLY);
+		if (fd < 0)
+			return errno;
+	}
+
+	/* Loop until we have read everything */
+	buf = malloc(bufsize);
+	do {
+		/* Expand the buffer to hold the next chunk */
+		if (offset == bufsize) {
+			bufsize *= 2;
+			buf = realloc(buf, bufsize);
+			if (!buf) {
+				ret = ENOMEM;
+				break;
+			}
+		}
+
+		ret = read(fd, &buf[offset], bufsize - offset);
+		if (ret < 0) {
+			ret = errno;
+			break;
+		}
+		offset += ret;
+	} while (ret != 0);
+
+	/* Clean up, including closing stdin; return errno on error */
+	close(fd);
+	if (ret)
+		free(buf);
+	else
+		*buffp = buf;
+	return ret;
+}
+
+char *utilfdt_read(const char *filename)
+{
+	char *buff;
+	int ret = utilfdt_read_err(filename, &buff);
+
+	if (ret) {
+		fprintf(stderr, "Couldn't open blob from '%s': %s\n", filename,
+			strerror(ret));
+		return NULL;
+	}
+	/* Successful read */
+	return buff;
+}
+
+int utilfdt_write_err(const char *filename, const void *blob)
+{
+	int fd = 1;	/* assume stdout */
+	int totalsize;
+	int offset;
+	int ret = 0;
+	const char *ptr = blob;
+
+	if (strcmp(filename, "-") != 0) {
+		fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0666);
+		if (fd < 0)
+			return errno;
+	}
+
+	totalsize = fdt_totalsize(blob);
+	offset = 0;
+
+	while (offset < totalsize) {
+		ret = write(fd, ptr + offset, totalsize - offset);
+		if (ret < 0) {
+			ret = -errno;
+			break;
+		}
+		offset += ret;
+	}
+	/* Close the file/stdin; return errno on error */
+	if (fd != 1)
+		close(fd);
+	return ret < 0 ? -ret : 0;
+}
+
+
+int utilfdt_write(const char *filename, const void *blob)
+{
+	int ret = utilfdt_write_err(filename, blob);
+
+	if (ret) {
+		fprintf(stderr, "Couldn't write blob to '%s': %s\n", filename,
+			strerror(ret));
+	}
+	return ret ? -1 : 0;
+}
+
+int utilfdt_decode_type(const char *fmt, int *type, int *size)
+{
+	int qualifier = 0;
+
+	/* get the conversion qualifier */
+	*size = -1;
+	if (strchr("hlLb", *fmt)) {
+		qualifier = *fmt++;
+		if (qualifier == *fmt) {
+			switch (*fmt++) {
+/* TODO:		case 'l': qualifier = 'L'; break;*/
+			case 'h':
+				qualifier = 'b';
+				break;
+			}
+		}
+	}
+
+	/* we should now have a type */
+	if (!strchr("iuxs", *fmt))
+		return -1;
+
+	/* convert qualifier (bhL) to byte size */
+	if (*fmt != 's')
+		*size = qualifier == 'b' ? 1 :
+				qualifier == 'h' ? 2 :
+				qualifier == 'l' ? 4 : -1;
+	*type = *fmt++;
+
+	/* that should be it! */
+	if (*fmt)
+		return -1;
+	return 0;
+}
diff --git a/utilfdt/utilfdt.h b/utilfdt/utilfdt.h
new file mode 100644
index 0000000..fd6dc9d
--- /dev/null
+++ b/utilfdt/utilfdt.h
@@ -0,0 +1,91 @@
+#ifndef _UTILFDT_H
+#define _UTILFDT_H
+
+/*
+ * Copyright 2011 The Chromium Authors, All Rights Reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ */
+
+/**
+ * Read a device tree file into a buffer. This will report any errors on
+ * stderr.
+ *
+ * @param filename	The filename to read, or - for stdin
+ * @return Pointer to allocated buffer containing fdt, or NULL on error
+ */
+char *utilfdt_read(const char *filename);
+
+/**
+ * Read a device tree file into a buffer. Does not report errors, but only
+ * returns them. The value returned can be passed to strerror() to obtain
+ * an error message for the user.
+ *
+ * @param filename	The filename to read, or - for stdin
+ * @param buffp		Returns pointer to buffer containing fdt
+ * @return 0 if ok, else an errno value representing the error
+ */
+int utilfdt_read_err(const char *filename, char **buffp);
+
+
+/**
+ * Write a device tree buffer to a file. This will report any errors on
+ * stderr.
+ *
+ * @param filename	The filename to write, or - for stdout
+ * @param blob		Poiner to buffer containing fdt
+ * @return 0 if ok, -1 on error
+ */
+int utilfdt_write(const char *filename, const void *blob);
+
+/**
+ * Write a device tree buffer to a file. Does not report errors, but only
+ * returns them. The value returned can be passed to strerror() to obtain
+ * an error message for the user.
+ *
+ * @param filename	The filename to write, or - for stdout
+ * @param blob		Poiner to buffer containing fdt
+ * @return 0 if ok, else an errno value representing the error
+ */
+int utilfdt_write_err(const char *filename, const void *blob);
+
+
+/**
+ * Decode a data type string. The purpose of this string
+ *
+ * The string consists of an optional character followed by the type:
+ *	Modifier characters:
+ *		hh or b	1 byte
+ *		h	2 byte
+ *		l	4 byte, default
+ *
+ *	Type character:
+ *		s	string
+ *		i	signed integer
+ *		u	unsigned integer
+ *		x	hex
+ *
+ * TODO: Implement ll modifier (8 bytes)
+ * TODO: Implement o type (octal)
+ *
+ * @param fmt		Format string to process
+ * @param type		Returns type found(s/d/u/x), or 0 if none
+ * @param size		Returns size found(1,2,4,8) or 4 if none
+ * @return 0 if ok, -1 on error (no type given, or other invalid format)
+ */
+int utilfdt_decode_type(const char *fmt, int *type, int *size);
+
+#endif /* _UTILFDT_H */
-- 
1.7.3.1
