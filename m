From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v4 15/16] device property: Add fwnode_get_next_parent()
Date: Mon, 13 Mar 2017 22:58:25 +0100
Message-ID: <2027673.WAD1C0MHDO@aspire.rjw.lan>
References: <1488809970-25568-1-git-send-email-sakari.ailus@linux.intel.com> <1488809970-25568-16-git-send-email-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1488809970-25568-16-git-send-email-sakari.ailus@linux.intel.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, mika.westerberg@linux.intel.com, rafael@kernel.org, mark.rutland@arm.com, broonie@kernel.org, robh@kernel.org, ahs3@redhat.com
List-Id: devicetree@vger.kernel.org

On Monday, March 06, 2017 04:19:29 PM Sakari Ailus wrote:
> In order to differentiate the functionality between dropping a reference
> to the node (or not) for the benefit of OF, introduce
> fwnode_get_next_parent().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/base/property.c  | 29 +++++++++++++++++++++++++++++
>  include/linux/property.h |  1 +
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index b8c1017..defeba9 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -953,6 +953,35 @@ int device_add_properties(struct device *dev,
>  EXPORT_SYMBOL_GPL(device_add_properties);
>  
>  /**
> + * fwnode_get_next_parent - Iterate to the node's parent
> + * @fwnode: Firmware whose parent is retrieved
> + *
> + * This is like fwnode_get_parent() except that it drops the refcount
> + * on the passed node, making it suitable for iterating through a
> + * node's parents.
> + *
> + * Returns a node pointer with refcount incremented, use
> + * fwnode_handle_node() on it when done.
> + */
> +struct fwnode_handle *fwnode_get_next_parent(struct fwnode_handle *fwnode)
> +{
> +	struct fwnode_handle *parent = NULL;
> +
> +	if (is_of_node(fwnode)) {
> +		struct device_node *node;
> +
> +		node = of_get_next_parent(to_of_node(fwnode));

So I would fold the [14/15] into this one and then it should be clear why that
change was useful.

> +		if (node)
> +			parent = &node->fwnode;
> +	} else if (is_acpi_node(fwnode)) {
> +		parent = acpi_node_get_parent(fwnode);
> +	}
> +
> +	return parent;
> +}
> +EXPORT_SYMBOL_GPL(fwnode_get_next_parent);
> +
> +/**
>   * fwnode_get_parent - Return parent firwmare node
>   * @fwnode: Firmware whose parent is retrieved
>   *
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 45ef00a..19dd35e 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -77,6 +77,7 @@ int fwnode_property_match_string(struct fwnode_handle *fwnode,
>  				 const char *propname, const char *string);
>  
>  struct fwnode_handle *fwnode_get_parent(struct fwnode_handle *fwnode);
> +struct fwnode_handle *fwnode_get_next_parent(struct fwnode_handle *fwnode);
>  struct fwnode_handle *fwnode_get_next_child_node(struct fwnode_handle *fwnode,
>  						 struct fwnode_handle *child);
>  
> 

Thanks,
Rafael

