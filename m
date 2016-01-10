From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx28: add pinmux for USB1 overcurrent on pwm2
Date: Sun, 10 Jan 2016 13:13:24 +0000
Message-ID: <yw1xoacty3uz.fsf@unicorn.mansr.com>
References: <1452429613-28783-1-git-send-email-mans@mansr.com>
	<1473600647.505612.cb24b396-67be-4b7b-9938-7cb30ef4fe05.open-xchange@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473600647.505612.cb24b396-67be-4b7b-9938-7cb30ef4fe05.open-xchange-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
	(Stefan Wahren's message of "Sun, 10 Jan 2016 14:08:40 +0100 (CET)")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> Hi Mans,
>
>> Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org> hat am 10. Januar 2016 um 13:40 gesch=
rieben:
>>
>>
>> Add pinmux setting for USB1 overcurrent on pwm2 pad.
>
> could you please change your patch to describe why you need to add
> this pinmux?

I'm working on a board that is wired that way.  I can of course put thi=
s
in the board-specific dts if that's preferable.

--=20
M=E5ns Rullg=E5rd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
