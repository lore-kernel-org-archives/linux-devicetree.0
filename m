From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: add SMP enable-method for Broadcom NSP
Date: Sat, 5 Dec 2015 18:52:43 -0600
Message-ID: <CAL_JsqLQuXzLpFJj7b=_pPN1Tp66P2o69bytxGPHCQu30Qy_CQ@mail.gmail.com>
References: <1448987049-17041-1-git-send-email-kapilh@broadcom.com>
 <1448987049-17041-2-git-send-email-kapilh@broadcom.com> <20151202152604.GA20467@rob-hp-laptop>
 <565F16F1.9070809@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <565F16F1.9070809-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kerne
List-Id: devicetree@vger.kernel.org

On Wed, Dec 2, 2015 at 10:06 AM, Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> Hi Rob,
>
> On 12/2/2015 8:56 PM, Rob Herring wrote:
>> On Tue, Dec 01, 2015 at 11:24:05AM -0500, Kapil Hali wrote:
>>> Add a compatible string "brcm,bcm-nsp-smp" for Broadcom's
>>> Northstar Plus CPU to the 32-bit ARM CPU device tree binding
>>> documentation file and create a new binding documentation for
>>> Northstar Plus CPU.
>>>
>>> Signed-off-by: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  .../bindings/arm/bcm/brcm,nsp-cpu-method.txt       | 39 ++++++++++++++++++++++
>>>  Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
>>>  2 files changed, 40 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
>>> new file mode 100644
>>> index 0000000..bf08872
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
>>> @@ -0,0 +1,39 @@
>>> +Broadcom Northstar Plus SoC CPU Enable Method
>>> +---------------------------------------------
>>> +This binding defines the enable method used for starting secondary
>>> +CPUs in the following Broadcom SoCs:
>>> +  BCM58522, BCM58525, BCM58535, BCM58622, BCM58623, BCM58625, BCM88312
>>> +
>>> +The enable method is specified by defining the following required
>>> +properties in the "cpus" device tree node:
>>> +  - enable-method = "brcm,bcm-nsp-smp";
>>> +  - secondary-boot-reg = <...>;
>>
>> Both of these are supposed to be per cpu core.
>
> 'enable-method' if not found in 'cpu' node is looked at in the 'cpus'
> node. Except for two-three SoC families, 'enable-method' is within
> 'cpus' node. Is my interpretation incorrect? Did I miss anything here?

I'm not sure how you counted, but it is much more than 2-3 that are
correct (including all of PPC). It is quite mixed in dts files, but it
is documented to be per cpu node, so lets follow the documentation
please.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
