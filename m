From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: [RFC PATCH v2 09/15] tracing: of: Add trace event settings
Date: Mon, 15 Jul 2019 14:12:45 +0900
Message-ID: <156316756493.23477.857559505771671133.stgit@devnote2>
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

Add per-event settings, which includes filter and actions.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
  Changes in v2:
   - Make event node available only if CONFIG_EVENT_TRACING=y
---
 kernel/trace/trace_events_trigger.c |    2 -
 kernel/trace/trace_of.c             |   82 +++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events_trigger.c b/kernel/trace/trace_events_trigger.c
index 2a2912cb4533..74a19c18219f 100644
--- a/kernel/trace/trace_events_trigger.c
+++ b/kernel/trace/trace_events_trigger.c
@@ -208,7 +208,7 @@ static int event_trigger_regex_open(struct inode *inode, struct file *file)
 	return ret;
 }
 
-static int trigger_process_regex(struct trace_event_file *file, char *buff)
+int trigger_process_regex(struct trace_event_file *file, char *buff)
 {
 	char *command, *next = buff;
 	struct event_command *p;
diff --git a/kernel/trace/trace_of.c b/kernel/trace/trace_of.c
index 5e108a1d5bb3..3719f711144a 100644
--- a/kernel/trace/trace_of.c
+++ b/kernel/trace/trace_of.c
@@ -81,6 +81,7 @@ trace_of_set_ftrace_options(struct trace_array *tr, struct device_node *node)
 
 #ifdef CONFIG_EVENT_TRACING
 extern int ftrace_set_clr_event(struct trace_array *tr, char *buf, int set);
+extern int trigger_process_regex(struct trace_event_file *file, char *buff);
 
 static void __init
 trace_of_enable_events(struct trace_array *tr, struct device_node *node)
@@ -99,8 +100,88 @@ trace_of_enable_events(struct trace_array *tr, struct device_node *node)
 			pr_err("Failed to enable event: %s\n", p);
 	}
 }
+
+static void __init
+trace_of_init_one_event(struct trace_array *tr, struct device_node *node)
+{
+	struct trace_event_file *file;
+	struct property *prop;
+	char buf[MAX_BUF_LEN];
+	char *bufp;
+	const char *p;
+	int err;
+
+	if (!of_node_name_prefix(node, "event"))
+		return;
+
+	err = of_property_read_string(node, "event", &p);
+	if (err) {
+		pr_err("Failed to find event on %s\n", of_node_full_name(node));
+		return;
+	}
+
+	err = strlcpy(buf, p, ARRAY_SIZE(buf));
+	if (err >= ARRAY_SIZE(buf)) {
+		pr_err("Event name is too long: %s\n", p);
+		return;
+	}
+	bufp = buf;
+
+	p = strsep(&bufp, ":");
+	if (!bufp) {
+		pr_err("%s has no group name\n", buf);
+		return;
+	}
+
+	mutex_lock(&event_mutex);
+	file = find_event_file(tr, buf, bufp);
+	if (!file) {
+		pr_err("Failed to find event: %s\n", buf);
+		return;
+	}
+
+	err = of_property_read_string(node, "filter", &p);
+	if (!err) {
+		if (strlcpy(buf, p, ARRAY_SIZE(buf)) >= ARRAY_SIZE(buf)) {
+			pr_err("filter string is too long: %s\n", p);
+			return;
+		}
+
+		if (apply_event_filter(file, buf) < 0) {
+			pr_err("Failed to apply filter: %s\n", buf);
+			return;
+		}
+	}
+
+	of_property_for_each_string(node, "actions", prop, p) {
+		if (strlcpy(buf, p, ARRAY_SIZE(buf)) >= ARRAY_SIZE(buf)) {
+			pr_err("action string is too long: %s\n", p);
+			continue;
+		}
+
+		if (trigger_process_regex(file, buf) < 0)
+			pr_err("Failed to apply an action: %s\n", buf);
+	}
+
+	if (of_property_read_bool(node, "enable")) {
+		if (trace_event_enable_disable(file, 1, 0) < 0)
+			pr_err("Failed to enable event node: %s\n",
+				of_node_full_name(node));
+	}
+	mutex_unlock(&event_mutex);
+}
+
+static void __init
+trace_of_init_events(struct trace_array *tr, struct device_node *node)
+{
+	struct device_node *enode;
+
+	for_each_child_of_node(node, enode)
+		trace_of_init_one_event(tr, enode);
+}
 #else
 #define trace_of_enable_events(tr, node) do {} while (0)
+#define trace_of_init_events(tr, node) do {} while (0)
 #endif
 
 static void __init
@@ -139,6 +220,7 @@ static int __init trace_of_init(void)
 		goto end;
 
 	trace_of_set_ftrace_options(tr, trace_node);
+	trace_of_init_events(tr, trace_node);
 	trace_of_enable_events(tr, trace_node);
 	trace_of_enable_tracer(tr, trace_node);
 
