From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v6 01/12] tools lib traceevent: Convert remaining %p[fF]
 users to %p[sS]
Date: Tue, 10 Sep 2019 11:42:06 -0700
Message-ID: <c458e734f5777561138b87228384808398547762.camel@perches.com>
References: <20190910084707.18380-1-sakari.ailus@linux.intel.com>
         <20190910084707.18380-2-sakari.ailus@linux.intel.com>
         <20190910071837.2e9110f8@oasis.local.home>
         <61a2b2ab4693535850306f396aac2a328e1d5a21.camel@perches.com>
         <20190910142621.0bec208d@oasis.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190910142621.0bec208d@oasis.local.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Tzvetomir Stoyanov <tstoyanov@vmware.com>, linux-trace-devel@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-09-10 at 14:26 -0400, Steven Rostedt wrote:
> On Tue, 10 Sep 2019 10:18:44 -0700
> Joe Perches <joe@perches.com> wrote:
> 
> > > It's not just for the lastest kernel. We must maintain backward
> > > compatibility here too. If there use to be a usage of this, then we
> > > must keep it until the kernels are no longer used (perhaps 7 years?)  
> > 
> > That argues for not using "%pfw" at all for some number of years.
> > 
> > Perhaps the '%pfw' should be '%pnfw' for 'name' and 'fwnode'
>
>   -ENOCOMPREHENSION

Perhaps you were not copied on the whole series.

https://lore.kernel.org/lkml/20190910084707.18380-1-sakari.ailus@linux.intel.com/

As I understand it, Sakair Ailus is proposing to
obsolete the current vsprintf "%p[Ff]" extension
and replace the usage with a new "%pfw" extension
which would emit the name of a pointer to "struct fwnode {}".

https://lore.kernel.org/lkml/20190910084707.18380-10-sakari.ailus@linux.intel.com/

If reusing "%pf<foo>" is a problem, then instead
it might be reasonable to have a new "%pn<foo>" for
that use instead.

btw:

Is there kernel version information available in
trace output files?

If so, it might be reasonable to change the tooling
there instead.
