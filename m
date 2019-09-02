Return-Path: <SRS0=lNVK=W5=linux.intel.com=sakari.ailus@kernel.org>
Date: Mon, 2 Sep 2019 10:29:24 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 05/10] device property: Add a function to obtain a
 node's prefix
Message-ID: <20190902072924.GI5475@paasikivi.fi.intel.com>
References: <20190829101043.24963-1-sakari.ailus@linux.intel.com>
 <20190829101043.24963-6-sakari.ailus@linux.intel.com>
 <20190830124657.GE2680@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830124657.GE2680@smile.fi.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Andy,

On Fri, Aug 30, 2019 at 03:46:57PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 29, 2019 at 01:10:38PM +0300, Sakari Ailus wrote:
> > The prefix is used for printing purpose before a node, and it also works
> > as a separator between two nodes.
> 
> > +	/* Is this the root node? */
> > +	parent = fwnode_get_parent(fwnode);
> > +	if (!parent)
> > +		return "";
> > +
> > +	/* Is this 2nd node from the root? */
> > +	parent = fwnode_get_next_parent(parent);
> > +	if (!parent)
> 
> Can we theoretically have a case when we got parent != NULL and thus taken
> reference, while the 2nd one is NULL and we leak reference here (and in all
> similar places)?

fwnode_get_next_parent() releases that reference unconditionally.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
