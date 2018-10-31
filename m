From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of/platform: Support dynamic device tree on AMBA bus
Date: Wed, 31 Oct 2018 09:06:25 -0700
Message-ID: <cc737181-6936-fd9c-988a-e142368deeee@gmail.com>
References: <1540485597-12240-1-git-send-email-jaewon02.kim@samsung.com>
 <25f61a9b-af37-18b1-9975-cb4ccbbb3aa7@gmail.com>
 <6946c801-0ea3-d980-ebe0-12eb5a9d2186@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6946c801-0ea3-d980-ebe0-12eb5a9d2186@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jaewon Kim <jaewon02.kim@gmail.com>, Rob Herring <robh+dt@kernel.org>, Jaewon Kim <jaewon02.kim@samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/31/18 8:32 AM, Jaewon Kim wrote:
> Hi Frank,
> 
> 
> Thanks to review my patch.
> 
> On 18. 10. 31. 오전 8:04, Frank Rowand wrote:
>> Hi Jaewon,
>>
>> On 10/25/18 9:39 AM, Jaewon Kim wrote:
>>> This patch supports dynamic device-tree for AMBA device.
>> Add AMBA devices and buses to of_platform_notify() so that dynamic device-tree
>> will support AMBA.
> 
> What is meaning of this comment?
> 
> I already adds AMBA to of_platform_notify().

I was trying to make the commit comment more explanatory.  (And finding it difficult
to remain brief, yet meaningful.)  The original patch header comment did not tell me
why the patch changes added support of dynamic devicetree on AMBA - I had to read the
patch before I understood what it did.  If you can think of better words than I
suggested, please come up with different wording.

My intent with this sentence was that more explanation needed to be added to the
comment, not that the code needed to change in any way other than what I noted
in-line inside the patch.  Does this make things more clear, or am I misunderstanding
your question?

-Frank


