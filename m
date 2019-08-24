From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] rtc: sun6i: Add support for H6 RTC
Date: Sat, 24 Aug 2019 23:09:49 +0200
Message-ID: <1690798.2HKiRSsjat@jernej-laptop>
References: <20190820151934.3860-1-megous@megous.com> <10880274.nteIY8W56H@jernej-laptop> <20190824133057.rhpj3xuzr3vymdiy@core.my.home>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDP4JJM5QYGRBIOPQ3VQKGQEKXGTF2Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190824133057.rhpj3xuzr3vymdiy-9v8tmBix7cb9zxVx7UNMDg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne sobota, 24. avgust 2019 ob 15:30:57 CEST je Ond=C5=99ej Jirman napisal(=
a):
> On Sat, Aug 24, 2019 at 03:16:41PM +0200, Jernej =C5=A0krabec wrote:
> > Dne sobota, 24. avgust 2019 ob 15:05:44 CEST je Ond=C5=99ej Jirman napi=
sal(a):
> > > On Sat, Aug 24, 2019 at 02:51:54PM +0200, Jernej =C5=A0krabec wrote:
> > > > Dne sobota, 24. avgust 2019 ob 14:46:54 CEST je Ond=C5=99ej Jirman=
=20
napisal(a):
> > > > > Hi,
> > > > >=20
> > > > > On Sat, Aug 24, 2019 at 02:32:32PM +0200, Jernej =C5=A0krabec wro=
te:
> > > > > > Hi!
> > > > > >=20
> > > > > > Dne torek, 20. avgust 2019 ob 17:19:33 CEST je megous-5qf/QAjKc81hl2p70BpVqQ@public.gmane.org=
m
> > > >=20
> > > > napisal(a):
> > > > > > > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > > > > > >=20
> > > > > > > RTC on H6 is mostly the same as on H5 and H3. It has slight
> > > > > > > differences
> > > > > > > mostly in features that are not yet supported by this driver.
> > > > > > >=20
> > > > > > > Some differences are already stated in the comments in existi=
ng
> > > > > > > code.
> > > > > > > One other difference is that H6 has extra bit in LOSC_CTRL_RE=
G,
> > > > > > > called
> > > > > > > EXT_LOSC_EN to enable/disable external low speed crystal
> > > > > > > oscillator.
> > > > > > >=20
> > > > > > > It also has bit EXT_LOSC_STA in LOSC_AUTO_SWT_STA_REG, to che=
ck
> > > > > > > whether
> > > > > > > external low speed oscillator is working correctly.
> > > > > > >=20
> > > > > > > This patch adds support for enabling LOSC when necessary:
> > > > > > >=20
> > > > > > > - during reparenting
> > > > > > > - when probing the clock
> > > > > > >=20
> > > > > > > H6 also has capacbility to automatically reparent RTC clock f=
rom
> > > > > > > external crystal oscillator, to internal RC oscillator, if
> > > > > > > external
> > > > > > > oscillator fails. This is enabled by default. Disable it duri=
ng
> > > > > > > probe.
> > > > > > >=20
> > > > > > > Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > > > > > > Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > > > > > > ---
> > > > > > >=20
> > > > > > >  drivers/rtc/rtc-sun6i.c | 40
> > > > > > >  ++++++++++++++++++++++++++++++++++++++--
> > > > > > >  1 file changed, 38 insertions(+), 2 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.=
c
> > > > > > > index d50ee023b559..b0c3752bed3f 100644
> > > > > > > --- a/drivers/rtc/rtc-sun6i.c
> > > > > > > +++ b/drivers/rtc/rtc-sun6i.c
> > > > > > > @@ -32,9 +32,11 @@
> > > > > > >=20
> > > > > > >  /* Control register */
> > > > > > >  #define SUN6I_LOSC_CTRL			=09
0x0000
> > > > > > >  #define SUN6I_LOSC_CTRL_KEY			(0x16aa
> >=20
> > << 16)
> >=20
> > > > > > > +#define SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS		BIT(15)
> > > > > >=20
> > > > > > User manual says that above field is bit 14.
> > > > >=20
> > > > > See the previous discussion, this is from BSP.
> > > >=20
> > > > I have two versions of BSP (don't ask me which) which have this set=
 as
> > > > bit
> > > > 14 and changing this to 14 actually solves all my problems with LOS=
C
> > > > (no
> > > > more issues with setting RTC and HDMI-CEC works now - it uses LOSC =
as
> > > > parent) on Tanix TX6 box.
> > >=20
> > > Interesting. Is LOSC fed externally generated clock, or is it setup a=
s a
> > > crystal oscillator on your board?
> >=20
> > I really don't know, but here is DT: http://ix.io/1ThI
> >=20
> > > Anyway, see here:
> > >=20
> > > https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.h?h=3Dh6-4.9-=
bsp#n
> > > 649
> > > https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.c?h=3Dh6-4.9-=
bsp#n
> > > 652
> >=20
> > Interesting, 4.9 BSP has additional bit definition, which is not
> > documented in manual and 3.10 BSP to which I refer.
> >=20
> > I was referring to 3.10 BSP, which uses only bit 14. I thought that you
> > named it differently.
> >=20
> > > It would be nice to know what's really happening.
> > >=20
> > > My output is:
> > >=20
> > > [    0.832252] sun6i-rtc 7000000.rtc: registered as rtc0
> > > [    0.832257] sun6i-rtc 7000000.rtc: RTC enabled
> > > [    1.728968] sun6i-rtc 7000000.rtc: setting system clock to
> > > 1970-01-01T00:00:07 UTC (7)
> >=20
> > With change, I get same output.
> >=20
> > > I think, you may have just enabled the auto switch feature, and runni=
ng
> > > the
> > > clock from low precision RC oscillator with your patch.
> >=20
> > True, now I think there is no external crystal, but I'm still not sure =
how
> > to confirm that.
>=20
> Visually?
>=20
> That would explain why it doesn't work for you. The mainline RTC driver
> disables auto-switch feature, and if your board doesn't have a crystal fo=
r
> LOSC, RTC will not generate a clock for the RTC.
>=20
> H6's dtsi describes by default a situatiuon with external 32k crystal
> oscillator. See ext_osc32k node. That's incorrect for your board if it
> doesn't have the crystal. You need to fix this in the DTS for your board
> instead of patching the driver.

I see that reparenting is supported, but I'm not sure how to fix that in DT=
.=20
Any suggestion?

>=20
> The driver has parent clock selection logic in case the LOSC crystal is n=
ot
> used.
>=20
> Your patch enables automatic detection of LOSC failure and RTC changes cl=
ock
> to LOSC automatically, despite what's described in the DTS. That may fix
> the issue, but is not the correct solution.
>=20
> Registers on my board look like this (external 32k osc is used) for
> reference:
>=20
> LOSC_CTRL_REG[7000000]: 8011
> 	KEY_FIELD                      ???                  (0)
> 	LOSC_AUTO_SWT_BYPASS           EN                   (1)
> 	LOSC_AUTO_SWT_EN               DIS                  (0)
> 	EXT_LOSC_EN                    EN                   (1)
> 	EXT_LOSC_GSM                   LOW                  (0)
> 	BATTERY_DIR                    DISCHARGE            (0)
> 	LOSC_SRC_SEL                   EXT32k               (1)
>=20
> LOSC_AUTO_SWT_STA_REG[7000004]: 1
> 	EXT_LOSC_STA                   OK                   (0)
> 	LOSC_AUTO_SWT_PEND             NOEFF                (0)
> 	LOSC_SRC_SEL_STA               EXT32K               (1)
>=20

In my case LOSC_CTRL_REG has value 0x4010 and LOSC_AUTO_SWT_STA_REG
has value 0x4, so there is issue with external crystal (it's missing) and R=
TC=20
switched to internal one.

BTW, what's wrong with automatic switching? Why is it disabled?

Best regards,
Jernej

> regards,
> 	o.
>=20
> > > The real issue probably is that the mainline driver is missing this:
> > >=20
> > > https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.c?h=3Dh6-4.9-=
bsp#n
> > > 650
> >=20
> > Not sure what you mean by that. ext vs. int source selection?
> >=20
> >=20
> >=20
> > Best regards,
> > Jernej
> >=20
> > > regards,
> > >=20
> > > 	o.




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/1690798.2HKiRSsjat%40jernej-laptop.
