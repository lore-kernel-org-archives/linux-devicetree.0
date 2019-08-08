From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/3] Add basic support for RTC on Allwinner
 H6 SoC
Date: Thu, 8 Aug 2019 14:12:37 +0200
Message-ID: <20190808121237.g6twq2nh3sayu3vx@core.my.home>
References: <20190412120730.473-1-megous@megous.com>
 <CAGb2v66cbpsoHJoiFJkBwhZ5SbO+uO+Kf6gtnA3kPFQZq0329Q@mail.gmail.com>
 <20190806183045.edhm3qzpegscf2z7@core.my.home>
 <20190807105502.GK3600@piout.net>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDXLF6FR5INBBOFDWDVAKGQEH4UXCLQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190807105502.GK3600-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 07, 2019 at 12:55:02PM +0200, Alexandre Belloni wrote:
> Hi,
>=20
> On 06/08/2019 20:30:45+0200, Ond=C5=99ej Jirman wrote:
> > Maybe whether XO or DCXO is used also matters if you want to do some fi=
ne
> > tunning of DCXO (control register has pletny of options), but that's pr=
obably
> > better done in u-boot. And there's still no need to read HOSC source fr=
om DT.
> > The driver can just check compatible, and if it is H6 and OSC_CLK_SRC_S=
EL is 1,
> > it can do it's DCXO tunning, or whatever. But neither OS nor bootloader=
 will
> > be using this info to gate/disable the osciallator.
> >=20
>=20
> It is actually useful to be able to tweak the crystal tuning at
> runtime to be able to reduce clock drift and compare with a reliable
> source (e.g. NTP).

I don't think there's a Linux kernel API that you can use to achieve that, =
so
that's a rather theoretical concern at the moment.

Also there are multiple clocks, that can drive the RTC, and you usually don=
't
drive it from 24MHz DCXO oscillator. The reason is that you'd have to deal =
with
the fact that the clock for RTC then becomes 24000000/750 (750 is fixed
divider), which is 32000.

So if you want to get 32768Hz for RTC by tuning the DCXO, it would have to =
have
24 576 000 Hz. And even if you could achieve that (doubtful), it would thro=
w off
timings in the rest of the system (say UART, USB, CPU, display ctl) in a ma=
jor way.

I guess you can try tuning 24MHz oscillator so that it's closer to the
real-world 24MHz via NTP reference for other reasons. But it would be
complicated, and require precise interaction with other components, like us=
ing
HW timers sourced from 24MHz HOSC clock, because you can't use CPU's timers=
,
because of inaccuracies introduced during DVFS, for example.

regards,
	o.

> I'm curious, what kind of options does this RTC have?
>=20
> --=20
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190808121237.g6twq2nh3sayu3vx%40core.my.home.
