Return-Path: <grant.likely@secretlab.ca>
Return-Path: <grant.likely@secretlab.ca>
Sender: Grant Likely <glikely@secretlab.ca>
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/5] of: Do not free memory at of_node_release option
In-Reply-To: 
 <1404493129-8914-2-git-send-email-pantelis.antoniou@konsulko.com>
References: 
	<1404493129-8914-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1404493129-8914-2-git-send-email-pantelis.antoniou@konsulko.com>
Date: Mon, 07 Jul 2014 14:10:18 +0100
Message-Id: <20140707131018.7E33EC409D5@trevor.secretlab.ca>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

On Fri,  4 Jul 2014 19:58:45 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> Introduce an option whether to free or not the memory of a node
> and it's properties when of_node_release is called.
> 
> The option is located in the chosen node, and its name is
> of-node-keep. When this boolean property is missing the default
> behaviour of freeing is preserved.

No way. The problem is buggy kernel code. We've got a plan to fix that.
In the mean time I'm okay with a CONFIG_ option that inhibits freeing,
or *maybe* a runtime global option that causes free() to not be called.

What this patch does is not helpful.

g.

> 
> The rational behind this option is as follows:
> 
> The life-cycle of nodes and properties does not allow us to release
> the memory taken by a device_node. Pointer to properties and nodes
> might still be in use in drivers, so any memory free'ing is dangerous.
> 
> Simply move all the properties to the deadprops list, and the node
> itself to of_alldeadnodes until the life-cycles issues are resolved.
> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> ---
>  drivers/of/dynamic.c | 74 +++++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 59 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index a5d6f4f..0e8457c 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -180,17 +180,29 @@ int of_detach_node(struct device_node *np)
>  	return rc;
>  }
>  
> +static struct device_node *of_alldeadnodes;
> +static DEFINE_RAW_SPINLOCK(deadtree_lock);
> +
>  /**
>   *	of_node_release - release a dynamically allocated node
>   *	@kref:  kref element of the node to be released
>   *
>   *	In of_node_put() this function is passed to kref_put()
>   *	as the destructor.
> + *
> + *	There is an option to not free the node, since due to the
> + *	way that node and property life-cycles are not completely
> + *	managed, we can't free the memory of a node at will.
> + *	Instead we move the node to the dead nodes list where it will
> + *	remain until the life-cycle issues are resolved.
>   */
> -static void of_node_release(struct kobject *kobj)
> +void of_node_release(struct kobject *kobj)
>  {
> +	/*  we probe the of-node-keep chosen prop once */
> +	static int node_keep = -1;
>  	struct device_node *node = kobj_to_device_node(kobj);
> -	struct property *prop = node->properties;
> +	struct property *prop;
> +	unsigned long flags;
>  
>  	/* We should never be releasing nodes that haven't been detached. */
>  	if (!of_node_check_flag(node, OF_DETACHED)) {
> @@ -199,23 +211,55 @@ static void of_node_release(struct kobject *kobj)
>  		return;
>  	}
>  
> -	if (!of_node_check_flag(node, OF_DYNAMIC))
> +	/* we should not be trying to release the root */
> +	if (WARN_ON(node == of_allnodes))
>  		return;
>  
> -	while (prop) {
> -		struct property *next = prop->next;
> +	/* read the chosen boolean property "of-node-keep" once */
> +	if (node_keep == -1)
> +		node_keep = of_property_read_bool(of_chosen, "of-node-keep");
>  
> -		kfree(prop->name);
> -		kfree(prop->value);
> -		kfree(prop);
> -		prop = next;
> +	/* default is to free everything */
> +	if (!node_keep) {
>  
> -		if (!prop) {
> -			prop = node->deadprops;
> -			node->deadprops = NULL;
> +		/* free normal properties */
> +		while ((prop = node->properties) != NULL) {
> +			node->properties = prop->next;
> +			kfree(prop->name);
> +			kfree(prop->value);
> +			kfree(prop);
>  		}
> +
> +		/* free deap properties */
> +		while ((prop = node->deadprops) != NULL) {
> +			node->deadprops = prop->next;
> +			kfree(prop->name);
> +			kfree(prop->value);
> +			kfree(prop);
> +		}
> +
> +		/* free the node */
> +		kfree(node->full_name);
> +		kfree(node->data);
> +		kfree(node);
> +		return;
>  	}
> -	kfree(node->full_name);
> -	kfree(node->data);
> -	kfree(node);
> +
> +	pr_info("%s: dead node \"%s\"\n", __func__, node->full_name);
> +
> +	/* can't use devtree lock; at of_node_put caller might be holding it */
> +	raw_spin_lock_irqsave(&deadtree_lock, flags);
> +
> +	/* move all properties to dead properties */
> +	while ((prop = node->properties) != NULL) {
> +		node->properties = prop->next;
> +		prop->next = node->deadprops;
> +		node->deadprops = prop;
> +	}
> +
> +	/* move node to alldeadnodes */
> +	node->allnext = of_alldeadnodes;
> +	of_alldeadnodes = node;
> +
> +	raw_spin_unlock_irqrestore(&deadtree_lock, flags);
>  }
> -- 
> 1.7.12
> 
