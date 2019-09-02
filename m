From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 03/11] device property: Move fwnode_get_parent() up
Date: Mon, 2 Sep 2019 13:11:53 +0300
Message-ID: <20190902101153.GA2680@smile.fi.intel.com>
References: <20190902083240.20367-1-sakari.ailus@linux.intel.com>
 <20190902083240.20367-4-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190902083240.20367-4-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 02, 2019 at 11:32:32AM +0300, Sakari Ailus wrote:
> Move fwnode_get_parent() above fwnode_get_next_parent(), making the order
> the same as in the header file.
> 

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/base/property.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 81bd01ed40427..3d9dffbe96378 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -556,6 +556,19 @@ int device_add_properties(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(device_add_properties);
>  
> +/**
> + * fwnode_get_parent - Return parent firwmare node
> + * @fwnode: Firmware whose parent is retrieved
> + *
> + * Return parent firmware node of the given node if possible or %NULL if no
> + * parent was available.
> + */
> +struct fwnode_handle *fwnode_get_parent(const struct fwnode_handle *fwnode)
> +{
> +	return fwnode_call_ptr_op(fwnode, get_parent);
> +}
> +EXPORT_SYMBOL_GPL(fwnode_get_parent);
> +
>  /**
>   * fwnode_get_next_parent - Iterate to the node's parent
>   * @fwnode: Firmware whose parent is retrieved
> @@ -577,19 +590,6 @@ struct fwnode_handle *fwnode_get_next_parent(struct fwnode_handle *fwnode)
>  }
>  EXPORT_SYMBOL_GPL(fwnode_get_next_parent);
>  
> -/**
> - * fwnode_get_parent - Return parent firwmare node
> - * @fwnode: Firmware whose parent is retrieved
> - *
> - * Return parent firmware node of the given node if possible or %NULL if no
> - * parent was available.
> - */
> -struct fwnode_handle *fwnode_get_parent(const struct fwnode_handle *fwnode)
> -{
> -	return fwnode_call_ptr_op(fwnode, get_parent);
> -}
> -EXPORT_SYMBOL_GPL(fwnode_get_parent);
> -
>  /**
>   * fwnode_get_next_child_node - Return the next child node handle for a node
>   * @fwnode: Firmware node to find the next child node for.
> -- 
> 2.20.1
> 

-- 
With Best Regards,
Andy Shevchenko
