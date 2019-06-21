From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: [RFC PATCH 10/11] tracing: of: Add kprobe event support
Date: Sat, 22 Jun 2019 01:19:40 +0900
Message-ID: <156113398039.28344.4353616217444927643.stgit@devnote2>
References: <156113387975.28344.16009584175308192243.stgit@devnote2>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <156113387975.28344.16009584175308192243.stgit@devnote2>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add kprobe event support in event node. User can add probe definitions
by "probes" property as a string array.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 kernel/trace/trace_kprobe.c |    5 +++
 kernel/trace/trace_of.c     |   65 ++++++++++++++++++++++++++++++++++++-------
 2 files changed, 60 insertions(+), 10 deletions(-)

diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
index 5166a12a9d49..cc5ba13028cd 100644
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@ -765,6 +765,11 @@ static int create_or_delete_trace_kprobe(int argc, char **argv)
 	return ret == -ECANCELED ? -EINVAL : ret;
 }
 
+int trace_kprobe_run_command(const char *command)
+{
+	return trace_run_command(command, create_or_delete_trace_kprobe);
+}
+
 static int trace_kprobe_release(struct dyn_event *ev)
 {
 	struct trace_kprobe *tk = to_trace_kprobe(ev);
diff --git a/kernel/trace/trace_of.c b/kernel/trace/trace_of.c
index 696f59234e62..43d87e5065a3 100644
--- a/kernel/trace/trace_of.c
+++ b/kernel/trace/trace_of.c
@@ -23,6 +23,7 @@ extern void __init trace_init_tracepoint_printk(void);
 extern ssize_t tracing_resize_ring_buffer(struct trace_array *tr,
 					  unsigned long size, int cpu_id);
 extern int trigger_process_regex(struct trace_event_file *file, char *buff);
+extern int trace_kprobe_run_command(const char *command);
 
 static void __init
 trace_of_set_ftrace_options(struct trace_array *tr, struct device_node *node)
@@ -99,14 +100,47 @@ trace_of_enable_events(struct trace_array *tr, struct device_node *node)
 	}
 }
 
+static int __init
+trace_of_add_kprobe_event(struct device_node *node,
+			  const char *group, const char *event)
+{
+	struct property *prop;
+	char buf[MAX_BUF_LEN];
+	const char *p;
+	char *q;
+	int len, ret;
+
+	len = snprintf(buf, ARRAY_SIZE(buf) - 1, "p:%s/%s ", group, event);
+	if (len >= ARRAY_SIZE(buf)) {
+		pr_err("Event name is too long: %s\n", event);
+		return -E2BIG;
+	}
+	q = buf + len;
+	len = ARRAY_SIZE(buf) - len;
+
+	of_property_for_each_string(node, "probes", prop, p) {
+		if (strlcpy(q, p, len) >= len) {
+			pr_err("Probe definition is too long: %s\n", p);
+			return -E2BIG;
+		}
+		ret = trace_kprobe_run_command(buf);
+		if (ret < 0) {
+			pr_err("Failed to add probe: %s\n", buf);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static void __init
 trace_of_init_one_event(struct trace_array *tr, struct device_node *node)
 {
 	struct trace_event_file *file;
 	struct property *prop;
 	char buf[MAX_BUF_LEN];
-	char *bufp;
-	const char *p;
+	const char *p, *group;
+	char *event;
 	int err;
 
 	if (!of_node_name_prefix(node, "event"))
@@ -123,18 +157,29 @@ trace_of_init_one_event(struct trace_array *tr, struct device_node *node)
 		pr_err("Event name is too long: %s\n", p);
 		return;
 	}
-	bufp = buf;
-
-	p = strsep(&bufp, ":");
-	if (!bufp) {
-		pr_err("%s has no group name\n", buf);
-		return;
+	event = buf;
+
+	group = strsep(&event, ":");
+	/* For a kprobe event, we have to generates an event at first */
+	if (of_find_property(node, "probes", NULL)) {
+		if (!event) {
+			event = buf;
+			group = "kprobes";
+		}
+		err = trace_of_add_kprobe_event(node, group, event);
+		if (err < 0)
+			return;
+	} else {
+		if (!event) {
+			pr_err("%s has no group name\n", buf);
+			return;
+		}
 	}
 
 	mutex_lock(&event_mutex);
-	file = find_event_file(tr, buf, bufp);
+	file = find_event_file(tr, group, event);
 	if (!file) {
-		pr_err("Failed to find event: %s\n", buf);
+		pr_err("Failed to find event: %s:%s\n", group, event);
 		return;
 	}
 
