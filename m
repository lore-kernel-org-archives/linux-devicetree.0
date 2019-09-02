From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4 03/10] device property: Add functions for accessing
 node's parents
Date: Mon, 2 Sep 2019 10:05:30 +0300
Message-ID: <20190902070530.GC5475@paasikivi.fi.intel.com>
References: <20190829101043.24963-4-sakari.ailus@linux.intel.com>
 <20190829104401.24183-1-sakari.ailus@linux.intel.com>
 <20190830124235.GD2680@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190830124235.GD2680@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2019 at 03:42:35PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 29, 2019 at 01:44:01PM +0300, Sakari Ailus wrote:
> > Add two convenience functions for accessing node's parents:
> > 
> > fwnode_count_parents() returns the number of parent nodes a given node
> > has. fwnode_get_nth_parent() returns node's parent at a given distance
> > from the node itself.
> > 
> > Also reorder fwnode_get_parent() in property.c according to the same order
> > as in property.h.
> 
> Same comment as per previous version.

Same answer as on previous version. :^)

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
