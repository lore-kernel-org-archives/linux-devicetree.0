From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Add basic support for RTC on
 Allwinner H6 SoC
Date: Sat, 24 Aug 2019 14:58:18 +0200
Message-ID: <2660592.K6CN9dZ0QN@jernej-laptop>
References: <20190820151934.3860-1-megous@megous.com> <5421621.t8Lore9UF7@jernej-laptop> <20190824125612.zq5qsay2wv62wykt@core.my.home>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDP4JJM5QYGRB3XIQTVQKGQEKYXDKEY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190824125612.zq5qsay2wv62wykt-9v8tmBix7cb9zxVx7UNMDg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne sobota, 24. avgust 2019 ob 14:56:12 CEST je Ond=C5=99ej Jirman napisal(=
a):
> Hi,
>=20
> On Sat, Aug 24, 2019 at 10:06:14AM +0200, Jernej =C5=A0krabec wrote:
> > Dne sobota, 24. avgust 2019 ob 10:04:24 CEST je Jernej =C5=A0krabec nap=
isal(a):
> > > Hi!
> > >=20
> > > Dne torek, 20. avgust 2019 ob 17:19:31 CEST je megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org=20
napisal(a):
> > > > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > > >=20
> > > > I went through the datasheets for H6 and H5, and compared the
> > > > differences.
> > > > RTCs are largely similar, but not entirely compatible.
> > > > Incompatibilities
> > > > are in details not yet implemented by the rtc driver though.
> > > >=20
> > > > I also corrected the clock tree in H6 DTSI.
> > > >=20
> > > > This patchset is necessary for implementing the WiFi/Bluetooth supp=
ort
> > > > on boards using H6 SoC.
> > > >=20
> > > > There was some discussion previously of describing HOSC, DCXO and X=
O
> > > > oscillators and clocks as part of RTC in DT, but I decided against =
it
> > > > because it's not necessary, becuse information that would be provid=
ed
> > > > as a part of DT can already be determined at runtime from RTC
> > > > registers,
> > > > so this woudn't add any value and would only introduce complication=
s
> > > > to the driver. See: https://patchwork.kernel.org/cover/10898083/
> > > >=20
> > > > Please take a look.
> > > >=20
> > > >=20
> > > > Thank you and regards,
> > > >=20
> > > >   Ondrej Jirman
> > >=20
> > > Sorry for a bit late test, but with your patches on Tanix TX6 box I g=
et
> > > this in dmesg:
> > >=20
> > > [   17.431742] sun6i-rtc 7000000.rtc: Failed to set rtc time.
> > > [   20.439742] sun6i-rtc 7000000.rtc: rtc is still busy.
> > > [   21.435744] sun6i-rtc 7000000.rtc: rtc is still busy.
> > > [   24.055741] sun6i-rtc 7000000.rtc: rtc is still busy.
> > > [   24.439752] sun6i-rtc 7000000.rtc: rtc is still busy.
> > >=20
> > > Last line is repeated non-stop.
> > >=20
> > > Any idea what could be wrong?
> >=20
> > Additional info - this is on kernel 5.2.6 with your patches applied.
>=20
> Do you have schematics, or a FEX file for the board or any other info on =
how
> the RTC is set up on that board?
>=20
> Can you dump the RTC register range?

I have only Android DT, but as I already said in latest reply to patch 2,=
=20
changing switch bypass to bit 14 instead of 15 solved all issues.

Best regards,
Jernej

>=20
> regards,
> 	o.
>=20
> > Best regards,
> > Jernej
> >=20
> >=20
> >=20
> >=20
> >=20
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/2660592.K6CN9dZ0QN%40jernej-laptop.
