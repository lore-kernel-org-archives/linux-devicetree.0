From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 07/10] lib/vsprintf: Make use of fwnode API to obtain
 node names and separators
Date: Mon, 2 Sep 2019 12:48:02 +0300
Message-ID: <20190902094802.GT2680@smile.fi.intel.com>
References: <20190829101043.24963-1-sakari.ailus@linux.intel.com>
 <20190829101043.24963-8-sakari.ailus@linux.intel.com>
 <20190830125314.GG2680@smile.fi.intel.com>
 <20190902071130.GF5475@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190902071130.GF5475@paasikivi.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 02, 2019 at 10:11:30AM +0300, Sakari Ailus wrote:
> On Fri, Aug 30, 2019 at 03:53:14PM +0300, Andy Shevchenko wrote:
> > On Thu, Aug 29, 2019 at 01:10:40PM +0300, Sakari Ailus wrote:
> > > Instead of implementing our own means of discovering parent nodes, node
> > > names or counting how many parents a node has, use the newly added
> > > functions in the fwnode API to obtain that information.
> > > 
> > 
> > Some style comments below.
> > Nevertheless,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks!

> > >  		case 'f':	/* full_name */
> > > -			buf = device_node_gen_full_name(dn, buf, end);
> > 
> > > +			buf = fwnode_full_name_string(of_fwnode_handle(dn), buf,
> > > +						      end);
> > 
> > Ditto, disregard checkpatch.
> 
> Why? I see no reason to avoid wrapping here; in fact, if I'd review a patch
> that contained such code, I'd ask the submitter to wrap the lines.

For sake of readability. If you look to that file we broke that rule few times
for the same reason.


-- 
With Best Regards,
Andy Shevchenko
