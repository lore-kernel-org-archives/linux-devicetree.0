From: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: socfpga: dts: add reset-controller
Date: Mon, 07 Apr 2014 21:30:15 -0500
Message-ID: <53435F37.7060301@gmail.com>
References: <1396629087-23727-1-git-send-email-s.trumtrar@pengutronix.de> <1396629087-23727-4-git-send-email-s.trumtrar@pengutronix.de> <1396905121.25236.2.camel@linux-builds1> <20140407224110.GA28399@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140407224110.GA28399-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 4/7/14 5:41 PM, Steffen Trumtrar wrote:
> On Mon, Apr 07, 2014 at 04:12:01PM -0500, Dinh Nguyen wrote:
>> On Fri, 2014-04-04 at 18:31 +0200, Steffen Trumtrar wrote:
>>> Add the necessary #reset-cells property to the rst-mgr node and
>>> provide a header-file with all possible resets specified.
>>>
>>> Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/socfpga.dtsi           |  8 ++-
>>>  include/dt-bindings/reset/altr,rst-mgr.h | 90 ++++++++++++++++++++++++++++++++
>> Does this file belong under dt-bindings/reset/ or
>> dt-bindings/reset-controller/?
>>
> ATM there is no such directory, or is there ?
> So, reset seems appropriate I think.
commit [6b7f06 ARM: STi: STiH415: Add reset controller support.]
Seems more appropriate for this to go into reset-controller.

Dinh
>
> But this reminds me, that I wanted to move the binding documentation from
> Documentation/devicetree/bindings/arm/altera/socfpga-reset.txt ->
> Documentation/devicetree/bindings/reset/socfpga-reset.txt
>
> I will have to add a patch for that to the series in v2.
>
> Thanks,
> Steffen
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
