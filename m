Return-Path: <mhiramat@kernel.org>
From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: [RFC PATCH v2 06/15] tracing: Add NULL trace-array check in print_synth_event()
Date: Mon, 15 Jul 2019 14:12:12 +0900
Message-Id: <156316753259.23477.16711531463620386669.stgit@devnote2>
In-Reply-To: <156316746861.23477.5815110570539190650.stgit@devnote2>
References: <156316746861.23477.5815110570539190650.stgit@devnote2>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Tim Bird <Tim.Bird@sony.com>
Cc: Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Tom Zanussi <tom.zanussi@linux.intel.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add NULL trace-array check in print_synth_event(), because
if we enable tp_printk option, iter->tr can be NULL.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 kernel/trace/trace_events_hist.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index a7f447195143..db973928e580 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -822,7 +822,7 @@ static enum print_line_t print_synth_event(struct trace_iterator *iter,
 		fmt = synth_field_fmt(se->fields[i]->type);
 
 		/* parameter types */
-		if (tr->trace_flags & TRACE_ITER_VERBOSE)
+		if (tr && tr->trace_flags & TRACE_ITER_VERBOSE)
 			trace_seq_printf(s, "%s ", fmt);
 
 		snprintf(print_fmt, sizeof(print_fmt), "%%s=%s%%s", fmt);
