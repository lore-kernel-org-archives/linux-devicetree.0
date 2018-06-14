From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: allwinner: a64: add SRAM
 controller device tree node
Date: Thu, 14 Jun 2018 19:27:21 +0200
Message-ID: <2687631.x8iGEoiUx5@jernej-laptop>
References: <20180614153548.9644-1-wens@csie.org> <20180614153548.9644-5-wens@csie.org> <CAMty3ZARNpBOQKvS7knH8kWE2+bvjuJoAA4cFGZK8+GzTUQ5zA@mail.gmail.com>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDP4JJM5QYGRBO6LRLMQKGQEVMSW5PI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMty3ZARNpBOQKvS7knH8kWE2+bvjuJoAA4cFGZK8+GzTUQ5zA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dne =C4=8Detrtek, 14. junij 2018 ob 19:09:56 CEST je Jagan Teki napisal(a):
> On Thu, Jun 14, 2018 at 9:05 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> > From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> >=20
> > Allwinner A64 has a SRAM controller, and in the device tree currently
> > we have a syscon node to enable EMAC driver to access the EMAC clock
> > register. As SRAM controller driver can now export regmap for this
> > register, replace the syscon node to the SRAM controller device node,
> > and let EMAC driver to acquire its EMAC clock regmap.
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > [wens-jdAy2FN1RRM@public.gmane.org: Updated compatible string]
> > Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > ---
> >=20
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 19 +++++++++++++++++--
> >  1 file changed, 17 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi index
> > 1b2ef28c42bd..87968dafe1dc 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > @@ -169,9 +169,24 @@
> >=20
> >                 ranges;
> >                =20
> >                 syscon: syscon@1c00000 {
> >=20
> > -                       compatible =3D
> > "allwinner,sun50i-a64-system-controller", -                            =
 =20
> > "syscon";
> > +                       compatible =3D
> > "allwinner,sun50i-a64-system-control";
> >=20
> >                         reg =3D <0x01c00000 0x1000>;
> >=20
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <1>;
> > +                       ranges;
> > +
> > +                       sram_c: sram@18000 {
> > +                               compatible =3D "mmio-sram";
> > +                               reg =3D <0x00018000 0x28000>;
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <1>;
> > +                               ranges =3D <0 0x00018000 0x28000>;
> > +
> > +                               de2_sram: sram-section@0 {
>=20
> So, this can attach to display-engine node through allwinner,sram and
> add support to claim the sram on sun4i/sun4i_drv.c, correct?

Actually, it has to be added to display_clocks node and claimed in drivers/
clk/sunxi-ng/ccu-sun8i-de2.c

Best regards,
Jernej


--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
