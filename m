From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 07/11] lib/vsprintf: Remove support for %pF and %pf in
 favour of %pS and %ps
Date: Mon, 2 Sep 2019 19:01:39 +0300
Message-ID: <20190902160139.GQ2680@smile.fi.intel.com>
References: <20190902083240.20367-1-sakari.ailus@linux.intel.com>
 <20190902083240.20367-8-sakari.ailus@linux.intel.com>
 <20190902143935.xtd44jdvhjuc2wxe@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190902143935.xtd44jdvhjuc2wxe@pathway.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, rafael@kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, Tzvetomir Stoyanov <tstoyanov@vmware.com>, linux-trace-devel@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 02, 2019 at 04:39:35PM +0200, Petr Mladek wrote:
> On Mon 2019-09-02 11:32:36, Sakari Ailus wrote:
> > %pS and %ps are now the preferred conversion specifiers to print function
> > names. The functionality is equivalent; remove the old, deprecated %pF
> > and %pf support.
> 
> Hmm, I see the following in master:
> 
> $> git grep %pF
> tools/lib/traceevent/Documentation/libtraceevent-func_apis.txt:or events have "%pF" or "%pS" parameter in its format string. It is common to
> 
> $> git grep %pf
> tools/lib/traceevent/event-parse.c:             if (asprintf(&format, "%%pf: (NO FORMAT FOUND at %llx)\n", addr) < 0)
> tools/lib/traceevent/event-parse.c:     if (asprintf(&format, "%s: %s", "%pf", printk->printk) < 0)
> 
> I wonder how this is related to printk(). In each case, it seems

It's going thru binary printf() I suppose. The fist stage just saves the format
string and argument addresses or so and prints in later on when user is looking
for human-readable output.

> that libtraceevent somehow implements the non-standard kernel
> %p mofifiers. It looks error-prone to keep another %pf user
> with the old semantic around.
> 
> I am adding some tracing people into CC.

-- 
With Best Regards,
Andy Shevchenko
