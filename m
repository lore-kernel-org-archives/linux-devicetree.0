From: Laura Abbott <labbott-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] of: of_reserved_mem: Ensure cma reserved region not
 cross the low/high memory
Date: Wed, 14 Dec 2016 14:21:26 -0800
Message-ID: <833f99b1-d10b-27ba-e0f9-a7c6398fb63d@redhat.com>
References: <1479901021-25064-1-git-send-email-jason.hui.liu@nxp.com>
 <CAL_JsqLHh96D0VULuYfYC1P5K_Bbz6iRjizuYP3Mb6bdERbDnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLHh96D0VULuYfYC1P5K_Bbz6iRjizuYP3Mb6bdERbDnA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jason Liu <jason.hui.liu-3arQi8VN3Tc@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/14/2016 12:45 PM, Rob Herring wrote:
> On Wed, Nov 23, 2016 at 5:37 AM, Jason Liu <jason.hui.liu-3arQi8VN3Tc@public.gmane.org> wrote:
>> Need ensure the cma reserved region not cross the low/high memory boundary
>> when using the dynamic allocation methond through device-tree, otherwise,
>> kernel will fail to boot up when cma reserved region cross how/high mem.
> 
> The kernel command line code setting CMA already deals with this. Why
> don't we just call the CMA code (cma_declare_contiguous) to deal with
> this?
> 
> Rob
> 

That was proposed in the first version[1] but I think this is a generic
problem not specific to CMA. Even non-CMA reservations trying to span
zones could cause problems so the devicetree allocation code should
restrict reservations to a single zone.

Thanks,
Laura


[1] https://marc.info/?l=linux-kernel&m=147928325113103&w=2
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
