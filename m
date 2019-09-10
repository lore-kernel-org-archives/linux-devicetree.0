From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v6 10/12] lib/vsprintf: OF nodes are first and foremost, struct device_nodes
Date: Tue, 10 Sep 2019 11:47:05 +0300
Message-ID: <20190910084707.18380-11-sakari.ailus@linux.intel.com>
References: <20190910084707.18380-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190910084707.18380-1-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>
List-Id: devicetree@vger.kernel.org

Factor out static kobject_string() function that simply calls
device_node_string(), and thus remove references to kobjects (as these are
struct device_node).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 lib/vsprintf.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 7a0006e0c3896..9c5b398d4a512 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1906,6 +1906,9 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
 	struct printf_spec str_spec = spec;
 	str_spec.field_width = -1;
 
+	if (fmt[0] != 'F')
+		return error_string(buf, end, "(%pO?)", spec);
+
 	if (!IS_ENABLED(CONFIG_OF))
 		return error_string(buf, end, "(%pOF?)", spec);
 
@@ -1979,17 +1982,6 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
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
@@ -2168,7 +2160,7 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
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
