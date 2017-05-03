From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 2/5] mtd: nand: gpmi: add i.MX 7 SoC support
Date: Wed, 03 May 2017 14:24:06 -0700
Message-ID: <db9527e36a4e23984df3c867ba494c9a@agner.ch>
References: <20170421010755.18025-1-stefan@agner.ch>
 <20170421010755.18025-3-stefan@agner.ch>
 <af3fe671-c5fb-d3cf-c891-e6b7c973baa1@gmail.com>
 <5cf26d2b020392c875464c7504a9fb5b@agner.ch>
 <8377dadc-043f-5932-cb13-3367db38a6dd@gmail.com>
 <494a7bc044457240a302d92b3a50b8e5@agner.ch>
 <57336d7e-7b48-8855-9e87-3eb370facd05@gmail.com>
 <a9cdc47795433e7b152dcdd123f9bd63@agner.ch>
 <CA+EcR20FCPSec+ihTMA=SGwogd7p5tsnECCp3CR-Nv6fUciK4g@mail.gmail.com>
 <20170502111758.53e9a959@bbrezillon>
 <d0162bbe-c2de-73d1-0d37-9bdd68ceb94b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d0162bbe-c2de-73d1-0d37-9bdd68ceb94b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Han Xu <xhnjupt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-05-02 04:18, Marek Vasut wrote:
> On 05/02/2017 11:17 AM, Boris Brezillon wrote:
>> Hi Han,
>>
>> On Fri, 21 Apr 2017 13:29:16 -0500
>> Han Xu <xhnjupt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>>>>>
>>>>>>>> But then, adding the type would only require 2-3 lines of change if I
>>>>>>>> add it to the GPMI_IS_MX6 macro...
>>>>>>>
>>>>>>> Then at least add a comment because using type = IMX6SX right under
>>>>>>> gpmi_data_mx7d can trigger some head-scratching. And put my R-B on V2.
>>>>>>
>>>>>> FWIW, I mentioned it in the commit message.
>>>>>>
>>>>>> I think rather then adding a comment it is cleaner to just add IS_IMX7D
>>>>>> and add it to the GPMI_IS_MX6 macro. That does not need a comment since
>>>>>> it implicitly says we have a i.MX 7 but treat it like i.MX 6 and it is a
>>>>>> rather small change. Does that sound acceptable?
>>>>>
>>>>> Sure, that's even better, thanks.
>>>>>
>>>>> btw isn't there some single-core mx7 (mx7s ?) , maybe we should just go
>>>>> with mx7 (without the d suffix). I dunno if it has GPMI NAND though, so
>>>>> maybe mx7d is the right thing to do here ...
>>>>>
>>>>
>>>> There is a Solo version yes, and it has GPMI NAND too. However, almost
>>>> all i.MX 7 IPs have been named imx7d by NXP for some reason (including
>>>> compatible strings, see grep -r -e imx7 Documentation/), so I thought I
>>>> stay consistent here...
> 
> I missed the DT bit, sorry. the DT bindings say:
>   - compatible : should be "fsl,<chip>-gpmi-nand"
> so if FSL invented their own buggy bindings, they need to get them
> through Rob :) IMO for MX7, this should be "imx7-gpmi-nand" , unless
> there's some incentive to discern the solo/dual chips and/or there
> is a future imx7 coming up with different GPMI NAND block version.
> 

There is no incentive to discern solo/dual, afaict this are the same
chips, only some IP's "fused away"... From GPMI NAND perspective, they
are definitely the same.

So that leaves us with "imx7-gpmi-nand" vs. "imx7d-gpmi-nand".

All device tree compatible strings as well as Kconfig symbol,
preprocessor defines and function prefixes have been named "imx7d" or
IMX7D so far... Although they work just fine for i.MX7 Solo too... Not
sure why that exactly ended up to be that way, but I guess the reason
was that NXP started to upstream with the dual...

For the sake of continuity, I would prefer if we stick to that (as my
current patchsets do)... It is like imx6q, which also works for dual...

$ grep -r -w compatible.*imx7d  arch/arm/boot/dts/*.dts* | wc -l
68
$ grep -r -w compatible.*imx7^d  arch/arm/boot/dts/*.dts* | wc -l
0


>>> Hi Guys,
>>>
>>> Yes, there should be a i.MX7 Solo version with one core fused out. IMO, can
>>> we use QUIRK to distinguish them rather than SoC name. I know I also sent
>>> some patch set with SoC Name but I prefer to use QUIRK now.
>>
>> Not sure what this means. Are you okay with Stefan's v2?
> 
> IMO the GPMI controller in solo and dual should be the same, so there's
> no need to have quirks for it.

Agreed.

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
