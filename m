From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 08/10] lib/vsprintf: OF nodes are first and foremost, struct device_nodes
Date: Thu, 29 Aug 2019 13:10:41 +0300
Message-ID: <20190829101043.24963-9-sakari.ailus@linux.intel.com>
References: <20190829101043.24963-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829101043.24963-1-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Factor out static kobject_string() function that simply calls
device_node_string(), and thus remove references to kobjects (as these are
struct device_node).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 lib/vsprintf.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index a04a2167101ef..19f9b3f30623e 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1905,7 +1905,7 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
 	struct printf_spec str_spec = spec;
 	str_spec.field_width = -1;
 
-	if (!IS_ENABLED(CONFIG_OF))
+	if (!IS_ENABLED(CONFIG_OF) || fmt[0] != 'F')
 		return error_string(buf, end, "(%pOF?)", spec);
 
 	if (check_pointer(&buf, end, dn, spec))
@@ -1978,17 +1978,6 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
 	return widen_string(buf, buf - buf_start, end, spec);
 }
 
-static char *kobject_string(char *buf, char *end, void *ptr,
-			    struct printf_spec spec, const char *fmt)
-{
-	switch (fmt[1]) {
-	case 'F':
-		return device_node_string(buf, end, ptr, spec, fmt + 1);
-	}
-
-	return error_string(buf, end, "(%pO?)", spec);
-}
-
 /*
  * Show a '%p' thing.  A kernel extension is that the '%p' is followed
  * by an extra set of alphanumeric characters that are extended format
@@ -2167,7 +2156,7 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 	case 'G':
 		return flags_string(buf, end, ptr, spec, fmt);
 	case 'O':
-		return kobject_string(buf, end, ptr, spec, fmt);
+		return device_node_string(buf, end, ptr, spec, fmt + 1);
 	case 'x':
 		return pointer_string(buf, end, ptr, spec);
 	}
-- 
2.20.1
