From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: [RFC PATCH v2 11/15] tracing: of: Add synthetic event support
Date: Mon, 15 Jul 2019 14:13:06 +0900
Message-ID: <156316758602.23477.18131938169057778805.stgit@devnote2>
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

Add synthetic event node support. The synthetic event node must be
a child node of ftrace node, and the node must start with "synth@"
prefix. The synth node requires fields string (not string array),
which defines the fields as same as tracing/synth_events interface.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 Changes in v2:
  - Make synth property available only if CONFIG_HIST_TRIGGERS=y
---
 kernel/trace/trace_events_hist.c |    5 +++
 kernel/trace/trace_of.c          |   64 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 66 insertions(+), 3 deletions(-)

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
index 56c5deb45f54..e9142c63ece1 100644
--- a/kernel/trace/trace_of.c
+++ b/kernel/trace/trace_of.c
@@ -146,6 +146,49 @@ trace_of_add_kprobe_event(struct device_node *node,
 }
 #endif
 
+#ifdef CONFIG_HIST_TRIGGERS
+extern int synth_event_run_command(const char *command);
+
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
+#else
+static inline int __init
+trace_of_add_synth_event(struct device_node *node, const char *event)
+{
+	pr_err("Synthetic event is not supported.\n");
+	return -ENOTSUPP;
+}
+#endif
+
 static void __init
 trace_of_init_one_event(struct trace_array *tr, struct device_node *node)
 {
@@ -173,15 +216,30 @@ trace_of_init_one_event(struct trace_array *tr, struct device_node *node)
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
