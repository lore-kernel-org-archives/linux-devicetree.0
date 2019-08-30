From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 02/10] software node: Make argument to
 to_software_node const
Date: Fri, 30 Aug 2019 15:22:57 +0300
Message-ID: <20190830122257.GZ2680@smile.fi.intel.com>
References: <20190829101043.24963-1-sakari.ailus@linux.intel.com>
 <20190829101043.24963-3-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190829101043.24963-3-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 29, 2019 at 01:10:35PM +0300, Sakari Ailus wrote:
> to_software_node() does not need to modify the fwnode_handle it operates
> on; therefore make it const. This allows passing a const fwnode_handle to
> to_software_node().
> 

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/base/swnode.c    | 4 ++--
>  include/linux/property.h | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index a7cb41812cfda..951e7efd47c23 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -71,9 +71,9 @@ software_node_to_swnode(const struct software_node *node)
>  	return swnode;
>  }
>  
> -const struct software_node *to_software_node(struct fwnode_handle *fwnode)
> +const struct software_node *to_software_node(const struct fwnode_handle *fwnode)
>  {
> -	struct swnode *swnode = to_swnode(fwnode);
> +	const struct swnode *swnode = to_swnode(fwnode);
>  
>  	return swnode ? swnode->node : NULL;
>  }
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 5a910ad795910..421c76e53708d 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -418,7 +418,8 @@ struct software_node {
>  };
>  
>  bool is_software_node(const struct fwnode_handle *fwnode);
> -const struct software_node *to_software_node(struct fwnode_handle *fwnode);
> +const struct software_node *
> +to_software_node(const struct fwnode_handle *fwnode);
>  struct fwnode_handle *software_node_fwnode(const struct software_node *node);
>  
>  int software_node_register_nodes(const struct software_node *nodes);
> -- 
> 2.20.1
> 

-- 
With Best Regards,
Andy Shevchenko
