From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: add of_find_child_by_name implementation
Date: Sun, 16 Sep 2012 18:58:17 -0500
Message-ID: <50566799.3090507@gmail.com>
References: <1346341328-23554-1-git-send-email-m-karicheri2@ti.com>
 <3E54258959B69E4282D79E01AB1F32B7041CB0CC@DFLE12.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <3E54258959B69E4282D79E01AB1F32B7041CB0CC-GR6MelrUkc+IQmiDNMet8wC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: "Karicheri, Muralidharan" <m-karicheri2-l0cyMroinI0@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/16/2012 05:24 PM, Karicheri, Muralidharan wrote:
>>> -----Original Message-----
>>> From: Karicheri, Muralidharan
>>> Sent: Thursday, August 30, 2012 11:42 AM
>>> To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org; rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org; devicetree-
>>> discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Cc: Karicheri, Muralidharan; Chemparathy, Cyril
>>> Subject: [PATCH] of: add of_find_child_by_name implementation
>>>
>>> This patch adds a helper to find a child node by name.
>>>
>>> Signed-off-by: Cyril Chemparathy <cyril-l0cyMroinI0@public.gmane.org>
>>> Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
>>> ---
>>>  drivers/of/base.c  |   20 ++++++++++++++++++++
>>>  include/linux/of.h |    2 ++
>>>  2 files changed, 22 insertions(+)
>>>
>>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>>> index d4a1c9a..bbdd0d4 100644
>>> --- a/drivers/of/base.c
>>> +++ b/drivers/of/base.c
>>> @@ -441,6 +441,26 @@ struct device_node *of_find_node_by_name(struct
>>> device_node *from,
>>>  EXPORT_SYMBOL(of_find_node_by_name);
>>>
>>>  /**
>>> + *	of_find_child_by_name - Find a child node by its "name" property
>>> + *	@parent:The parent node to search from
>>> + *	@name:	The name string to match against
>>> + *
>>> + *	Returns a node pointer with refcount incremented, use
>>> + *	of_node_put() on it when done.
>>> + */
>>> +struct device_node *of_find_child_by_name(struct device_node *parent,
>>> +					  const char *name)
>>> +{
>>> +	struct device_node *child;
>>> +
>>> +	for_each_child_of_node(parent, child)
>>> +		if (child->name && of_node_cmp(child->name, name) == 0)
>>> +			break;
>>> +	return child;
>>> +}
>>> +EXPORT_SYMBOL(of_find_child_by_name);
>>> +
>>> +/**
>>>   *	of_find_node_by_type - Find a node by its "device_type" property
>>>   *	@from:	The node to start searching from, or NULL to start searching
>>>   *		the entire device tree. The node you pass will not be
>>> diff --git a/include/linux/of.h b/include/linux/of.h
>>> index 1b11632..a4cc8e7 100644
>>> --- a/include/linux/of.h
>>> +++ b/include/linux/of.h
>>> @@ -193,6 +193,8 @@ extern struct device_node *of_get_next_child(const struct
>>> device_node *node,
>>>  extern struct device_node *of_get_next_available_child(
>>>  	const struct device_node *node, struct device_node *prev);
>>>
>>> +struct device_node *of_find_child_by_name(struct device_node *parent,
>>> +					  const char *name);
>>>  #define for_each_child_of_node(parent, child) \
>>>  	for (child = of_get_next_child(parent, NULL); child != NULL; \
>>>  	     child = of_get_next_child(parent, child))
>>> --
>>> 1.7.9.5
> 
> Can someone review this? If this is okay, can this be merged to the next branch please?
> 

This one does the same thing:

http://www.mail-archive.com/devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org/msg18585.html

Yours came first, but this one also converts several places to use it.
So I plan to merge it once subsystem maintainers ack the conversions.

Do you have something for 3.7 dependent on this?

Rob
