From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v6 01/12] tools lib traceevent: Convert remaining %p[fF] users to %p[sS]
Date: Tue, 10 Sep 2019 11:46:56 +0300
Message-ID: <20190910084707.18380-2-sakari.ailus@linux.intel.com>
References: <20190910084707.18380-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190910084707.18380-1-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, Tzvetomir Stoyanov <tstoyanov@vmware.com>, linux-trace-devel@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
List-Id: devicetree@vger.kernel.org

There are no in-kernel %p[fF] users left. Convert the traceevent tool,
too, to align with the kernel.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Tzvetomir Stoyanov <tstoyanov@vmware.com>
Cc: linux-trace-devel@vger.kernel.org
Cc: Jiri Olsa <jolsa@redhat.com>
Cc: Namhyung Kim <namhyung@kernel.org>
---
 .../Documentation/libtraceevent-func_apis.txt          | 10 +++++-----
 tools/lib/traceevent/event-parse.c                     |  7 +++----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/tools/lib/traceevent/Documentation/libtraceevent-func_apis.txt b/tools/lib/traceevent/Documentation/libtraceevent-func_apis.txt
index 38bfea30a5f64..f6aca0df2151a 100644
--- a/tools/lib/traceevent/Documentation/libtraceevent-func_apis.txt
+++ b/tools/lib/traceevent/Documentation/libtraceevent-func_apis.txt
@@ -59,12 +59,12 @@ parser context.
 
 The _tep_register_function()_ function registers a function name mapped to an
 address and (optional) module. This mapping is used in case the function tracer
-or events have "%pF" or "%pS" parameter in its format string. It is common to
-pass in the kallsyms function names with their corresponding addresses with this
+or events have "%pS" parameter in its format string. It is common to pass in
+the kallsyms function names with their corresponding addresses with this
 function. The _tep_ argument is the trace event parser context. The _name_ is
-the name of the function, the string is copied internally. The _addr_ is
-the start address of the function. The _mod_ is the kernel module
-the function may be in (NULL for none).
+the name of the function, the string is copied internally. The _addr_ is the
+start address of the function. The _mod_ is the kernel module the function may
+be in (NULL for none).
 
 The _tep_register_print_string()_ function  registers a string by the address
 it was stored in the kernel. Some strings internal to the kernel with static
diff --git a/tools/lib/traceevent/event-parse.c b/tools/lib/traceevent/event-parse.c
index b36b536a9fcba..1d7927ff32660 100644
--- a/tools/lib/traceevent/event-parse.c
+++ b/tools/lib/traceevent/event-parse.c
@@ -4335,8 +4335,6 @@ static struct tep_print_arg *make_bprint_args(char *fmt, void *data, int size, s
 					switch (*ptr) {
 					case 's':
 					case 'S':
-					case 'f':
-					case 'F':
 					case 'x':
 						break;
 					default:
@@ -4455,12 +4453,13 @@ get_bprint_format(void *data, int size __maybe_unused,
 
 	printk = find_printk(tep, addr);
 	if (!printk) {
-		if (asprintf(&format, "%%pf: (NO FORMAT FOUND at %llx)\n", addr) < 0)
+		if (asprintf(&format, "%%ps: (NO FORMAT FOUND at %llx)\n",
+			     addr) < 0)
 			return NULL;
 		return format;
 	}
 
-	if (asprintf(&format, "%s: %s", "%pf", printk->printk) < 0)
+	if (asprintf(&format, "%s: %s", "%ps", printk->printk) < 0)
 		return NULL;
 
 	return format;
-- 
2.20.1
