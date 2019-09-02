From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 01/10] software node: Get reference to parent swnode
 in get_parent op
Date: Mon, 2 Sep 2019 09:46:05 +0300
Message-ID: <20190902064605.GB5475@paasikivi.fi.intel.com>
References: <20190829101043.24963-1-sakari.ailus@linux.intel.com>
 <20190829101043.24963-2-sakari.ailus@linux.intel.com>
 <20190830122237.GY2680@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190830122237.GY2680@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2019 at 03:22:37PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 29, 2019 at 01:10:34PM +0300, Sakari Ailus wrote:
> > The software_node_get_parent() returned a pointer to the parent swnode,
> > but did not take a reference to it, leading the caller to put a reference
> > that was not taken. Take that reference now.
> > 
> 
> > Fixes: 59abd83672f7 ("drivers: base: Introducing software nodes to the
> > 		      firmware node framework")
> 
> I dunno if scripts parse the split line like above.
> 
> Nevertheless, for the code prospective looks good to me. Though you probably
> would like to Cc it to Heikki.

I will cc him for v4.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
