From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/3] dma: add Qualcomm Technologies HIDMA management driver
Date: Mon, 2 Nov 2015 11:42:20 -0600
Message-ID: <CAL_JsqJYOe+uE1VE_ojSq=Hx=2roW1CAiB2Hyow0tKUR85cV0Q@mail.gmail.com>
References: <1446444460-21600-1-git-send-email-okaya@codeaurora.org>
 <1446444460-21600-2-git-send-email-okaya@codeaurora.org> <CAL_Jsq+XCkaPD_Bop_BaTfEVP2YuOQ+=ChFvyLN47jps2NcZSA@mail.gmail.com>
 <56378D38.9050509@codeaurora.org> <56379CD6.5020807@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56379CD6.5020807-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 2, 2015 at 11:26 AM, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 11/02/2015 10:20 AM, Sinan Kaya wrote:
>>>
>>>
>> Is there a good example I can look or a wiki about the device-tree
>> naming conventions?

There are many examples. Generally, it is the form of:

<vendor>,<chip/soc>-<block name>

>>
>> I'm more of an ACPI person than DTS.
>
>
> I think Rob is talking about something like this:
>
>         compatible="qcom,hidma-mgmt-1.0", "qcom,hidma-mgmt"
>
> This specifies that this is the v1.0 of the HIDMA management engine (or, the
> management engine for the 1.0 HIDMA device).  That way, if in the future
> there's a v1.1, you can do this:
>
>         compatible="qcom,hidma-mgmt-1.1", "qcom,hidma-mgmt"

Except I was suggesting not using 1.0 or 1.1. There is one main
exception and that is Xilinx blocks, but they are releasing versions
of blocks to customers. If "1.0" is not a well defined number, then
don't use that. I'd be surprised if any SOC vendor had such well
defined process around versioning of their IP blocks such that they
are well documented and guaranteed such that every change will change
the version.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
