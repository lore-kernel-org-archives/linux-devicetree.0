From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: devicetree: avoid duplicated matching code (was: Re: [PATCH 1/3]
 xhci: plat: adapt to unified device property interface)
Date: Fri, 22 Apr 2016 08:25:51 -0500
Message-ID: <CAL_JsqLh76fPT0CWo6r=5TGJebXO5sLZ-BOtGZ=-fd1+n5S5eA@mail.gmail.com>
References: <1461064246-27350-1-git-send-email-heikki.krogerus@linux.intel.com>
 <1461064246-27350-2-git-send-email-heikki.krogerus@linux.intel.com>
 <87fuuf9pip.fsf@intel.com> <CAL_JsqLVAN_dEcGUbNyiBjFJTSPSPjMKzWG9QBoJ71whpfmBiA@mail.gmail.com>
 <874mav9i9z.fsf@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <874mav9i9z.fsf-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 21, 2016 at 8:57 AM, Felipe Balbi
<felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>
> Hi,
>
> Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
>> On Thu, Apr 21, 2016 at 6:20 AM, Felipe Balbi
>> <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>>>
>>> Hi,
>>>
>>> Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:
>>>> @@ -197,7 +196,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
>>>>       }
>>>>
>>>>       xhci = hcd_to_xhci(hcd);
>>>> -     match = of_match_node(usb_xhci_of_match, node);
>>>> +     match = of_match_node(usb_xhci_of_match, pdev->dev.of_node);
>>>
>>> Rob, it's weird that OF-based drivers have to redo the same matching
>>> which was already done by drivers/base/platform.c::platform_match() just
>>> to get match->data. If we know we matched, couldn't we just cache a
>>> pointer to match->data in struct device_node.data ? Something like
>>> below? (completely untested)
>>
>> Yes, it is. AIUI, there is some sort of race condition in doing what
>> you suggest though. IIRC, Grant did that and reverted it if you look
>> at the git history.
>
> looking at drivers/base/platform.c I can't find anything along these
> lines. Adding Grant.
>
> Grant, any memory left of this race ?

https://lkml.org/lkml/2011/5/18/384

tl;dr: matching and probe is not atomic.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
