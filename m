From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [RFC PATCH v2 00/15] tracing: of: Boot time tracing using
 devicetree
Date: Mon, 22 Jul 2019 23:38:26 +0900
Message-ID: <20190722233826.bafd7aeaad3b821157f2d2ff@kernel.org>
References: <156316746861.23477.5815110570539190650.stgit@devnote2>
        <488a65e6-1d80-0acb-5092-80c18b7ff447@gmail.com>
        <20190717000235.9ab100f0dac4af797a0fb76a@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190717000235.9ab100f0dac4af797a0fb76a@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh+dt@kernel.org>, Tim Bird <Tim.Bird@sony.com>, Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Tom Zanussi <tom.zanussi@linux.intel.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

I discussed with Frank and other kernel developers last week at OSSJ 2019.
Eventually, I decided to leave from devicetree, because it can unstabilize
current devicetree desgin and policy. Instead, aim to introduce a new
generic structured kernel cmdline, something like "configtree".

I thought JSON or other generic data format, but they look a bit bloated
for my purpose. I just need something like "extended hierarchical kernel
cmdline". For example,

ftrace {
  options = "sym-addr"
  events = "initcall:*"
  tp-printk
  event.0 {
    name = "tasl:task_newtask"
    filter = "pid < 128"
  } 
}

Which can be written as

ftrace.options="sym-addr" ftrace.events="initcall:*" ftrace.tp-printk ftrace.event.0.name="tasl:task_newtask" ftrace.event.0.filter="pid < 128"

on current kernel cmdline.

So, the parameters are linearly extended from current kernel cmdline.
Kernel internal APIs must be able to handle both of current cmdline
key-values and configtree key-values.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
