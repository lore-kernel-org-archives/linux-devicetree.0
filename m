From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v6 01/12] tools lib traceevent: Convert remaining %p[fF]
 users to %p[sS]
Date: Wed, 18 Sep 2019 16:08:37 +0300
Message-ID: <20190918130837.GQ5781@paasikivi.fi.intel.com>
References: <20190910084707.18380-1-sakari.ailus@linux.intel.com>
 <20190910084707.18380-2-sakari.ailus@linux.intel.com>
 <20190910071837.2e9110f8@oasis.local.home>
 <61a2b2ab4693535850306f396aac2a328e1d5a21.camel@perches.com>
 <20190910142621.0bec208d@oasis.local.home>
 <c458e734f5777561138b87228384808398547762.camel@perches.com>
 <20190910150303.5a0d3904@oasis.local.home>
 <c90c33b421c0fa0db5182d0f58c6ba6e86cf1622.camel@perches.com>
 <20190916114158.GN5781@paasikivi.fi.intel.com>
 <20190916103755.4c19eda9@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190916103755.4c19eda9@gandalf.local.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Joe Perches <joe@perches.com>, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Tzvetomir Stoyanov <tstoyanov@vmware.com>, linux-trace-devel@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Steven,

On Mon, Sep 16, 2019 at 10:37:55AM -0400, Steven Rostedt wrote:
> > If you think that's an issue, I'll opt for another extension than %pfw,
> > which I chose originally since it's memorable --- fw for fwnode (names,
> > paths, and probably more in the future).
> > 
> 
> I'm fine with the switch, as long as newer tools know how to handle it.
> 
> Make sure we also add a comment in the Linux kernel code that states
> that older kernels use to have 'f' and 'F' and that new tools look for
> 'fw' to denote that this isn't an older kernel. This way, people will
> hopefully not add another 'fX' pointer name.

Good point. I'll add a comment on this to make_bprint_args() in
tools/lib/traceevent/event-parse.c as well as in vsprintf.c.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
