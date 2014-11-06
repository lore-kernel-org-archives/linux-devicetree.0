From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v5 2/8] phy: miphy28lp: Add PHY header file for DT x Driver
 defines
Date: Thu, 6 Nov 2014 12:53:40 +0100
Message-ID: <545B6144.2020503@st.com>
References: <1415098284-11182-1-git-send-email-gabriel.fernandez@linaro.org> <1415098284-11182-3-git-send-email-gabriel.fernandez@linaro.org> <545B1C53.9010406@ti.com> <545B3FA4.8040109@st.com> <20141106112825.GC26543@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141106112825.GC26543@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 11/06/2014 12:28 PM, Lee Jones wrote:
> On Thu, 06 Nov 2014, Maxime Coquelin wrote:
>
>> Hi Kishon,
>> On 11/06/2014 07:59 AM, Kishon Vijay Abraham I wrote:
>>> Hi,
>>>
>>> On Tuesday 04 November 2014 04:21 PM, Gabriel FERNANDEZ wrote:
>>>> This provides the shared header file which will be reference from both
>>>> PHY driver and its associated Device Tree node(s).
>>>>
>>>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> ---
>>>>   include/dt-bindings/phy/phy.h | 18 ++++++++++++++++++
>>> I don't see this being used in device tree file. Are you planning to add this
>>> after -rc1 is tagged. Or else I have to create a separate branch for this file
>>> which will be merged by both me and the dt maintainer. Let me know.
>> I think we don't need to create a branch we will merged by both of us.
>>
>> What we can do that both of us apply this patch in our trees.
>> It will avoid dependencies on each others.
>>
>> What do you think?
> This makes no sense to me.  Can you find another way to explain this
> please?

I apply the patch on my STi tree.
Kishon applies the patch on his phy tree.

At the end, both STi and phy branches will be merged in Linus tree,
with no conflicts.

This is what we are doing for the STiH407 reset DT bindings with Philipp Z.

Regards,
Maxime
>
>>> Thanks
>>> Kishon
>>>>   1 file changed, 18 insertions(+)
>>>>   create mode 100644 include/dt-bindings/phy/phy.h
>>>>
>>>> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
>>>> new file mode 100644
>>>> index 0000000..e8c6a3f
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/phy/phy.h
>>>> @@ -0,0 +1,18 @@
>>>> +/*
>>>> + *
>>>> + * This header provides constants for the phy framework
>>>> + *
>>>> + * Copyright (C) 2014 STMicroelectronics
>>>> + * Author: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
>>>> + * License terms:  GNU General Public License (GPL), version 2
>>>> + */
>>>> +
>>>> +#ifndef _DT_BINDINGS_PHY
>>>> +#define _DT_BINDINGS_PHY
>>>> +
>>>> +#define PHY_TYPE_SATA		1
>>>> +#define PHY_TYPE_PCIE		2
>>>> +#define PHY_TYPE_USB2		3
>>>> +#define PHY_TYPE_USB3		4
>>>> +
>>>> +#endif /* _DT_BINDINGS_PHY */
>>>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
