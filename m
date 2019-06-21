From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: [RFC PATCH 11/11] tracing: of: Add synthetic event support
Date: Sat, 22 Jun 2019 01:19:51 +0900
Message-ID: <156113399174.28344.17111722475993258131.stgit@devnote2>
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

Add synthetic event node support. The synthetic event node must be
a child node of ftrace node, and the node must start with "synth@"
prefix. The synth node requires fields string (not string array),
which defines the fields as same as tracing/synth_events interface.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 kernel/trace/trace_events_hist.c |    5 ++++
 kernel/trace/trace_of.c          |   54 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index db973928e580..e7f5d0a353e2 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -1343,6 +1343,11 @@ static int create_or_delete_synth_event(int argc, char **argv)
 	return ret == -ECANCELED ? -EINVAL : ret;
 }
 
+int synth_event_run_command(const char *command)
+{
+	return trace_run_command(command, create_or_delete_synth_event);
+}
+
 static int synth_event_create(int argc, const char **argv)
 {
 	const char *name = argv[0];
diff --git a/kernel/trace/trace_of.c b/kernel/trace/trace_of.c
index 43d87e5065a3..1b2a1306fc60 100644
--- a/kernel/trace/trace_of.c
+++ b/kernel/trace/trace_of.c
@@ -24,6 +24,7 @@ extern ssize_t tracing_resize_ring_buffer(struct trace_array *tr,
 					  unsigned long size, int cpu_id);
 extern int trigger_process_regex(struct trace_event_file *file, char *buff);
 extern int trace_kprobe_run_command(const char *command);
+extern int synth_event_run_command(const char *command);
 
 static void __init
 trace_of_set_ftrace_options(struct trace_array *tr, struct device_node *node)
@@ -133,6 +134,38 @@ trace_of_add_kprobe_event(struct device_node *node,
 	return 0;
 }
 
+static int __init
+trace_of_add_synth_event(struct device_node *node, const char *event)
+{
+	struct property *prop;
+	char buf[MAX_BUF_LEN], *q;
+	const char *p;
+	int len, delta, ret;
+
+	len = ARRAY_SIZE(buf);
+	delta = snprintf(buf, len, "%s", event);
+	if (delta >= len) {
+		pr_err("Event name is too long: %s\n", event);
+		return -E2BIG;
+	}
+	len -= delta; q = buf + delta;
+
+	of_property_for_each_string(node, "fields", prop, p) {
+		delta = snprintf(q, len, " %s;", p);
+		if (delta >= len) {
+			pr_err("fields string is too long: %s\n", p);
+			return -E2BIG;
+		}
+		len -= delta; q += delta;
+	}
+
+	ret = synth_event_run_command(buf);
+	if (ret < 0)
+		pr_err("Failed to add synthetic event: %s\n", buf);
+
+	return ret;
+}
+
 static void __init
 trace_of_init_one_event(struct trace_array *tr, struct device_node *node)
 {
@@ -160,15 +193,30 @@ trace_of_init_one_event(struct trace_array *tr, struct device_node *node)
 	event = buf;
 
 	group = strsep(&event, ":");
-	/* For a kprobe event, we have to generates an event at first */
+
+	/* Generates kprobe/synth event at first */
 	if (of_find_property(node, "probes", NULL)) {
+		if (of_find_property(node, "fields", NULL)) {
+			pr_err("Error: %s node has both probes and fields\n",
+				of_node_full_name(node));
+			return;
+		}
 		if (!event) {
 			event = buf;
 			group = "kprobes";
 		}
-		err = trace_of_add_kprobe_event(node, group, event);
-		if (err < 0)
+		if (trace_of_add_kprobe_event(node, group, event) < 0)
+			return;
+	} else if (of_find_property(node, "fields", NULL)) {
+		if (!event)
+			event = buf;
+		else if (strcmp(group, "synthetic") != 0) {
+			pr_err("Synthetic event must be in synthetic group\n");
+			return;
+		}
+		if (trace_of_add_synth_event(node, event) < 0)
 			return;
+		group = "synthetic";
 	} else {
 		if (!event) {
 			pr_err("%s has no group name\n", buf);
