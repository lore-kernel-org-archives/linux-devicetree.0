From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: Enable USB host0 (EHCI) on rk3288-evb
Date: Wed, 30 Jul 2014 08:22:10 -0700
Message-ID: <CAD=FV=W1HGxTDx6k7tizZ_Ez3GsxmwV0t5gJx0fanAQ2t_fnuQ@mail.gmail.com>
References: <1406676273-20701-1-git-send-email-dianders@chromium.org>
	<1406676273-20701-4-git-send-email-dianders@chromium.org>
	<4280303.LVm1cg0Iss@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4280303.LVm1cg0Iss@diego>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Heiko,

On Wed, Jul 30, 2014 at 4:26 AM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> Am Dienstag, 29. Juli 2014, 16:24:33 schrieb Doug Anderson:
>> This is the top USB port on the evb (the one closest to the Ethernet
>> connector).
>>
>> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Signed-off-by: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> shouldn't the signed-offs be the other way around, like in patch 2/3?

I wasn't aware that the order was too relevant, but I'll happily swap
them.  I generally try to list them based on contribution.  Things get
complicated when lots of WIP patches are sent around and then someone
eventually puts things together.  My work enabling the EHCI port was
based on something Kever sent me in email, so I felt he should have
SoB.  ...but cleaning it up / organizing was done by me.  Probably
should be this to get it totally right:

* Patch #1: Author and SoB are me, since Kever just pointed me to the
GPIO number
* Patch #2: Probably should be author Kever, first SoB Kever, second So=
B me
* Patch #3: Probably should be author me, first SoB me, second SoB Keve=
r

=2E..in that case I just need to tweak the author of Patch #2 and leave
everything else the same.  I'll plan to do that when I repost.

=2E..but I don't really care a whole lot and I'm OK with any authorship
of patch set #2/#3 and any SoB order of patch set #2/#3.  Just let me
know which you prefer!  :)

-Doug
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
