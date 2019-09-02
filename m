From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4 11/11] lib/test_printf: Add tests for %pfw printk
 modifier
Date: Mon, 2 Sep 2019 16:09:25 +0300
Message-ID: <20190902130925.GL5475@paasikivi.fi.intel.com>
References: <20190902083240.20367-1-sakari.ailus@linux.intel.com>
 <20190902083240.20367-12-sakari.ailus@linux.intel.com>
 <20190902122627.GG2680@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190902122627.GG2680@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 02, 2019 at 03:26:27PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 02, 2019 at 11:32:40AM +0300, Sakari Ailus wrote:
> > Add a test for the %pfw printk modifier using software nodes.
> 
> > +	const struct software_node softnodes[] = {
> > +		{ .name = "first", },
> > +		{ .name = "second", .parent = &softnodes[0], },
> > +		{ .name = "third", .parent = &softnodes[1], },
> > +		{ NULL /* Guardian */ },
> > +	};
> 
> > +	test(full_name_second, "%pfw",
> > +	     software_node_fwnode(&softnodes[ARRAY_SIZE(softnodes) - 3]));
> > +	test(full_name, "%pfw",
> > +	     software_node_fwnode(&softnodes[ARRAY_SIZE(softnodes) - 2]));
> > +	test(full_name, "%pfwf",
> > +	     software_node_fwnode(&softnodes[ARRAY_SIZE(softnodes) - 2]));
> > +	test(second_name, "%pfwP",
> > +	     software_node_fwnode(&softnodes[ARRAY_SIZE(softnodes) - 3]));
> > +	test(third_name, "%pfwP",
> > +	     software_node_fwnode(&softnodes[ARRAY_SIZE(softnodes) - 2]));
> 
> 
> These can be shorted and easier to parse if you use absolute indexes.

The above doesn't end up accessing out-of-bounds memory without compiler
errors or warnings if the array is changed, therefore I'd prefer to keep it
as-is.

But I'll remove the comma from the guardian entry for v5. :-)

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
