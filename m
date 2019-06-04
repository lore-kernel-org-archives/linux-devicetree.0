From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: Re: [PATCH v3 10/12] arm64: dts: allwinner: h6: Add
 IR receiver node
Date: Tue, 4 Jun 2019 14:33:55 +0200
Message-ID: <20190604123355.m47ufmhtzuzfvmp7@core.my.home>
References: <20190528161440.27172-1-peron.clem@gmail.com>
 <20190528161440.27172-11-peron.clem@gmail.com>
 <20190530145550.amalnxmx7kpokykv@core.my.home>
 <CAJiuCce7nHSktVsDKcR8GLRpD3WrN5yP3Nb_Hbu_Q9NjUQbSMw@mail.gmail.com>
 <20190531124630.q2guo54kjfzr7rkn@core.my.home>
 <CAJiuCcdMftAjCwk2_naE9VBGGqS=OY9xcqv6+5pDX2Z8O=L28w@mail.gmail.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDXLF6FR5INBBNOK3HTQKGQEM6P3DZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJiuCcdMftAjCwk2_naE9VBGGqS=OY9xcqv6+5pDX2Z8O=L28w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Cl=C3=A9ment,

On Mon, Jun 03, 2019 at 09:58:23PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> Hi Ondrej,
>=20
> On Fri, 31 May 2019 at 14:46, Ond=C5=99ej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrot=
e:
> >
> > Hello Cl=C3=A9ment,
> >
> > On Fri, May 31, 2019 at 12:25:32AM +0200, Cl=C3=A9ment P=C3=A9ron wrote=
:
> > > Hi Ondrej,
> > >
> > > On Thu, 30 May 2019 at 16:55, Ond=C5=99ej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> =
wrote:
> > > >
> > > > Hello Cl=C3=A9ment,
> > > >
> > > > On Tue, May 28, 2019 at 06:14:38PM +0200, Cl=C3=A9ment P=C3=A9ron w=
rote:
> > > > > Allwinner H6 IR is similar to A31 and can use same driver.
> > > > >
> > > > > Add support for it.
> > > > >
> > > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > > ---
> > > > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 19 ++++++++++++++=
+++++
> > > > >  1 file changed, 19 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/=
arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > index 16c5c3d0fd81..649cbdfe452e 100644
> > > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > @@ -647,6 +647,25 @@
> > > > >                               pins =3D "PL0", "PL1";
> > > > >                               function =3D "s_i2c";
> > > > >                       };
> > > > > +
> > > > > +                     r_ir_rx_pin: r-ir-rx-pin {
> > > > > +                             pins =3D "PL9";
> > > > > +                             function =3D "s_cir_rx";
> > > > > +                     };
> > > > > +             };
> > > > > +
> > > > > +             r_ir: ir@7040000 {
> > > > > +                             compatible =3D "allwinner,sun50i-h6=
-ir",
> > > > > +                                          "allwinner,sun6i-a31-i=
r";
> > > > > +                             reg =3D <0x07040000 0x400>;
> > > > > +                             interrupts =3D <GIC_SPI 109 IRQ_TYP=
E_LEVEL_HIGH>;
> > > > > +                             clocks =3D <&r_ccu CLK_R_APB1_IR>,
> > > > > +                                      <&r_ccu CLK_IR>;
> > > > > +                             clock-names =3D "apb", "ir";
> > > > > +                             resets =3D <&r_ccu RST_R_APB1_IR>;
> > > > > +                             pinctrl-names =3D "default";
> > > > > +                             pinctrl-0 =3D <&r_ir_rx_pin>;
> > > > > +                             status =3D "disabled";
> > > > >               };
> > > >
> > > > Please make a comment here, that this is known broken on some board=
s and may
> > > > result IRQ flood if enabled. Otherwise noone will know.
> > >
> > > I'm planning to send a v4 next week with the IRQ_NONE return as Maxim=
e
> > > suggested it.
> > > https://github.com/clementperon/linux/tree/h6_ir_v4
> > >
> > > But maybe we could also use the bit 5 of the IRQ status.
> >
> > Thanks, that's nice, but that will not make the HW work. That will just=
 disable
> > it. The comment is still necessary.
> I have pushed a new version on my github.
> https://github.com/clementperon/linux/commits/h6_ir_v4
>=20
> I will submit it, if you are ok with it.

the changes make it worse. Console is flooded with "Temporarily disable IRQ=
"
and other symptoms are the same as I described before. Interrupts are not
disabled in a any reasonable time. (I've waited for more > 5mins already.)

You probably need to disable interrupts right away, not wait for 100k failu=
res.

thank you and regards,
	o.

> Thanks,
> Cl=C3=A9ment
>=20
> >
> > thank you,
> >         o.
> >
> > > Regards, Clement
> > >
> > > >
> > > > thanks,
> > > >         o.
> > > >
> > > > >               r_i2c: i2c@7081400 {
> > > > > --
> > > > > 2.20.1
> > > > >
> > > > >
> > > > > _______________________________________________
> > > > > linux-arm-kernel mailing list
> > > > > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > > > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > >
> > > --
> > > You received this message because you are subscribed to the Google Gr=
oups "linux-sunxi" group.
> > > To unsubscribe from this group and stop receiving emails from it, sen=
d an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> > > To view this discussion on the web, visit https://groups.google.com/d=
/msgid/linux-sunxi/CAJiuCce7nHSktVsDKcR8GLRpD3WrN5yP3Nb_Hbu_Q9NjUQbSMw%40ma=
il.gmail.com.
> > > For more options, visit https://groups.google.com/d/optout.
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
/linux-sunxi/20190604123355.m47ufmhtzuzfvmp7%40core.my.home.
For more options, visit https://groups.google.com/d/optout.
