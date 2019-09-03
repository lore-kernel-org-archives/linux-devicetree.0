From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 09/11] lib/vsprintf: OF nodes are first and foremost,
 struct device_nodes
Date: Tue, 3 Sep 2019 14:28:00 +0300
Message-ID: <20190903112800.GW2680@smile.fi.intel.com>
References: <20190902135732.23455-1-sakari.ailus@linux.intel.com>
 <20190902135732.23455-10-sakari.ailus@linux.intel.com>
 <20190903085233.oksjcwqwdxb53eig@pathway.suse.cz>
 <20190903092816.qutqnjba7okcauim@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190903092816.qutqnjba7okcauim@pathway.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, rafael@kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 03, 2019 at 11:28:16AM +0200, Petr Mladek wrote:
> On Tue 2019-09-03 10:52:33, Petr Mladek wrote:
> > On Mon 2019-09-02 16:57:30, Sakari Ailus wrote:
> > > Factor out static kobject_string() function that simply calls
> > > device_node_string(), and thus remove references to kobjects (as these are
> > > struct device_node).

> > > -		return kobject_string(buf, end, ptr, spec, fmt);
> > > +		return device_node_string(buf, end, ptr, spec, fmt + 1);
> > 
> > I know that this come from from kobject_string(). But please, modify
> > it to follow the style used by other %p modifiers. I mean to pass
> > "fmt" as is and then use:
> > 
> > 	if (fmt[1] != 'F')
> 
> Ah, I see that it would need more changes in device_node_string().
> OK, let's leave the patch as is. I am sorry for the noise.

I came to the same conclusions, though can we consider to drop this patch?

-- 
With Best Regards,
Andy Shevchenko
