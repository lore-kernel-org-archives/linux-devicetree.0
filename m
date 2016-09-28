From: Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>
Subject: Re: [PATCH v3 1/3] ipmi: add an Aspeed BT IPMI BMC driver
Date: Wed, 28 Sep 2016 08:53:07 -0500
Message-ID: <85dc3a75-46e0-87ec-91d5-31e686103ee0@acm.org>
References: <1474354900-5618-1-git-send-email-clg@kaod.org>
 <1474354900-5618-2-git-send-email-clg@kaod.org>
 <20160923183421.GA14864@rob-hp-laptop>
 <c3f084ab-9f77-86ab-7875-cbfe654ea18e@kaod.org>
Reply-To: minyard-HInyCGIudOg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c3f084ab-9f77-86ab-7875-cbfe654ea18e-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/26/2016 01:50 AM, Cédric Le Goater wrote:
>
>>>   Changes since v1:
>>>
>>>   - replace 'bt_host' by 'bt_bmc' to reflect that the driver is
>>>     the BMC side of the IPMI BT interface
>>>   - renamed the device to 'ipmi-bt-host'
>>>   - introduced a temporary buffer to copy_{to,from}_user
>>>   - used platform_get_irq()
>>>   - moved the driver under drivers/char/ipmi/ but kept it as a misc
>>>     device
>>>   - changed the compatible cell to "aspeed,ast2400-bt-bmc"
>>>
>>>   .../bindings/char/ipmi/aspeed,ast2400-bt-bmc.txt   |  23 +
>> While similar, this is not the kernel directory structure. Just make
>> this bindings/ipmi/
>>
>> With that,
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> OK. So I suppose we should be moving all IPMI documentation under
> the same directory.
>
>
> Corey,
>
> If the move is okay for you, I can send the patch below.
>
> Thanks,
>
> C.

Sorry this took so long, I'm at a conference.  That change is fine, it does
seem to match the structure better.

-corey
>
>  From ca25f89b25209c260480cda5e5532d6bbe83ed43 Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
> Date: Mon, 26 Sep 2016 08:45:15 +0200
> Subject: [PATCH] dt-bindings: ipmi: move all documentation under
>   bindings/ipmi/
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
>
> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
> ---
>   .../devicetree/bindings/{char => }/ipmi/aspeed,ast2400-bt-bmc.txt         | 0
>   Documentation/devicetree/bindings/{ipmi.txt => ipmi/ipmi-smic.txt}        | 0
>   2 files changed, 0 insertions(+), 0 deletions(-)
>   rename Documentation/devicetree/bindings/{char => }/ipmi/aspeed,ast2400-bt-bmc.txt (100%)
>   rename Documentation/devicetree/bindings/{ipmi.txt => ipmi/ipmi-smic.txt} (100%)
>
> diff --git a/Documentation/devicetree/bindings/char/ipmi/aspeed,ast2400-bt-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-bt-bmc.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/char/ipmi/aspeed,ast2400-bt-bmc.txt
> rename to Documentation/devicetree/bindings/ipmi/aspeed,ast2400-bt-bmc.txt
> diff --git a/Documentation/devicetree/bindings/ipmi.txt b/Documentation/devicetree/bindings/ipmi/ipmi-smic.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/ipmi.txt
> rename to Documentation/devicetree/bindings/ipmi/ipmi-smic.txt


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
