From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v5 11/11] lib/test_printf: Add tests for %pfw printk
 modifier
Date: Wed, 4 Sep 2019 19:10:51 +0300
Message-ID: <20190904161051.GX5475@paasikivi.fi.intel.com>
References: <20190902135732.23455-1-sakari.ailus@linux.intel.com>
 <20190902135732.23455-12-sakari.ailus@linux.intel.com>
 <20190902161352.GS2680@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190902161352.GS2680@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On Mon, Sep 02, 2019 at 07:13:52PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 02, 2019 at 04:57:32PM +0300, Sakari Ailus wrote:
> > Add a test for the %pfw printk modifier using software nodes.
> 
> > +static void __init fwnode_pointer(void)
> > +{
> > +	const struct software_node softnodes[] = {
> > +		{ .name = "first", },
> > +		{ .name = "second", .parent = &softnodes[0], },
> > +		{ .name = "third", .parent = &softnodes[1], },
> > +		{ NULL /* Guardian */ },
> 
> Comma is still here :-)

Oops. I ended up removing the comma in a wrong patch which wasn't submitted
to the list. Will fix for v6.

> 
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
> I have another thought about these. The test cases will fail in either of
> adding, inserting or removing items in softnodes array. So, using the above
> "protective" scheme doesn't bring any value except making readability worse.

Agreed, to be addressed in v6.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
