From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 05/10] device property: Add a function to obtain a
 node's prefix
Date: Fri, 30 Aug 2019 15:46:57 +0300
Message-ID: <20190830124657.GE2680@smile.fi.intel.com>
References: <20190829101043.24963-1-sakari.ailus@linux.intel.com>
 <20190829101043.24963-6-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190829101043.24963-6-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 29, 2019 at 01:10:38PM +0300, Sakari Ailus wrote:
> The prefix is used for printing purpose before a node, and it also works
> as a separator between two nodes.

> +	/* Is this the root node? */
> +	parent = fwnode_get_parent(fwnode);
> +	if (!parent)
> +		return "";
> +
> +	/* Is this 2nd node from the root? */
> +	parent = fwnode_get_next_parent(parent);
> +	if (!parent)

Can we theoretically have a case when we got parent != NULL and thus taken
reference, while the 2nd one is NULL and we leak reference here (and in all
similar places)?

> +		return "";
> +
> +	fwnode_handle_put(parent);

-- 
With Best Regards,
Andy Shevchenko
