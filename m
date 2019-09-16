From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v6 01/12] tools lib traceevent: Convert remaining %p[fF]
 users to %p[sS]
Date: Mon, 16 Sep 2019 14:41:59 +0300
Message-ID: <20190916114158.GN5781@paasikivi.fi.intel.com>
References: <20190910084707.18380-1-sakari.ailus@linux.intel.com>
 <20190910084707.18380-2-sakari.ailus@linux.intel.com>
 <20190910071837.2e9110f8@oasis.local.home>
 <61a2b2ab4693535850306f396aac2a328e1d5a21.camel@perches.com>
 <20190910142621.0bec208d@oasis.local.home>
 <c458e734f5777561138b87228384808398547762.camel@perches.com>
 <20190910150303.5a0d3904@oasis.local.home>
 <c90c33b421c0fa0db5182d0f58c6ba6e86cf1622.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c90c33b421c0fa0db5182d0f58c6ba6e86cf1622.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Tzvetomir Stoyanov <tstoyanov@vmware.com>, linux-trace-devel@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Joe, Steven,

On Tue, Sep 10, 2019 at 12:44:03PM -0700, Joe Perches wrote:
> On Tue, 2019-09-10 at 15:03 -0400, Steven Rostedt wrote:
> > On Tue, 10 Sep 2019 11:42:06 -0700
> []
> > > btw:
> > > 
> > > Is there kernel version information available in
> > > trace output files?
> > 
> > Not really. This is just a library that parses the trace event formats,
> > there's not kernel versions passed in, but we do use variations in
> > formats and such to determine what is supported.
> > 
> > > If so, it might be reasonable to change the tooling
> > > there instead.
> > > 
> > 
> > Actually, I think we could just look to see if "%pfw" is used and fall
> > to that, otherwise consider it an older kernel and do it the original
> > way.
> 
> Well, if you think that works, OK great.
> 
> But could that work?
> How would an individual trace record know if
> another trace record used %pfw?
> 
> Perhaps not reusing %pf, marking it reserved
> for a period of years, and using another unused
> prefix %p<type> like %pnfw may be simpler.

%p[Ff]w does not exist (I grepped for it) in older kernels since v3.0. So
kernel support for %p[fF] and %pfw are mutually exclusive. If you're ok
with that, I could change the patch to check %pf isn't followed by 'w',
in order to support %pf on older kernels.

Although that still does not address using older tooling on newer kernels
with support for %pfw.

If you think that's an issue, I'll opt for another extension than %pfw,
which I chose originally since it's memorable --- fw for fwnode (names,
paths, and probably more in the future).

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
