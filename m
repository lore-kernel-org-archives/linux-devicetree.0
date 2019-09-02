From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 06/10] lib/vsprintf: Remove support for %pF and %pf in
 favour of %pS and %ps
Date: Mon, 2 Sep 2019 10:06:33 +0300
Message-ID: <20190902070633.GD5475@paasikivi.fi.intel.com>
References: <20190829101043.24963-1-sakari.ailus@linux.intel.com>
 <20190829101043.24963-7-sakari.ailus@linux.intel.com>
 <20190830124817.GF2680@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190830124817.GF2680@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2019 at 03:48:17PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 29, 2019 at 01:10:39PM +0300, Sakari Ailus wrote:
> > %pS and %ps are now the preferred conversion specifiers to print function
> > %names. The functionality is equivalent; remove the old, deprecated %pF
> > %and %pf support.
> > 
> 
> > Depends-on: ("treewide: Switch printk users from %pf and %pF to %ps and
> > 	      %pS, respectively")
> 
> Same comment for multi-line tags, besides that it misses hash, and since it's
> in upstream, no need for it anymore?

Yes, I forgot to remove it when posting v3.

> FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks!

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
