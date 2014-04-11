From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dt-binding: fix GIC example
Date: Fri, 11 Apr 2014 08:20:47 -0500
Message-ID: <CAL_Jsq+-8hmKf31nX7rbhZ6EBXAycWS3THHRz-ZLt1RXqWnjVA@mail.gmail.com>
References: <1396023951-32383-1-git-send-email-l.stach@pengutronix.de>
	<CAL_Jsq+_+B=TKMQ2ULkXiBJGTNmGGLkB1xjKNJkF1BK_4TRXkg@mail.gmail.com>
	<1397211012.4577.5.camel@weser.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397211012.4577.5.camel-WzVe3FnzCwFR6QfukMTsflXZhhPuCNm+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 11, 2014 at 5:10 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Hi Rob,
>
> Am Donnerstag, den 10.04.2014, 10:21 -0500 schrieb Rob Herring:
>> On Fri, Mar 28, 2014 at 11:25 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>> > From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
>> >
>> > When using interrupt-maps, the size of a map entry is #address-cells +
>>
>> Plus what? You mean ", and "?
>>
> Urgh, I obviously messed this up while editing the commit message in the
> last minute. It should have been something along the lines of:
>
> When using interrupt-maps, the size of a map entry is #address-cells +
> #interrupt-cells. address-cells should be 0 as this offset is not used
> in the GIC.
>
> As #address-cells = <0> is the same as not specifying the
> property, simply remove it.
>
> Can you edit this while applying, or should I send a new patch?

I'll fix it up and apply.

>
>> > address-cells should be 0 as this is not used.
>> >
>> > As #address-cells = <0> is the same as not specifying the
>> > property, simply remove it.
>> >
>> > Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
>> > Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>
>> Did this get applied? I can't seem to find patch 2.
>>
> As Shawn pointed out patch 2 got applied through the imx tree as it
> fixes a real bug there.

It was highlighted that other instances beyond iMX were wrong. Please
fix those as well.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
