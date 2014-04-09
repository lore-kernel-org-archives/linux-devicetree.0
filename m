From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: socfpga: dts: add reset-controller
Date: Wed, 09 Apr 2014 12:05:16 +0200
Message-ID: <73k3ay3jj7.fsf@unicorn.hi.pengutronix.de>
References: <1396629087-23727-1-git-send-email-s.trumtrar@pengutronix.de> <1396629087-23727-4-git-send-email-s.trumtrar@pengutronix.de> <1396905121.25236.2.camel@linux-builds1> <20140407224110.GA28399@pengutronix.de> <53435F37.7060301@gmail.com> <73mwfu3nly.fsf@unicorn.hi.pengutronix.de> <1397034967.4418.4.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1397034967.4418.4.camel-+qGW7pzALmz7o/J7KWpOmN53zsg1cpMQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> Am Mittwoch, den 09.04.2014, 10:37 +0200 schrieb Steffen Trumtrar:
>> Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>> 
>> > On 4/7/14 5:41 PM, Steffen Trumtrar wrote:
>> >> On Mon, Apr 07, 2014 at 04:12:01PM -0500, Dinh Nguyen wrote:
>> >>> On Fri, 2014-04-04 at 18:31 +0200, Steffen Trumtrar wrote:
>> >>>> Add the necessary #reset-cells property to the rst-mgr node and
>> >>>> provide a header-file with all possible resets specified.
>> >>>>
>> >>>> Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> >>>> ---
>> >>>>  arch/arm/boot/dts/socfpga.dtsi           |  8 ++-
>> >>>>  include/dt-bindings/reset/altr,rst-mgr.h | 90 ++++++++++++++++++++++++++++++++
>> >>> Does this file belong under dt-bindings/reset/ or
>> >>> dt-bindings/reset-controller/?
>> >>>
>> >> ATM there is no such directory, or is there ?
>> >> So, reset seems appropriate I think.
>> > commit [6b7f06 ARM: STi: STiH415: Add reset controller support.]
>> > Seems more appropriate for this to go into reset-controller.
>> >
>> 
>> Okay, the current mainline master now has include/dt-bindings/reset and
>> include/dt-bindings/reset-controller.
>> 
>> I think one of those directories shouldn't be there, but be merged in
>> the other instead. But which one? Where shall I put my precious code?
>
> My vote would be for dt-bindings/reset/, since that's shorter and
> 2ec941304df9e1cd5e2f2404303a5fab0929969a came before
> 6b7f06cc805bb4755e69cd916b3f565947e0a77a.
>

Agreed.

Regards,
Steffen

-- 
Pengutronix e.K.                           | Steffen Trumtrar            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
