From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 03/10] device property: Add functions for accessing
 node's parents
Date: Fri, 30 Aug 2019 15:34:48 +0300
Message-ID: <20190830123448.GB2680@smile.fi.intel.com>
References: <20190829101043.24963-1-sakari.ailus@linux.intel.com>
 <20190829101043.24963-4-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190829101043.24963-4-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 29, 2019 at 01:10:36PM +0300, Sakari Ailus wrote:
> Add two convenience functions for accessing node's parents:
> 
> fwnode_count_parents() returns the number of parent nodes a given node
> has. fwnode_get_nth_parent() returns node's parent at a given distance
> from the node itself.
> 
> Also reorder fwnode_get_parent() in property.c according to the same order
> as in property.h.

> +/**
> + * fwnode_get_parent - Return parent firwmare node
> + * @fwnode: Firmware whose parent is retrieved

I guess you may leave this in the same location. The change will be more clear
to review and smaller.

-- 
With Best Regards,
Andy Shevchenko
