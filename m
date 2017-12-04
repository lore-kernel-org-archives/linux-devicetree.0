From: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V5 4/7] OF: properties: Implement get_match_data()
 callback
Date: Mon, 4 Dec 2017 13:05:51 -0500
Message-ID: <590f0536-b73d-ee32-a284-32e564af2f57@codeaurora.org>
References: <1512188864-773-1-git-send-email-okaya@codeaurora.org>
 <1512188864-773-5-git-send-email-okaya@codeaurora.org>
 <CAL_JsqJ+fMqrt6Tk8h6v1fSkrBg+GcMxSXK9XCcz3nmYgyguuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJ+fMqrt6Tk8h6v1fSkrBg+GcMxSXK9XCcz3nmYgyguuQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/4/2017 11:23 AM, Rob Herring wrote:
> On Fri, Dec 1, 2017 at 10:27 PM, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> Now that we have a get_match_data() callback as part of the firmware node,
>> implement the OF specific piece for it.
>>
>> Signed-off-by: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  drivers/of/property.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
..

>>
>> +void *of_fwnode_get_match_data(const struct fwnode_handle *fwnode,
>> +                              const struct device_driver *drv)
>> +{
>> +       const struct device_node *node = to_of_node(fwnode);
>> +       const struct of_device_id *match;
>> +
>> +       if (!node)
>> +               return NULL;
> 
> of_match_node checks this.

I see a check for the matches argument but not for the node argument.
Am I missing something?

> 
>> +
>> +       match = of_match_node(drv->of_match_table, node);
>> +       if (!match)
>> +               return NULL;
>> +
>> +       return (void *)match->data;
> 
> Don't need a cast here.

I can fix this.

> 
> of_device_get_match_data() already does most of this, but getting a
> device ptr from fwnode_handle may not be possible?

I couldn't figure out how to do that. Do you have a suggestion?
I have been looking for examples with no luck.

> 
> Rob
> 


-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
