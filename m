From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] mfd: core: introduce of_node_name for mfd sub devices
Date: Thu, 19 Sep 2013 14:27:41 +0530
Message-ID: <523ABC85.5030607@nvidia.com>
References: <1379579392-1794-1-git-send-email-ldewangan@nvidia.com> <20130919083050.GH16984@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130919083050.GH16984@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 19 September 2013 02:00 PM, Lee Jones wrote:
> On Thu, 19 Sep 2013, Laxman Dewangan wrote:
>
>> Multi Function Devices (MFDs) have multiple sub module whose driver is
>> developed in different sub-system like GPIO, regulators, RTC, clock etc.
>> The device tree of such device contains multiple sub-node which contains
>> the properties of these sub-modules.
>>
>> The sub module gets of_node handle either by the dev->of_node or by getting
>> the child node handle from parent DT handle by finding child name on parent's
>> of_node.
>>
>> To provide the of_node of sub-module directly, currently there is only one
>> approach:
>> - Add compatible value when defining the sub-module in mfd core and
>>    add this properties when adding DT.
>>
>> Introduce the of_node_name of each sub devices which is set when defining
>> the mfd_cells of the sub devices and get the handle of these child node
>> when adding the mfd_devices by getting the sub-node handle with matching
>> the node name getting the sub-node handle with matching the node name.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> Creating this patch based on the discussion on patch
>> [PATCH 1/4] mfd: add support for AMS AS3722 PMIC
>> The discussion on above patch is not concluded and want to have
>> further discussion on this patch.
> I'm not entirely sure this is what Mark was saying. I think he was
> complaining about the existence of the sub-nodes rather than how the
> MFD Core assigns their of_node.

Yes, Mark is only saying that he is not comfortable with the compatible 
until it is ip based driver.
I wanted to continue the discussion to find out the acceptable way so 
that I can use this in as3722 driver.

I added the of_node_name because each sub-driver gets its sub node by 
finding child node name from parent and hence duplicated the code on 
each driver.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
