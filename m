From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v7 3/5] Documentation: Add documentation for the APM
 X-Gene SoC EDAC DTS binding
Date: Wed, 29 Apr 2015 17:47:23 -0700
Message-ID: <CAPw-ZT=t=-Dx2g6-R5B42L=J8=U-kJTSskeUMvKU4SsyRgDJzw@mail.gmail.com>
References: <1430259045-19012-1-git-send-email-lho@apm.com>
	<1430259045-19012-2-git-send-email-lho@apm.com>
	<1430259045-19012-3-git-send-email-lho@apm.com>
	<1430259045-19012-4-git-send-email-lho@apm.com>
	<CAL_Jsq+nhPUxHxrStB9cdy1YzE7tVPFVR1MrWq3Bz-JUa=3Rvg@mail.gmail.com>
	<CAPw-ZTnLR10Zr_p8L3-1nBZ+jKE1HCwERDmO=S5as2GLqime3A@mail.gmail.com>
	<20150429214924.GH5498@pd.tnic>
	<CAPw-ZTmoash48S3F8kBxsovD0mEPYBO8=XDaJ2peDu60yaGrZQ@mail.gmail.com>
	<CAL_JsqL0BMmpVT6hK23ZOhiGRscv1UDYWirA0ik4UZuXf5ku2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqL0BMmpVT6hK23ZOhiGRscv1UDYWirA0ik4UZuXf5ku2Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

>>
>>>> > Similar comments for the rest. I would define memory controller
>>>> > bindings and EDAC driver, then worry about the rest.
>>>>
>>>> Okay.. As comment in following emails, I will break up the driver into
>>>> multiple drivers and focus only on the memory controller driver first.
>>>
>>> Please no multiple EDAC drivers. Or do you mean something else here?
>>
>> We will have the following:
>>
>> xgene-edac-mc.c
>> xgene-edac-pmd.c
>> xgene-edac-l3.c
>> xgene-edac-soc.c
>>
>> Or what would you suggest. There are the following HW:
>>
>> 1. 4 DDR controller with one shared top level interrupt, two shared
>> memory bridges
>
> And ECC registers are in the DDR controllers?
>

Yes... ECC registers are with each DDR controller. That's why I leave
the reg property.


> I would expect the DT to have 4 DDR controller nodes and probably 2
> bridges. The memory bridges have control registers?

Mustang DT does have 4 individual DT nodes for memory controllers. The
2 bridges are used to only determine if the memory controller is
active or not. If not, it just skips the initialization during probe.

>
>> 2. 4 CPU's domain with one shared top level interrupt, shared L2 for
>> two CPU's, and individual L1
>> 3. 1 L3 with one shared top level interrupt
>
> Presumably the registers for ECC are wired to some other block and not
> CPU registers?

Yes... The bus has dedicated 64K block for L2, L1, and L3. That's why
the reg property still there and not shared.

>
>> 4. One SoC memory parity block with one shared top level interupt
>
> Shared interrupts are easily supported, but implicit in the DT.
> Otherwise, it seems this block is independent from the rest, correct?

Interrupts are shared and the status registers are also shared. Yes...
the actual error module is independent. The shared blocks are:

1. Interrupt status (PCP block) - Needed for all subblock IP's
2. CSW, MCB A and MCB B - Needed for each individual memory controller
to determine whether it is active
3. efuse block - used to determine if an CPU domain is disabled
(non-existed in HW)

Anything else need clarification?

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
