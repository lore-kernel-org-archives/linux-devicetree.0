From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: [RFC PATCH 00/11] tracing: of: Boot time tracing using devicetree
Date: Sat, 22 Jun 2019 01:18:00 +0900
Message-ID: <156113387975.28344.16009584175308192243.stgit@devnote2>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Here is an RFC series of patches to add boot-time tracing using
devicetree.

Currently, kernel support boot-time tracing using kernel command-line
parameters. But that is very limited because of limited expressions
and limited length of command line. Recently, useful features like
histogram, synthetic events, etc. are being added to ftrace, but it is
clear that we can not expand command-line options to support these
features.

Hoever, I've found that there is a devicetree which can pass more
structured commands to kernel at boot time :) The devicetree is usually
used for dscribing hardware configuration, but I think we can expand it
for software configuration too (e.g. AOSP and OPTEE already introduced
firmware node.) Also, grub and qemu already supports loading devicetree,
so we can use it not only on embedded devices but also on x86 PC too.

With the devicetree, we can setup new kprobe and synthetic events, more
complicated event filters and trigger actions including histogram.

For example, following kernel parameters

trace_options=sym-addr trace_event=initcall:* tp_printk trace_buf_size=1M

it can be written in devicetree like below.

	ftrace {
		compatible = "linux,ftrace";
		options = "sym-addr";
		events = "initcall:*";
		tp-printk;
		buffer-size-kb = <0x400>;	// 1024KB == 1MB
	};

Moreover, now we can expand it to add filters for events, kprobe events,
and synthetic events with histogram like below.

	ftrace {
		compatible = "linux,ftrace";
		...
		event0 {
			event = "task:task_newtask";
			filter = "pid < 128";	// adding filters
			enable;
		};
		event1 {
			event = "kprobes:vfs_read";
			probes = "vfs_read $arg1 $arg2"; // add kprobes
			filter = "common_pid < 200";
			enable;
		};
		event2 {
			event = "initcall_latency";	// add synth event
			fields = "unsigned long func", "u64 lat";
			// with histogram
			actions = "hist:keys=func.sym,lat:vals=lat:sort=lat";
		};
		// and synthetic event callers
		event3 {
			event = "initcall:initcall_start";
			actions = "hist:keys=func:ts0=common_timestamp.usecs";
		};
		event4 {
			event = "initcall:initcall_finish";
			actions = "hist:keys=func:lat=common_timestamp.usecs-$ts0:onmatch(initcall.initcall_start).initcall_latency(func,$lat)";
		};
	};

These complex configuration can not be done by kernel parameters.
However, this is not replacing boot-time tracing by kernel parameters.
This devicetree settings are applied in fs_initcall() stage, but kernel
parameters are applied earlier stage. Anyway, this is enough useful
for debugging/tracing kernel driver initializations.

I would like to discuss on some points about this idea.

- Can we use devicetree for configuring kernel dynamically?
- Would you have any comment for the devicetree format and default
  behaviors?
- Currently, kprobe and synthetic events are defined inside event
  node, but it is able to define globally in ftrace node. Which is
  better?
- Do we need to support "status" property on each event node so
  that someone can prepare "dtsi" include file and override the status?
- Do we need instance-wide pid filter (set_event_pid) when boot-time?
- Do we need more structured tree, like spliting event and group,
  event actions and probes to be a tree of node, etc?
- Do we need per group filter & enablement support?
- How to support instances? (nested tree or different tree?)
- What kind of options would we need?

Some kernel parameters are not implemented yet, like ftrace_filter,
ftrace_notrace, etc. These will be implemented afterwards.

Thank you,

---

Masami Hiramatsu (11):
      tracing: Apply soft-disabled and filter to tracepoints printk
      tracing: kprobes: Output kprobe event to printk buffer
      tracing: Expose EXPORT_SYMBOL_GPL symbol
      tracing: kprobes: Register to dynevent earlier stage
      tracing: Accept different type for synthetic event fields
      tracing: Add NULL trace-array check in print_synth_event()
      dt-bindings: tracing: Add ftrace binding document
      tracing: of: Add setup tracing by devicetree support
      tracing: of: Add trace event settings
      tracing: of: Add kprobe event support
      tracing: of: Add synthetic event support


 .../devicetree/bindings/tracing/ftrace.yaml        |  170 +++++++++++
 include/linux/trace_events.h                       |    1 
 kernel/trace/Kconfig                               |   10 +
 kernel/trace/Makefile                              |    1 
 kernel/trace/trace.c                               |   49 ++-
 kernel/trace/trace_events.c                        |    3 
 kernel/trace/trace_events_hist.c                   |   14 +
 kernel/trace/trace_events_trigger.c                |    2 
 kernel/trace/trace_kprobe.c                        |   81 +++--
 kernel/trace/trace_of.c                            |  311 ++++++++++++++++++++
 10 files changed, 589 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/tracing/ftrace.yaml
 create mode 100644 kernel/trace/trace_of.c

--
Masami Hiramatsu (Linaro) <mhiramat@kernel.org>
