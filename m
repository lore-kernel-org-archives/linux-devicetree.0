From: Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>
Subject: Re: [PATCH] ipmi: bt-bmc: Add ast2500 compatible string
Date: Tue, 28 Mar 2017 21:16:47 -0500
Message-ID: <f40a2070-b6cc-75fb-a2dc-d497aa594229@acm.org>
References: <20170322140112.2479-1-joel@jms.id.au>
 <20170329012224.jeil7uxvi2iefzvh@rob-hp-laptop>
Reply-To: minyard-HInyCGIudOg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170329012224.jeil7uxvi2iefzvh@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/28/2017 08:22 PM, Rob Herring wrote:
> On Thu, Mar 23, 2017 at 12:31:12AM +1030, Joel Stanley wrote:
>> The ast2500 SoCs contain the same IPMI BT device.
>>
>> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt | 4 +++-
>>   drivers/char/ipmi/bt-bmc.c                                        | 1 +
>>   2 files changed, 4 insertions(+), 1 deletion(-)
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

This is in the IPMI tree for the next kernel.

Thanks all,

-corey

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
