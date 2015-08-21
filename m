From: Yinghai Lu <yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 43/52] OF/PCI: Add IORESOURCE_MEM_64 for 64-bit resource
Date: Fri, 21 Aug 2015 11:24:04 -0700
Message-ID: <CAE9FiQWYDevQkdF5OU5QTrGpQEtutCqcKbcNrZAhDHZqixYJtg@mail.gmail.com>
References: <1440138067-4314-1-git-send-email-yinghai@kernel.org>
	<1440138067-4314-44-git-send-email-yinghai@kernel.org>
	<CAL_JsqL3pR2U4Fzv0j5Htd2O0cRXVQta-1rOZLkWR9kyz89RuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqL3pR2U4Fzv0j5Htd2O0cRXVQta-1rOZLkWR9kyz89RuA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Wei Yang <weiyang-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, TJ <linux-7m3hRoVZU5A@public.gmane.org>, Yijing Wang <wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 21, 2015 at 11:18 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Aug 21, 2015 at 1:20 AM, Yinghai Lu <yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> For device resource PREF bit setting under bridge 64-bit pref resource,
>> we need to make sure only set PREF for 64bit resource, so set
>> IORESOUCE_MEM_64 for 64bit resource during OF device resource flags
>> parsing.
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=96261
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=96241
>> Signed-off-by: Yinghai Lu <yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>
> My comment from v1[1] is not addressed still.
>
>
> [1] https://lkml.org/lkml/2015/7/10/736

| As the BZ says, we have several identical functions. Can we fix the
| drivers/of/address.c version and remove the Sparc versions. The only
| diff is the generic version converts from be32. I think that should be
| a nop for Sparc.

That would be better to let guys with Sparc or other OF arch to do the
unification.

Yinghai
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
