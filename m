From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: [RFC PATCH v2 04/15] tracing: kprobes: Register to dynevent earlier stage
Date: Mon, 15 Jul 2019 14:11:52 +0900
Message-ID: <156316751189.23477.5849503344032872544.stgit@devnote2>
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

Register kprobe event to dynevent in subsys_initcall level.
This will allow kernel to register new kprobe events in
fs_initcall level via trace_run_command.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 kernel/trace/trace_kprobe.c |   19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
index 6c5145525f90..5135c07b6557 100644
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@ -1484,11 +1484,12 @@ static __init void setup_boot_kprobe_events(void)
 	enable_boot_kprobe_events();
 }
 
-/* Make a tracefs interface for controlling probe points */
-static __init int init_kprobe_trace(void)
+/*
+ * Register dynevent at subsys_initcall. This allows kernel to setup kprobe
+ * events in fs_initcall without tracefs.
+ */
+static __init int init_kprobe_trace_early(void)
 {
-	struct dentry *d_tracer;
-	struct dentry *entry;
 	int ret;
 
 	ret = dyn_event_register(&trace_kprobe_ops);
@@ -1498,6 +1499,16 @@ static __init int init_kprobe_trace(void)
 	if (register_module_notifier(&trace_kprobe_module_nb))
 		return -EINVAL;
 
+	return 0;
+}
+subsys_initcall(init_kprobe_trace_early);
+
+/* Make a tracefs interface for controlling probe points */
+static __init int init_kprobe_trace(void)
+{
+	struct dentry *d_tracer;
+	struct dentry *entry;
+
 	d_tracer = tracing_init_dentry();
 	if (IS_ERR(d_tracer))
 		return 0;
