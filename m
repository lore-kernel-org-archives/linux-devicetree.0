From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/7] USB chipidea: introduce dual role mode pdata flags
Date: Tue, 4 Jun 2013 18:09:52 +0800
Message-ID: <CAL411-pyrFXxyEX_GAFRS5ubh_Pf2yWLZXYC3PJevu1WSJS78g@mail.gmail.com>
References: <1370025529-7414-1-git-send-email-mgr@pengutronix.de>
 <1370025529-7414-5-git-send-email-mgr@pengutronix.de> <87zjv7id52.fsf@ashishki-desk.ger.corp.intel.com>
 <CAL411-pMnJC55M3n5bAuffH3pwRZTzhBfDiEfT+egtGN29c7uw@mail.gmail.com> <87ehcii5n0.fsf@ashishki-desk.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87ehcii5n0.fsf-qxRn5AmX6ZD9BXuAQUXR0fooFf0ArEBIu+b9c/7xato@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 4, 2013 at 5:31 PM, Alexander Shishkin
<alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> On Mon, Jun 3, 2013 at 8:37 PM, Alexander Shishkin
>> <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>>> Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
>>>
>>>> From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>>>
>>>> Even if a chipidea core is otg capable the board may not. This allows
>>>
>>> "may not be"
>>>
>>>> to explicitly set the core to host/peripheral mode. Without these
>>>> flags the driver falls back to the old behaviour.
>>>>
>>>> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>>> ---
>>>
>>> [snip]
>>>
>>>> +     if (!ci->platdata->dr_mode)
>>>> +             ci->platdata->dr_mode = of_usb_get_dr_mode(dev->of_node);
>>>
>>> same as previous one, let's keep it in the platform.
>>
>> Alex, have you made the conclusion with Felipe, whether we need DT support
>> at core driver to handle such kinds of things or use platform data is ok?
>> Last time, I remember he disagreed the way this patch uses.
>
> He wanted everything to be fetched from the core driver, I wanted
> most things to be fetched from the platform driver, we never came to a
> common denominator, though. This (and the other one) patch is made to
> fetch phy_mode and dr_mode from the core if it's not passed from the
> platform driver, so pretty much Felipe's idea. The more I think about it
> now, the more it makes sense to me too. For instance, this way we can
> avoid any extra boilerplate platform code.
>
> So, we're going to have it this way for now.
>

For this patch, there may be wrong since it wants get the phy_mode and dr_mode
from the core DT node, but seems there is no core DT node at all, and the device
tree binding doc add dr_mode is for gluy layer.

OK, so you have accepted the way we pass something from glue layer DT
node, and using
ci->platdata->xxx (dr_mode, phy_mode, vbus, force_full_speed, etc) at
core driver, right?



--
BR,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