> 
>>
>>> The AMBA device must be registered on the AMBA bus, not the platform bus.
>>>
>>> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
>>> ---
>>>   drivers/of/platform.c | 93 ++++++++++++++++++++++++++++++++++++++++-----------
>>>   1 file changed, 73 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>>> index 04ad312..b9ac105 100644
>>> --- a/drivers/of/platform.c
>>> +++ b/drivers/of/platform.c
>>> @@ -286,6 +286,22 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
>>>       of_node_clear_flag(node, OF_POPULATED);
>>>       return NULL;
>>>   }
>>> +
>>> +/**
>>> + * of_find_amba_device_by_node - Find the amba_device associated with a node
>>> + * @np: Pointer to device tree node
>>> + *
>>> + * Returns amba_device pointer, or NULL if not found
>>> + */
>>> +struct amba_device *of_find_amba_device_by_node(struct device_node *np)
>>> +{
>>> +    struct device *dev;
>>> +
>>> +    dev = bus_find_device(&amba_bustype, NULL, np, of_dev_node_match);
>>> +    return dev ? to_amba_device(dev) : NULL;
>>> +}
>>> +EXPORT_SYMBOL(of_find_amba_device_by_node);
>>> +
>>>   #else /* CONFIG_ARM_AMBA */
>>>   static struct amba_device *of_amba_device_create(struct device_node *node,
>>>                            const char *bus_id,
>>> @@ -294,6 +310,12 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
>>>   {
>>>       return NULL;
>>>   }
>>> +
>>> +struct amba_device *of_find_amba_device_by_node(struct device_node *np)
>>> +{
>>> +    return NULL;
>>> +}
>>> +EXPORT_SYMBOL(of_find_amba_device_by_node);
>>>   #endif /* CONFIG_ARM_AMBA */
>>>     /**
>>> @@ -665,6 +687,7 @@ static int of_platform_notify(struct notifier_block *nb,
>>>   {
>>>       struct of_reconfig_data *rd = arg;
>>>       struct platform_device *pdev_parent, *pdev;
>>> +    struct amba_device *adev_p, *adev;
>>>       bool children_left;
>>>         switch (of_reconfig_get_state_change(action, rd)) {
>>> @@ -677,17 +700,34 @@ static int of_platform_notify(struct notifier_block *nb,
>>>           if (of_node_check_flag(rd->dn, OF_POPULATED))
>>>               return NOTIFY_OK;
>>>   -        /* pdev_parent may be NULL when no bus platform device */
>>> -        pdev_parent = of_find_device_by_node(rd->dn->parent);
>>> -        pdev = of_platform_device_create(rd->dn, NULL,
>>> -                pdev_parent ? &pdev_parent->dev : NULL);
>>> -        of_dev_put(pdev_parent);
>>> -
>>> -        if (pdev == NULL) {
>>> -            pr_err("%s: failed to create for '%pOF'\n",
>>> -                    __func__, rd->dn);
>>> -            /* of_platform_device_create tosses the error code */
>>> -            return notifier_from_errno(-EINVAL);
>>> +        if (of_device_is_compatible(rd->dn, "arm,primecell")) {
>>> +            /* adev_p may be NULL when no bus amba device */
>>> +            adev_p = of_find_amba_device_by_node(rd->dn->parent);
>>> +            adev = of_amba_device_create(rd->dn, NULL, NULL,
>>> +                    adev_p ? &adev_p->dev : NULL);
>>> +
>>> +            if (adev_p)
>>> +                put_device(&adev_p->dev);
>> Please follow the same model as of_dev_put() here, create a new function
>> of_amba_dev_put() to implement these two lines.
> Okay, I will create of_amba_dev_put() function.
>>
>>
>>> +
>>> +            if (adev == NULL) {
>>> +                pr_err("%s: failed to create for '%s'\n",
>>> +                        __func__, rd->dn->full_name);
>>> +                /* of_amba_device_create tosses the error */
>>> +                return notifier_from_errno(-EINVAL);
>>> +            }
>>> +        } else {
>>> +            /* pdev_parent may be NULL when no bus platform device*/
>>> +            pdev_parent = of_find_device_by_node(rd->dn->parent);
>>> +            pdev = of_platform_device_create(rd->dn, NULL,
>>> +                    pdev_parent ? &pdev_parent->dev : NULL);
>>> +            of_dev_put(pdev_parent);
>>> +
>>> +            if (pdev == NULL) {
>>> +                pr_err("%s: failed to create for '%pOF'\n",
>>> +                        __func__, rd->dn);
>>> +                /* of_platform_device_create tosses the error */
>>> +                return notifier_from_errno(-EINVAL);
>>> +            }
>>>           }
>>>           break;
>>>   @@ -698,15 +738,28 @@ static int of_platform_notify(struct notifier_block *nb,
>>>               return NOTIFY_OK;
>>>             /* find our device by node */
>>> -        pdev = of_find_device_by_node(rd->dn);
>>> -        if (pdev == NULL)
>>> -            return NOTIFY_OK;    /* no? not meant for us */
>>> -
>>> -        /* unregister takes one ref away */
>>> -        of_platform_device_destroy(&pdev->dev, &children_left);
>>> -
>>> -        /* and put the reference of the find */
>>> -        of_dev_put(pdev);
>>> +        if (of_device_is_compatible(rd->dn, "arm,primecell")) {
>>> +            adev = of_find_amba_device_by_node(rd->dn);
>>> +            if (adev == NULL)
>>> +                return NOTIFY_OK; /* no? not meant for us */
>>> +
>>> +            /* unregister takes one ref away */
>>> +            of_platform_device_destroy(&adev->dev, &children_left);
>>> +
>>> +            /* and put the reference of the find */
>>> +            if (adev)
>>> +                put_device(&adev->dev);
>> of_amba_dev_put() here also
>>
>> -Frank
> Okay, I will create it.
>>
>>> +        } else {
>>> +            pdev = of_find_device_by_node(rd->dn);
>>> +            if (pdev == NULL)
>>> +                return NOTIFY_OK; /* no? not meant for us */
>>> +
>>> +            /* unregister takes one ref away */
>>> +            of_platform_device_destroy(&pdev->dev, &children_left);
>>> +
>>> +            /* and put the reference of the find */
>>> +            of_dev_put(pdev);
>>> +        }
>>>           break;
>>>       }
>>>  
> Thanks
> 
> Jaewon Kim
> 
> 
