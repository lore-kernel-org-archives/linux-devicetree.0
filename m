From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v6 01/12] tools lib traceevent: Convert remaining %p[fF]
 users to %p[sS]
Date: Mon, 16 Sep 2019 10:37:55 -0400
Message-ID: <20190916103755.4c19eda9@gandalf.local.home>
References: <20190910084707.18380-1-sakari.ailus@linux.intel.com>
        <20190910084707.18380-2-sakari.ailus@linux.intel.com>
        <20190910071837.2e9110f8@oasis.local.home>
        <61a2b2ab4693535850306f396aac2a328e1d5a21.camel@perches.com>
        <20190910142621.0bec208d@oasis.local.home>
        <c458e734f5777561138b87228384808398547762.camel@perches.com>
        <20190910150303.5a0d3904@oasis.local.home>
        <c90c33b421c0fa0db5182d0f58c6ba6e86cf1622.camel@perches.com>
        <20190916114158.GN5781@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190916114158.GN5781@paasikivi.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Joe Perches <joe@perches.com>, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Tzvetomir Stoyanov <tstoyanov@vmware.com>, linux-trace-devel@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 16 Sep 2019 14:41:59 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

> > Well, if you think that works, OK great.
> > 
> > But could that work?
> > How would an individual trace record know if
> > another trace record used %pfw?
> > 
> > Perhaps not reusing %pf, marking it reserved
> > for a period of years, and using another unused
> > prefix %p<type> like %pnfw may be simpler.  
> 
> %p[Ff]w does not exist (I grepped for it) in older kernels since v3.0. So
> kernel support for %p[fF] and %pfw are mutually exclusive. If you're ok
> with that, I could change the patch to check %pf isn't followed by 'w',
> in order to support %pf on older kernels.

I think that's what I suggested to do.

> 
> Although that still does not address using older tooling on newer kernels
> with support for %pfw.

That should be fine. I don't think it will crash those tools, they will
just give out wrong information, and if people complain, we can try to
get them to use the newer version of those tools ;-) (hopefully they
don't complain to Linus).

> 
> If you think that's an issue, I'll opt for another extension than %pfw,
> which I chose originally since it's memorable --- fw for fwnode (names,
> paths, and probably more in the future).
> 

I'm fine with the switch, as long as newer tools know how to handle it.

Make sure we also add a comment in the Linux kernel code that states
that older kernels use to have 'f' and 'F' and that new tools look for
'fw' to denote that this isn't an older kernel. This way, people will
hopefully not add another 'fX' pointer name.

-- Steve
