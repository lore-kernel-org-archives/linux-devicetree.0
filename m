From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v6 01/12] tools lib traceevent: Convert remaining %p[fF]
 users to %p[sS]
Date: Tue, 10 Sep 2019 10:18:44 -0700
Message-ID: <61a2b2ab4693535850306f396aac2a328e1d5a21.camel@perches.com>
References: <20190910084707.18380-1-sakari.ailus@linux.intel.com>
         <20190910084707.18380-2-sakari.ailus@linux.intel.com>
         <20190910071837.2e9110f8@oasis.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190910071837.2e9110f8@oasis.local.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Tzvetomir Stoyanov <tstoyanov@vmware.com>, linux-trace-devel@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-09-10 at 07:18 -0400, Steven Rostedt wrote:
> On Tue, 10 Sep 2019 11:46:56 +0300
> Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> 
> > There are no in-kernel %p[fF] users left. Convert the traceevent tool,
> > too, to align with the kernel.
[]
> > diff --git a/tools/lib/traceevent/event-parse.c b/tools/lib/traceevent/event-parse.c
[]
> > @@ -4335,8 +4335,6 @@ static struct tep_print_arg *make_bprint_args(char *fmt, void *data, int size, s
> >  					switch (*ptr) {
> >  					case 's':
> >  					case 'S':
> > -					case 'f':
> > -					case 'F':
> 
> This file is used to parse output from older kernels, so remove this hunk.
> 
> It's not just for the lastest kernel. We must maintain backward
> compatibility here too. If there use to be a usage of this, then we
> must keep it until the kernels are no longer used (perhaps 7 years?)

That argues for not using "%pfw" at all for some number of years.

Perhaps the '%pfw' should be '%pnfw' for 'name' and 'fwnode'
