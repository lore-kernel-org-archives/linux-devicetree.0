From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 4/5] ARM: dts: Fix the sort ordering of EHCI and HSIC
 in rk3288.dtsi
Date: Fri, 1 Aug 2014 22:06:59 -0700
Message-ID: <CAD=FV=WkBeBUMQQwUOR1dDzsVcU-54izhoDwuiMb6Myd0hB+0g@mail.gmail.com>
References: <1406846976-23127-4-git-send-email-dianders@chromium.org>
	<5965899.y405fxfhDg@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5965899.y405fxfhDg@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Heiko,

On Fri, Aug 1, 2014 at 2:17 AM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wr=
ote:
> Am Donnerstag, 31. Juli 2014, 15:49:35 schrieb Doug Anderson:
>> The EHCI and HSIC device tree nodes were added in the wrong place.
>> Fix them.
>>
>> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Signed-off-by: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> hmm, not sure if this counts as fix ... aka material for 3.17-rc2 or =
should
> wait for 3.18. Simply because it's more a cosmetic thing.
>
> If it is a fix, could base it on the appropriate dts revision, becaus=
e here
> it's in the middle of the dwc2 series, including the
>         usb_host1: usb@ff540000
> nodes.

It didn't seem too urgent since it's just cosmetic.  ...but I didn't
want to send up my fixup and then cause an immediate conflict with
Kever.  :(  ...that's why I asked him to just include it in his
series.

If you want me to spin this patch separately (and then Kever can spin
his), let me know.  I know that for me Kever's series was still not
making the dwc2 controller work 100% correctly for me (so maybe he'll
need to spin anyway?), but someone else at work had it working so
something is fishy.  Unfortunately I'm away from my computer and board
for the next several days, so it might be a while before I can
investigate more...

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
