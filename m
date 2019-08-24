From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] rtc: sun6i: Add support for H6 RTC
Date: Sat, 24 Aug 2019 23:36:26 +0200
Message-ID: <7913281.jYEbquIlsS@jernej-laptop>
References: <20190820151934.3860-1-megous@megous.com> <1690798.2HKiRSsjat@jernej-laptop> <20190824212746.a5pyilkrrvysjjbd@core.my.home>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDP4JJM5QYGRBXW3Q3VQKGQECEUVOOQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190824212746.a5pyilkrrvysjjbd-9v8tmBix7cb9zxVx7UNMDg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne sobota, 24. avgust 2019 ob 23:27:46 CEST je Ond=C5=99ej Jirman napisal(=
a):
> Hello Jernej,
>=20
> On Sat, Aug 24, 2019 at 11:09:49PM +0200, Jernej =C5=A0krabec wrote:
> > > Visually?
> > >=20
> > > That would explain why it doesn't work for you. The mainline RTC driv=
er
> > > disables auto-switch feature, and if your board doesn't have a crysta=
l
> > > for
> > > LOSC, RTC will not generate a clock for the RTC.
> > >=20
> > > H6's dtsi describes by default a situatiuon with external 32k crystal
> > > oscillator. See ext_osc32k node. That's incorrect for your board if i=
t
> > > doesn't have the crystal. You need to fix this in the DTS for your bo=
ard
> > > instead of patching the driver.
> >=20
> > I see that reparenting is supported, but I'm not sure how to fix that i=
n
> > DT. Any suggestion?
>=20
> You may try removing the clocks property from rtc node.

I don't think this would work:
https://elixir.bootlin.com/linux/latest/source/drivers/rtc/rtc-sun6i.c#L246

>=20
> > > The driver has parent clock selection logic in case the LOSC crystal =
is
> > > not
> > > used.
> > >=20
> > > Your patch enables automatic detection of LOSC failure and RTC change=
s
> > > clock to LOSC automatically, despite what's described in the DTS. Tha=
t
> > > may fix the issue, but is not the correct solution.
> > >=20
> > > Registers on my board look like this (external 32k osc is used) for
> > > reference:
> > >=20
> > > LOSC_CTRL_REG[7000000]: 8011
> > >=20
> > > 	KEY_FIELD                      ???                  (0)
> > > 	LOSC_AUTO_SWT_BYPASS           EN                   (1)
> > > 	LOSC_AUTO_SWT_EN               DIS                  (0)
> > > 	EXT_LOSC_EN                    EN                   (1)
> > > 	EXT_LOSC_GSM                   LOW                  (0)
> > > 	BATTERY_DIR                    DISCHARGE            (0)
> > > 	LOSC_SRC_SEL                   EXT32k               (1)
> > >=20
> > > LOSC_AUTO_SWT_STA_REG[7000004]: 1
> > >=20
> > > 	EXT_LOSC_STA                   OK                   (0)
> > > 	LOSC_AUTO_SWT_PEND             NOEFF                (0)
> > > 	LOSC_SRC_SEL_STA               EXT32K               (1)
> >=20
> > In my case LOSC_CTRL_REG has value 0x4010 and LOSC_AUTO_SWT_STA_REG
> > has value 0x4, so there is issue with external crystal (it's missing) a=
nd
> > RTC switched to internal one.
> >=20
> > BTW, what's wrong with automatic switching? Why is it disabled?
>=20
> It always was disabled on mainline (bit 14 was set to 0 even before my
> patch). H6 just probably has another extra undocummented bit, that's need=
ed
> to disables it properly.
>=20
> You probably don't want a glitch to switch your RTC from high-precision
> clock to a low precision one possibly without any indication in the
> userspace or a kernel log.
>=20
> Regardless of all this, DTS needs to have a correct description of the HW=
,
> which means if RTC module is not connected to the 32.757kHz crystal/clock=
,
> clocks property should be empty.

If we are talking about correct HW description, then clock property should=
=20
actually have possibility that two clocks are defined - one for internal RC=
=20
(always present) and one external crystal (optional). In such case I could=
=20
really just omit external clock and be done with it. But I'm not sure if su=
ch=20
solution is acceptable at this point.

Best regards,
Jernej

>=20
> regards,
> 	o.
>=20
> > Best regards,
> > Jernej
> >=20
> > > regards,
> > >=20
> > > 	o.
> > > =09
> > > > > The real issue probably is that the mainline driver is missing th=
is:
> > > > >=20
> > > > > https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.c?h=3Dh6-=
4.9-b
> > > > > sp#n
> > > > > 650
> > > >=20
> > > > Not sure what you mean by that. ext vs. int source selection?
> > > >=20
> > > >=20
> > > >=20
> > > > Best regards,
> > > > Jernej
> > > >=20
> > > > > regards,
> > > > >=20
> > > > > 	o.




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/7913281.jYEbquIlsS%40jernej-laptop.
