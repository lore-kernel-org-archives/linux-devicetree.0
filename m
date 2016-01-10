From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx28: add pinmux for USB1 overcurrent on
 pwm2
Date: Sun, 10 Jan 2016 14:58:40 +0100 (CET)
Message-ID: <1662250621.506558.cb24b396-67be-4b7b-9938-7cb30ef4fe05.open-xchange@email.1und1.de>
References: <1452429613-28783-1-git-send-email-mans@mansr.com>
 <1473600647.505612.cb24b396-67be-4b7b-9938-7cb30ef4fe05.open-xchange@email.1und1.de>
 <yw1xoacty3uz.fsf@unicorn.mansr.com>
 <89586980.506110.cb24b396-67be-4b7b-9938-7cb30ef4fe05.open-xchange@email.1und1.de>
 <yw1xk2nhy2j8.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <yw1xk2nhy2j8.fsf-OEaqT8BN2ezZK2NkWkPsZwC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?M=C3=A5ns_Rullg=C3=A5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


> M=C3=A5ns Rullg=C3=A5rd <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org> hat am 10. Januar 2016 um 14=
:42 geschrieben:
>
>
> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:
>
> >> M=C3=A5ns Rullg=C3=A5rd <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org> hat am 10. Januar 2016 um=
 14:13 geschrieben:
> >>
> >>
> >> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:
> >>
> >> > Hi Mans,
> >> >
> >> >> Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org> hat am 10. Januar 2016 um 13:40
> >> >> geschrieben:
> >> >>
> >> >>
> >> >> Add pinmux setting for USB1 overcurrent on pwm2 pad.
> >> >
> >> > could you please change your patch to describe why you need to a=
dd
> >> > this pinmux?
> >>
> >> I'm working on a board that is wired that way. I can of course put=
 this
> >> in the board-specific dts if that's preferable.
> >
> > So the board isn't submitted to mainline?
>
> Not yet anyway.
>
> > IMHO the change is okay, but the description doesn't explain why is=
 it
> > needed.
> >
> > So a suitable description would be that it's needed for board xy.
>
> Would it be better to send this patch in a series along with the full
> board support?
>

Yes, it would be nice to have a dts file which reference the new pinmux=
=2E

> --
> M=C3=A5ns Rullg=C3=A5rd
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
