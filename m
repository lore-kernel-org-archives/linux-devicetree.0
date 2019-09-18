From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v7 01/13] tools lib traceevent: Convert remaining %p[fF]
 users to %p[sS]
Date: Wed, 18 Sep 2019 18:22:17 +0300
Message-ID: <20190918152217.GR2680@smile.fi.intel.com>
References: <20190918133419.7969-1-sakari.ailus@linux.intel.com>
 <20190918133419.7969-2-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190918133419.7969-2-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, Tzvetomir Stoyanov <tstoyanov@vmware.com>, linux-trace-devel@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2019 at 04:34:07PM +0300, Sakari Ailus wrote:
> There are no in-kernel %p[fF] users left. Convert the traceevent tool,
> too, to align with the kernel.

>  function. The _tep_ argument is the trace event parser context. The _name_ is
> -the name of the function, the string is copied internally. The _addr_ is
> -the start address of the function. The _mod_ is the kernel module
> -the function may be in (NULL for none).
> +the name of the function, the string is copied internally. The _addr_ is the
> +start address of the function. The _mod_ is the kernel module the function may
> +be in (NULL for none).

I think this is unneeded churn (reformating string). But since maintainer Acked
this, I don't care much. But think about burden to the Git index in million of
instances around the world.

-- 
With Best Regards,
Andy Shevchenko
