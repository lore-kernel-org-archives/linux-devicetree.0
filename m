From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v6 01/12] tools lib traceevent: Convert remaining %p[fF]
 users to %p[sS]
Date: Tue, 10 Sep 2019 14:26:21 -0400
Message-ID: <20190910142621.0bec208d@oasis.local.home>
References: <20190910084707.18380-1-sakari.ailus@linux.intel.com>
        <20190910084707.18380-2-sakari.ailus@linux.intel.com>
        <20190910071837.2e9110f8@oasis.local.home>
        <61a2b2ab4693535850306f396aac2a328e1d5a21.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <61a2b2ab4693535850306f396aac2a328e1d5a21.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Tzvetomir Stoyanov <tstoyanov@vmware.com>, linux-trace-devel@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 10 Sep 2019 10:18:44 -0700
Joe Perches <joe@perches.com> wrote:

> > It's not just for the lastest kernel. We must maintain backward
> > compatibility here too. If there use to be a usage of this, then we
> > must keep it until the kernels are no longer used (perhaps 7 years?)  
> 
> That argues for not using "%pfw" at all for some number of years.
> 
> Perhaps the '%pfw' should be '%pnfw' for 'name' and 'fwnode'

  -ENOCOMPREHENSION

-- Steve
