From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 39/39] mtd: nand: denali_dt: add compatible strings for
 UniPhier SoC variants
Date: Fri, 2 Dec 2016 10:26:30 -0600
Message-ID: <CAL_Jsq+H-JcAtDV3NCfptCWrmTgkQkmZFTj=Do8HhX4b=At9RA@mail.gmail.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-40-git-send-email-yamada.masahiro@socionext.com>
 <20161201160511.ahlibszokg547wxk@rob-hp-laptop> <CAK7LNASJLbizHEh8mUUVDvTKiRMCSvyYtdrQzwN5tHmCV8iYOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNASJLbizHEh8mUUVDvTKiRMCSvyYtdrQzwN5tHmCV8iYOA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 1, 2016 at 8:54 PM, Masahiro Yamada
<yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> Hi Rob,
> (+CC Dinh)
>
> 2016-12-02 1:05 GMT+09:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>> On Sun, Nov 27, 2016 at 03:06:25AM +0900, Masahiro Yamada wrote:
>>> Add two compatible strings for UniPhier SoCs.  The revision register
>>> on both shows revision 5.0, but they are different hardware.
>>>
>>> Features:
>>>  - DMA engine with 64 bit physical address support
>>>  - 1024 byte ECC step size
>>>  - 8 / 16 / 24 bit ECC strength
>>>  - The n_banks format depends on SoC
>>>
>>> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
>>> ---
>>>
>>>  .../devicetree/bindings/mtd/denali-nand.txt        | 10 +++++--
>>>  drivers/mtd/nand/denali_dt.c                       | 33 ++++++++++++++++++++--
>>>  2 files changed, 38 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>>> index 51fe195..cea46e2 100644
>>> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
>>> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>>> @@ -1,13 +1,19 @@
>>>  * Denali NAND controller
>>>
>>>  Required properties:
>>> -  - compatible : should be "denali,denali-nand-dt"
>>> +  - compatible : should be one of the following:
>>> +      "denali,denali-nand-dt"
>>
>> There are multiple things wrong with this string. denali,denali is
>> redundant is one.
>
> One more redundancy; "-dt" is weird because
> DT compatible should be a name of hardware.
>
>
>> It's also fairly useless as this IP has several
>> versions and numerous configuration options IIRC. This should be
>> deprecated IMO.
>
> Right.  There are several customizable parameters for this IP,
> so a generic compatible string like this is probably useless.
>
> This DT binding was added by commit 30f9f2f for Altera SOCFPGA,
> A funny thing is that they upstreamed DT binding, but they did not upstream
> needed changes for the Denali driver core.
> So, the mainline driver has never worked on SOCFPGA
> (or any of DT-based SoCs).
>
>
>
>>> +      "denali,denali-nand-uniphier-v5a"
>>> +      "denali,denali-nand-uniphier-v5b"
>>
>> Use your vendor prefix, not denali. The 2nd denali can probably be
>> dropped because it is not likely you have another kind of nand
>> controller in the SoC.
>
> Hmm, your statement implies that a vendor prefix
> belongs to an SoC vendor, not an IP vendor.
> (I was not quite sure about this.)

Right. We do have some IP vendor strings, but they are usually
fallbacks. Sometimes, I guess they are useful, but IMO over time they
prove to not be useful.

> It is unlikely to happen to have two different NAND controllers on one SoC.
> But, we used a different NAND controller for our SoC family before
> introducing the Denali IP.
> It also implies that Socionext may use a different NAND IP in the future.
> I'd like to include "denali" somewhere because it is clearly associated with
> the driver name.
> Also, this will give an idea what kind of _basic_ hardware is used,
> even though we know various parameters are customizable.
>
>
>
> (Plan A)
>   "denali,socfpga-nand"           (for Altera SOCFPGA variant)
>   "denali,uniphier-nand-v1"       (for old Socionext UniPhier family variant)
>   "denali,uniphier-nand-v2"       (for new Socionext UniPhier family variant)
>
> (Plan B)
>   "altera,denali-nand"            (for Altera SOCFPGA variant)
>   "socionext,denali-nand-v5a"     (for old Socionext UniPhier family variant)
>   "socionext,denali-nand-v5b"     (for new Socionext UniPhier family variant)

Let the Altera folks worry about their stuff. At least for soft IP in
FPGA, it's a bit of a special case. The old string can remain as bad
as it is. I simply would do "socionext,uniphier-v5b-nand" (and v5a).
The fact that it is denali is part of the documentation.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
