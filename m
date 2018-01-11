From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 1/7] pinctrl: sunxi: add support for pin
 controllers without bus gate
Date: Thu, 11 Jan 2018 18:43:23 +0800
Message-ID: <3495150.euKa61aEg4@ice-x220i>
References: <20180106042326.46519-1-icenowy@aosc.io> <ba83f00d-c1e5-6f6a-84df-04169860c7eb@arm.com> <20180111104100.j5rwitma3wgtdivm@flea.lan>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBW773TJAKGQEC6PNLYA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180111104100.j5rwitma3wgtdivm-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2018=E5=B9=B41=E6=9C=8811=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B CST=
 =E4=B8=8B=E5=8D=886:41:00=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> On Thu, Jan 11, 2018 at 10:23:52AM +0000, Andre Przywara wrote:
> > Hi,
> >=20
> > On 11/01/18 10:14, Chen-Yu Tsai wrote:
> > > On Thu, Jan 11, 2018 at 6:08 PM, Andre Przywara <andre.przywara@arm.c=
om>=20
wrote:
> > >> Hi,
> > >>=20
> > >> On 06/01/18 04:23, Icenowy Zheng wrote:
> > >>> The Allwinner H6 pin controllers (both the main one and the CPUs on=
e)
> > >>> have no bus gate clocks.
> > >>>=20
> > >>> Add support for this kind of pin controllers.
> > >>>=20
> > >>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > >>> ---
> > >>>=20
> > >>>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 30
> > >>>  ++++++++++++++++++++----------
> > >>>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 +
> > >>>  2 files changed, 21 insertions(+), 10 deletions(-)
> > >>>=20
> > >>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > >>> b/drivers/pinctrl/sunxi/pinctrl-sunxi.c index
> > >>> 4b6cb25bc796..68cd505679d9 100644
> > >>> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > >>> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > >>> @@ -1182,7 +1182,12 @@ static int sunxi_pinctrl_setup_debounce(stru=
ct
> > >>> sunxi_pinctrl *pctl,> >>>=20
> > >>>       unsigned int hosc_div, losc_div;
> > >>>       struct clk *hosc, *losc;
> > >>>       u8 div, src;
> > >>>=20
> > >>> -     int i, ret;
> > >>> +     int i, ret, clk_count;
> > >>> +
> > >>> +     if (pctl->desc->without_bus_gate)
> > >>> +             clk_count =3D 2;
> > >>> +     else
> > >>> +             clk_count =3D 3;
> > >>>=20
> > >>>       /* Deal with old DTs that didn't have the oscillators */
> > >>>       if (of_count_phandle_with_args(node, "clocks", "#clock-cells"=
)
> > >>>       !=3D 3)
> > >>>=20
> > >>> @@ -1360,15 +1365,19 @@ int sunxi_pinctrl_init_with_variant(struct
> > >>> platform_device *pdev,> >>>=20
> > >>>                       goto gpiochip_error;
> > >>>      =20
> > >>>       }
> > >>>=20
> > >>> -     clk =3D devm_clk_get(&pdev->dev, NULL);
> > >>> -     if (IS_ERR(clk)) {
> > >>> -             ret =3D PTR_ERR(clk);
> > >>> -             goto gpiochip_error;
> > >>> -     }
> > >>> +     if (!desc->without_bus_gate) {
> > >>=20
> > >> Do we really need explicit support for that case?
> > >> Can't we have something that works automatically?
> > >>=20
> > >> if (node has clock-names property)              (A)
> > >>=20
> > >>         use clocks as enumerated and named there
> > >=20
> > > You still need to know if the hardware has a bus gate or not.
> > > If it's missing, and it's disabled, you end up with unusable
> > > hardware.
> >=20
> > Yes. So what? If you have a broken DT, it will not work. Just don't do
> > it. I don't understand why we want to defend against this case.
>=20
> This is not the point, but rather: if we have a way to detect easily
> that the device tree is missing a property that is missing in our
> binding, why shouldn't we do it?
>=20
> We're already doing it for reg and interrupts for example, why not for
> the clocks?
>=20
> > > Unless you are fully trusting the device tree to be correct.
> >=20
> > Sorry, but what else do we trust?
> >=20
> > > IMHO that makes for hard to find bugs during SoC bringup.
> >=20
> > I am not sure if that is really an issue. I would expect people
> > doing SoC bringup to be able to cope with those kinds of problems.
>=20
> Riiiight, because it worked so well in the past. We definitely didn't
> overlooked some clocks used for debouncing in this particular driver,
> or some to get the timekeeping right in the RTC.
>=20
> The argument that "anyone who codes in the kernel should just know
> better" doesn't work, on multiple levels. Because anyone that actually
> knows better can make a mistake or overlook some feature (because you
> didn't have your morning coffee yet, or because it was undocumented)
> and because you just make someone that doesn't feel bad.

I agree it here -- when I'm doing initial trial on H6 I didn't found that a=
pb=20
gate is missing ;-)

>=20
> So, yes, we cannot not trust the device tree. But if we have a way to
> detect simple mistakes in the binding, we should also do it.
>=20
> Maxime


--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
