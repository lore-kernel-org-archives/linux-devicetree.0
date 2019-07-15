From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: [RFC PATCH v2 14/15] tracing: of: Add function tracer filter properties
Date: Mon, 15 Jul 2019 14:13:37 +0900
Message-ID: <156316761767.23477.13784128240295644594.stgit@devnote2>
References: <156316746861.23477.5815110570539190650.stgit@devnote2>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <156316746861.23477.5815110570539190650.stgit@devnote2>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Tim Bird <Tim.Bird@sony.com>
Cc: Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Tom Zanussi <tom.zanussi@linux.intel.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add function tracer filter properties which includes
 - ftrace-filters : string array of filter rules
 - ftrace-notraces : string array of notrace rules
These properties are available on ftrace root node and
instance node.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 kernel/trace/trace_of.c |   36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/kernel/trace/trace_of.c b/kernel/trace/trace_of.c
index 14d6c9a8fd81..1ee6fab918f5 100644
--- a/kernel/trace/trace_of.c
+++ b/kernel/trace/trace_of.c
@@ -322,11 +322,47 @@ trace_of_init_events(struct trace_array *tr, struct device_node *node)
 #define trace_of_init_events(tr, node) do {} while (0)
 #endif
 
+#ifdef CONFIG_FUNCTION_TRACER
+extern bool ftrace_filter_param __initdata;
+extern int ftrace_set_filter(struct ftrace_ops *ops, unsigned char *buf,
+			     int len, int reset);
+extern int ftrace_set_notrace(struct ftrace_ops *ops, unsigned char *buf,
+			     int len, int reset);
+
+static void __init
+trace_of_set_ftrace_filter(struct ftrace_ops *ops, const char *property,
+			   struct device_node *node)
+{
+	struct property *prop;
+	const char *p;
+	char buf[MAX_BUF_LEN];
+	int err;
+
+	of_property_for_each_string(node, property, prop, p) {
+		if (strlcpy(buf, p, ARRAY_SIZE(buf)) >= ARRAY_SIZE(buf)) {
+			pr_err("filter string is too long: %s\n", p);
+			return;
+		}
+		err = ftrace_set_filter(ops, buf, strlen(buf), 0);
+		if (err) {
+			pr_err("Failed to add %s: %s\n", property, buf);
+			return;
+		}
+		ftrace_filter_param = true;
+	}
+}
+#else
+#define trace_of_set_ftrace_filter(ops, prop, node) do {} while (0)
+#endif
+
 static void __init
 trace_of_enable_tracer(struct trace_array *tr, struct device_node *node)
 {
 	const char *p;
 
+	trace_of_set_ftrace_filter(tr->ops, "ftrace-filters", node);
+	trace_of_set_ftrace_filter(tr->ops, "ftrace-notraces", node);
+
 	if (!of_property_read_string(node, "tracer", &p)) {
 		if (tracing_set_tracer(tr, p) < 0)
 			pr_err("Failed to set given tracer: %s\n", p);
