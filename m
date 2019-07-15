Return-Path: <mhiramat@kernel.org>
From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: [RFC PATCH v2 13/15] tracing: of: Add cpumask property support
Date: Mon, 15 Jul 2019 14:13:27 +0900
Message-Id: <156316760712.23477.13986980388044489506.stgit@devnote2>
In-Reply-To: <156316746861.23477.5815110570539190650.stgit@devnote2>
References: <156316746861.23477.5815110570539190650.stgit@devnote2>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Tim Bird <Tim.Bird@sony.com>
Cc: Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Tom Zanussi <tom.zanussi@linux.intel.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add cpumask property for tracing. Note that this property accepts
a string cpumask, not a digit number.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 kernel/trace/trace.c    |   41 ++++++++++++++++++++++++++++-------------
 kernel/trace/trace_of.c |   14 ++++++++++++++
 2 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 6f50c58a3ad4..251d9de14b12 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -4437,20 +4437,12 @@ tracing_cpumask_read(struct file *filp, char __user *ubuf,
 	return count;
 }
 
-static ssize_t
-tracing_cpumask_write(struct file *filp, const char __user *ubuf,
-		      size_t count, loff_t *ppos)
+int tracing_set_cpumask(struct trace_array *tr, cpumask_var_t tracing_cpumask_new)
 {
-	struct trace_array *tr = file_inode(filp)->i_private;
-	cpumask_var_t tracing_cpumask_new;
-	int err, cpu;
-
-	if (!alloc_cpumask_var(&tracing_cpumask_new, GFP_KERNEL))
-		return -ENOMEM;
+	int cpu;
 
-	err = cpumask_parse_user(ubuf, count, tracing_cpumask_new);
-	if (err)
-		goto err_unlock;
+	if (!tr)
+		return -EINVAL;
 
 	local_irq_disable();
 	arch_spin_lock(&tr->max_lock);
@@ -4474,11 +4466,34 @@ tracing_cpumask_write(struct file *filp, const char __user *ubuf,
 	local_irq_enable();
 
 	cpumask_copy(tr->tracing_cpumask, tracing_cpumask_new);
+
+	return 0;
+}
+
+static ssize_t
+tracing_cpumask_write(struct file *filp, const char __user *ubuf,
+		      size_t count, loff_t *ppos)
+{
+	struct trace_array *tr = file_inode(filp)->i_private;
+	cpumask_var_t tracing_cpumask_new;
+	int err;
+
+	if (!alloc_cpumask_var(&tracing_cpumask_new, GFP_KERNEL))
+		return -ENOMEM;
+
+	err = cpumask_parse_user(ubuf, count, tracing_cpumask_new);
+	if (err)
+		goto err_free;
+
+	err = tracing_set_cpumask(tr, tracing_cpumask_new);
+	if (err)
+		goto err_free;
+
 	free_cpumask_var(tracing_cpumask_new);
 
 	return count;
 
-err_unlock:
+err_free:
 	free_cpumask_var(tracing_cpumask_new);
 
 	return err;
diff --git a/kernel/trace/trace_of.c b/kernel/trace/trace_of.c
index 7fe81c25dc59..14d6c9a8fd81 100644
--- a/kernel/trace/trace_of.c
+++ b/kernel/trace/trace_of.c
@@ -22,6 +22,8 @@ extern void __init trace_init_tracepoint_printk(void);
 extern ssize_t tracing_resize_ring_buffer(struct trace_array *tr,
 					  unsigned long size, int cpu_id);
 extern struct trace_array *trace_array_create(const char *name);
+extern int tracing_set_cpumask(struct trace_array *tr,
+			       cpumask_var_t tracing_cpumask_new);
 
 static void __init
 trace_of_set_instance_options(struct trace_array *tr, struct device_node *node)
@@ -59,6 +61,18 @@ trace_of_set_instance_options(struct trace_array *tr, struct device_node *node)
 			pr_err("Failed to resize trace buffer to %d KB\n",
 				v >> 10);
 	}
+
+	err = of_property_read_string(node, "cpumask", &p);
+	if (!err) {
+		cpumask_var_t new_mask;
+
+		if (alloc_cpumask_var(&new_mask, GFP_KERNEL)) {
+			if (cpumask_parse(p, new_mask) < 0 ||
+			    tracing_set_cpumask(tr, new_mask) < 0)
+				pr_err("Failed to set new CPU mask %s\n", p);
+			free_cpumask_var(new_mask);
+		}
+	}
 }
 
 static void __init
