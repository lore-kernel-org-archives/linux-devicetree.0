From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 01/11] software node: Get reference to parent swnode
 in get_parent op
Date: Mon, 2 Sep 2019 13:10:28 +0300
Message-ID: <20190902101028.GZ2680@smile.fi.intel.com>
References: <20190902083240.20367-1-sakari.ailus@linux.intel.com>
 <20190902083240.20367-2-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190902083240.20367-2-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 02, 2019 at 11:32:30AM +0300, Sakari Ailus wrote:
> The software_node_get_parent() returned a pointer to the parent swnode,
> but did not take a reference to it, leading the caller to put a reference
> that was not taken. Take that reference now.
> 

Missed already given

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: 59abd83672f7 ("drivers: base: Introducing software nodes to the firmware node framework")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/base/swnode.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index e7b3aa3bd55ad..a7cb41812cfda 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -520,7 +520,10 @@ software_node_get_parent(const struct fwnode_handle *fwnode)
>  {
>  	struct swnode *swnode = to_swnode(fwnode);
>  
> -	return swnode ? (swnode->parent ? &swnode->parent->fwnode : NULL) : NULL;
> +	if (!swnode || !swnode->parent)
> +		return NULL;
> +
> +	return fwnode_handle_get(&swnode->parent->fwnode);
>  }
>  
>  static struct fwnode_handle *
> -- 
> 2.20.1
> 

-- 
With Best Regards,
Andy Shevchenko
