From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 3.6.0-rc5] dt: introduce of_get_child to get child node
 by name.
Date: Fri, 14 Sep 2012 07:55:38 +0100
Message-ID: <5052D4EA.60108@st.com>
References: <1347534640-787-1-git-send-email-srinivas.kandagatla@st.com>
 <505242C3.7090006@gmail.com>
Reply-To: srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <505242C3.7090006-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: bergner-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13/09/12 21:32, Rob Herring wrote:
> On 09/13/2012 06:10 AM, Srinivas KANDAGATLA wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
>>
>> This patch introduces of_get_child function to get a child node by its
>> name in a given parent node.
>>
>> Without this patch each driver code has to iterate the parent and do
>> a string compare, However having of_get_child libary function would
>> avoid code duplication, errors and is more convenient.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
>> ---
>>  drivers/of/base.c  |   27 +++++++++++++++++++++++++++
>>  include/linux/of.h |    2 ++
>>  2 files changed, 29 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index d4a1c9a..d4b6840 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -391,6 +391,33 @@ struct device_node *of_get_next_available_child(const struct device_node *node,
>>  EXPORT_SYMBOL(of_get_next_available_child);
>>  
>>  /**
>> + *	of_get_child - Find the child node by name for given parent
>> + *	@node:	parent node
>> + *	@name:	child name to look for.
>> + *
>> + *      This function looks for child node for given matching name
>> + *
>> + *	Returns a node pointer if found, with refcount incremented, use
>> + *	of_node_put() on it when done.
>> + *	else returns NULL.
>> + */
>> +
>> +struct device_node *of_get_child(const struct device_node *node,
> of_get_child_by_name would be more consistent naming with other apis.
I agree.
>> +				const char *name)
>> +{
>> +	struct device_node *child;
>> +
>> +	read_lock(&devtree_lock);
> I don't think you need the lock here. The for_each takes the lock while
> finding the node.
yes, you are correct. We don't need a readlock here.

>> +	for_each_child_of_node(node, child)
>> +		if (child->name && (of_node_cmp(child->name, name) == 0)
>> +			&& of_node_get(child))
>> +			break;
>> +	read_unlock(&devtree_lock);
>> +	return child;
>> +}
>> +EXPORT_SYMBOL(of_get_child);
>> +
>> +/**
>>   *	of_find_node_by_path - Find a node matching a full OF path
>>   *	@path:	The full path to match
>>   *
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 1b11632..510e1fe 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -192,6 +192,8 @@ extern struct device_node *of_get_next_child(const struct device_node *node,
>>  					     struct device_node *prev);
>>  extern struct device_node *of_get_next_available_child(
>>  	const struct device_node *node, struct device_node *prev);
>> +extern struct device_node *of_get_child(const struct device_node *node,
>> +					const char *name);
>>  
>>  #define for_each_child_of_node(parent, child) \
>>  	for (child = of_get_next_child(parent, NULL); child != NULL; \
>>
>
>
