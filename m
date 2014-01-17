From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH] of: fix of_update_property()
Date: Fri, 17 Jan 2014 18:42:47 +0200
Message-ID: <07586E1B-FDB0-4D91-8467-15E9435FD9CD@antoniou-consulting.com>
References: <1389933996-19306-1-git-send-email-Li.Xiubo@freescale.com> <CAL_JsqJuAv8=pBuzYO5ZGzroD1kq6gjmNsTjoVyXR=vcu+-pTA@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJuAv8=pBuzYO5ZGzroD1kq6gjmNsTjoVyXR=vcu+-pTA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,


On Jan 17, 2014, at 4:49 PM, Rob Herring wrote:

> On Thu, Jan 16, 2014 at 10:46 PM, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> The of_update_property() is intent to update a property in a node
> 
[ snip ]

>>                return of_add_property(np, newprop);
> 
> Isn't there also a race that if you do 2 updates for a non-existent
> property and both threads try to add the property, the first one will
> succeed and the 2nd will fail. The 2nd one needs to retry as well.
> 
> Also, couldn't the node itself be removed while trying to do the update?
> 
> There seem to be multiple problems with this code, but doing multiple
> simultaneous, conflicting updates seems like an unlikely case.
> 

There are multiple problems with this function.

First of all, the firing of the notifier at the beginning with OF_RECONFIG_UPDATE_PROPERTY
even though we have no idea if the property is found.

The locking is no good; the lock should be taken before the search by switching to using
__of_find_property. Threading is just not handled well at all at the moment. 
Retrying is just bogus.

The biggest problem is the semantics; IMHO we should just remove the option to create
a property if it doesn't exist. I don't think there are many callers that use update property
expecting to be created if it doesn't exist.

> Rob
> 
>> @@ -1593,7 +1594,7 @@ int of_update_property(struct device_node *np, struct property *newprop)
>>        raw_spin_unlock_irqrestore(&devtree_lock, flags);
>> 
>>        if (!found)
>> -               return -ENODEV;
>> +               goto retry;
>> 
>> #ifdef CONFIG_PROC_DEVICETREE
>>        /* try to add to proc as well if it was initialized */
>> --
>> 1.8.4
>> 
>> 

Regards

-- Pantelis--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
