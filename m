From: "Karicheri, Muralidharan" <m-karicheri2@ti.com>
Subject: RE: [PATCH] of: add of_find_child_by_name implementation
Date: Sun, 16 Sep 2012 22:24:53 +0000
Message-ID: <3E54258959B69E4282D79E01AB1F32B7041CB0CC@DFLE12.ent.ti.com>
References: <1346341328-23554-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1346341328-23554-1-git-send-email-m-karicheri2@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Karicheri, Muralidharan" <m-karicheri2@ti.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "Chemparathy, Cyril" <cyril@ti.com>
List-Id: devicetree@vger.kernel.org

>> -----Original Message-----
>> From: Karicheri, Muralidharan
>> Sent: Thursday, August 30, 2012 11:42 AM
>> To: grant.likely@secretlab.ca; rob.herring@calxeda.com; devicetree-
>> discuss@lists.ozlabs.org; linux-kernel@vger.kernel.org
>> Cc: Karicheri, Muralidharan; Chemparathy, Cyril
>> Subject: [PATCH] of: add of_find_child_by_name implementation
>> 
>> This patch adds a helper to find a child node by name.
>> 
>> Signed-off-by: Cyril Chemparathy <cyril@ti.com>
>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> ---
>>  drivers/of/base.c  |   20 ++++++++++++++++++++
>>  include/linux/of.h |    2 ++
>>  2 files changed, 22 insertions(+)
>> 
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index d4a1c9a..bbdd0d4 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -441,6 +441,26 @@ struct device_node *of_find_node_by_name(struct
>> device_node *from,
>>  EXPORT_SYMBOL(of_find_node_by_name);
>> 
>>  /**
>> + *	of_find_child_by_name - Find a child node by its "name" property
>> + *	@parent:The parent node to search from
>> + *	@name:	The name string to match against
>> + *
>> + *	Returns a node pointer with refcount incremented, use
>> + *	of_node_put() on it when done.
>> + */
>> +struct device_node *of_find_child_by_name(struct device_node *parent,
>> +					  const char *name)
>> +{
>> +	struct device_node *child;
>> +
>> +	for_each_child_of_node(parent, child)
>> +		if (child->name && of_node_cmp(child->name, name) == 0)
>> +			break;
>> +	return child;
>> +}
>> +EXPORT_SYMBOL(of_find_child_by_name);
>> +
>> +/**
>>   *	of_find_node_by_type - Find a node by its "device_type" property
>>   *	@from:	The node to start searching from, or NULL to start searching
>>   *		the entire device tree. The node you pass will not be
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 1b11632..a4cc8e7 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -193,6 +193,8 @@ extern struct device_node *of_get_next_child(const struct
>> device_node *node,
>>  extern struct device_node *of_get_next_available_child(
>>  	const struct device_node *node, struct device_node *prev);
>> 
>> +struct device_node *of_find_child_by_name(struct device_node *parent,
>> +					  const char *name);
>>  #define for_each_child_of_node(parent, child) \
>>  	for (child = of_get_next_child(parent, NULL); child != NULL; \
>>  	     child = of_get_next_child(parent, child))
>> --
>> 1.7.9.5

Can someone review this? If this is okay, can this be merged to the next branch please?

Murali
