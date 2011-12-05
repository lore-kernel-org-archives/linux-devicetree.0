From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: libfdt: Add support for appending the values to a existing property
Date: Mon, 5 Dec 2011 12:22:07 +1100
Message-ID: <20111205012207.GA3734@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Some properties may contain multiple values, these values may need
to be added to the property respectively. this patch provides this
functionality. The main purpose of fdt_append_prop() is to append
the values to a existing property, or create a new property if it
dose not exist.

Signed-off-by: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
--- 

Jon,

Minghuan Lian sent this to the list ages ago, but it got stuck for
months in a mailing list mishap.  It more recently resurfaced, I made
some small cleanups and added testcases.  Please apply.

Index: dtc/libfdt/fdt_rw.c
===================================================================
--- dtc.orig/libfdt/fdt_rw.c	2011-12-05 12:07:05.062666709 +1100
+++ dtc/libfdt/fdt_rw.c	2011-12-05 12:07:46.842873888 +1100
@@ -289,6 +289,33 @@ int fdt_setprop(void *fdt, int nodeoffse
 	return 0;
 }
 
+int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
+		   const void *val, int len)
+{
+	struct fdt_property *prop;
+	int err, oldlen, newlen;
+
+	FDT_RW_CHECK_HEADER(fdt);
+
+	prop = fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
+	if (prop) {
+		newlen = len + oldlen;
+		err = _fdt_splice_struct(fdt, prop->data,
+					 FDT_TAGALIGN(oldlen),
+					 FDT_TAGALIGN(newlen));
+		if (err)
+			return err;
+		prop->len = cpu_to_fdt32(newlen);
+		memcpy(prop->data + oldlen, val, len);
+	} else {
+		err = _fdt_add_property(fdt, nodeoffset, name, len, &prop);
+		if (err)
+			return err;
+		memcpy(prop->data, val, len);
+	}
+	return 0;
+}
+
 int fdt_delprop(void *fdt, int nodeoffset, const char *name)
 {
 	struct fdt_property *prop;
Index: dtc/libfdt/libfdt.h
===================================================================
--- dtc.orig/libfdt/libfdt.h	2011-12-05 12:07:05.074666771 +1100
+++ dtc/libfdt/libfdt.h	2011-12-05 12:07:46.846873909 +1100
@@ -1134,6 +1134,101 @@ static inline int fdt_setprop_cell(void
 	fdt_setprop((fdt), (nodeoffset), (name), (str), strlen(str)+1)
 
 /**
+ * fdt_appendprop - append to or create a property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to append to
+ * @val: pointer to data to append to the property value
+ * @len: length of the data to append to the property value
+ *
+ * fdt_appendprop() appends the value to the named property in the
+ * given node, creating the property if it does not already exist.
+ *
+ * This function may insert data into the blob, and will therefore
+ * change the offsets of some existing nodes.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
+ *		contain the new property value
+ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
+		   const void *val, int len);
+
+/**
+ * fdt_appendprop_cell - append a single cell value to a property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @val: 32-bit integer value to append to the property (native endian)
+ *
+ * fdt_appendprop_cell() appends the given cell value (converting to
+ * big-endian if necessary) to the value of the named property in the
+ * given node, or creates a new property with that value if it does
+ * not already exist.
+ *
+ * This function may insert data into the blob, and will therefore
+ * change the offsets of some existing nodes.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
+ *		contain the new property value
+ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+static inline int fdt_appendprop_cell(void *fdt, int nodeoffset,
+				      const char *name, uint32_t val)
+{
+	val = cpu_to_fdt32(val);
+	return fdt_appendprop(fdt, nodeoffset, name, &val, sizeof(val));
+}
+
+/**
+ * fdt_appendprop_string - append a string to a property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @str: string value to append to the property
+ *
+ * fdt_appendprop_string() appends the given string to the value of
+ * the named property in the given node, or creates a new property
+ * with that value if it does not already exist.
+ *
+ * This function may insert data into the blob, and will therefore
+ * change the offsets of some existing nodes.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
+ *		contain the new property value
+ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+#define fdt_appendprop_string(fdt, nodeoffset, name, str) \
+	fdt_appendprop((fdt), (nodeoffset), (name), (str), strlen(str)+1)
+
+/**
  * fdt_delprop - delete a property
  * @fdt: pointer to the device tree blob
  * @nodeoffset: offset of the node whose property to nop
Index: dtc/tests/appendprop1.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/appendprop1.c	2011-12-05 12:07:46.846873909 +1100
@@ -0,0 +1,70 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for fdt_appendprop()
+ * Copyright (C) 2006 David Gibson, IBM Corporation.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public License
+ * as published by the Free Software Foundation; either version 2.1 of
+ * the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <ctype.h>
+#include <stdint.h>
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+
+#define SPACE		65536
+
+#define CHECK(code) \
+	{ \
+		err = (code); \
+		if (err) \
+			FAIL(#code ": %s", fdt_strerror(err)); \
+	}
+
+int main(int argc, char *argv[])
+{
+	void *fdt;
+	int err;
+	uint8_t bytes[] = {0x00, 0x01, 0x02, 0x03, 0x04};
+
+	test_init(argc, argv);
+
+	/* Create an empty tree first */
+	fdt = xmalloc(SPACE);
+	CHECK(fdt_create(fdt, SPACE));
+	CHECK(fdt_finish_reservemap(fdt));
+	CHECK(fdt_begin_node(fdt, ""));
+	CHECK(fdt_end_node(fdt));
+	CHECK(fdt_finish(fdt));
+
+	/* Now use appendprop to add properties */
+	CHECK(fdt_open_into(fdt, fdt, SPACE));
+
+	CHECK(fdt_appendprop(fdt, 0, "prop-bytes", bytes, sizeof(bytes)));
+	CHECK(fdt_appendprop_cell(fdt, 0, "prop-int", TEST_VALUE_1));
+	CHECK(fdt_appendprop_string(fdt, 0, "prop-str", TEST_STRING_1));
+
+	CHECK(fdt_pack(fdt));
+
+	save_blob("appendprop1.test.dtb", fdt);
+
+	PASS();
+}
Index: dtc/tests/appendprop.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/appendprop.dts	2011-12-05 12:07:46.846873909 +1100
@@ -0,0 +1,7 @@
+/dts-v1/;
+
+/ {
+	prop-str = "hello world", "nastystring: \a\b\t\n\v\f\r\\\"";
+	prop-int = <0xdeadbeef 123456789>;
+	prop-bytes = [00010203040001020304];
+};
Index: dtc/tests/appendprop2.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/appendprop2.c	2011-12-05 12:02:27.941292554 +1100
@@ -0,0 +1,64 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for fdt_appendprop()
+ * Copyright (C) 2006 David Gibson, IBM Corporation.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public License
+ * as published by the Free Software Foundation; either version 2.1 of
+ * the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <ctype.h>
+#include <stdint.h>
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+
+#define SPACE		65536
+
+#define CHECK(code) \
+	{ \
+		err = (code); \
+		if (err) \
+			FAIL(#code ": %s", fdt_strerror(err)); \
+	}
+
+int main(int argc, char *argv[])
+{
+	void *fdt, *buf;
+	int err;
+	uint8_t bytes[] = {0x00, 0x01, 0x02, 0x03, 0x04};
+
+	test_init(argc, argv);
+	fdt = load_blob_arg(argc, argv);
+
+	buf = xmalloc(SPACE);
+	CHECK(fdt_open_into(fdt, buf, SPACE));
+	fdt = buf;
+
+	CHECK(fdt_appendprop(fdt, 0, "prop-bytes", bytes, sizeof(bytes)));
+	CHECK(fdt_appendprop_cell(fdt, 0, "prop-int", TEST_VALUE_2));
+	CHECK(fdt_appendprop_string(fdt, 0, "prop-str", TEST_STRING_2));
+
+	CHECK(fdt_pack(fdt));
+
+	save_blob("appendprop2.test.dtb", fdt);
+
+	PASS();
+}

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
