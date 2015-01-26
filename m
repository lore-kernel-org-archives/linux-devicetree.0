From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/9] clk: sunxi: Add support for sun9i
 a80 usb clocks and resets
Date: Mon, 26 Jan 2015 14:37:51 +0100
Message-ID: <20150126133751.GE31568@lukather>
References: <1422188530-1794-1-git-send-email-wens@csie.org>
 <1422188530-1794-2-git-send-email-wens@csie.org>
 <20150125160253.GG8470@lukather>
 <CAGb2v667DGBPXGdU1jO1x=pxmu3Oue9qxVZmZz5KxqzC_9xxGw@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="924gEkU1VlJlwnwX"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBNUHTGTAKGQEBM7XEOY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v667DGBPXGdU1jO1x=pxmu3Oue9qxVZmZz5KxqzC_9xxGw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--924gEkU1VlJlwnwX
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2015 at 05:25:49PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> 2015=E5=B9=B41=E6=9C=8825=E6=97=A5 =E4=B8=8B=E5=8D=8811:05 =E6=96=BC "Max=
ime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hi,
> >
> > On Sun, Jan 25, 2015 at 08:22:02PM +0800, Chen-Yu Tsai wrote:
> > > The USB controller/phy clocks and reset controls are in a separate
> > > address block, unlike previous SoCs where they were in the clock
> > > controller.
> > >
> > > This patch copies the original gates clk functions used for usb
> > > clocks into a separate file, and renames them to *_usb_*. Also
> > > add a per-gate parent index, so we can set different parents for
> > > each gate.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/clock/sunxi.txt |   2 +
> > >  drivers/clk/sunxi/Makefile                        |   1 +
> > >  drivers/clk/sunxi/clk-usb.c                       | 193 ++++++++++++=
++++++++++
> > >  3 files changed, 196 insertions(+)
> > >  create mode 100644 drivers/clk/sunxi/clk-usb.c
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Docu=
mentation/devicetree/bindings/clock/sunxi.txt
> > > index 60b44285250d..3f1dcd879af7 100644
> > > --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> > > +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> > > @@ -66,6 +66,8 @@ Required properties:
> > >       "allwinner,sun4i-a10-usb-clk" - for usb gates + resets on A10 /=
 A20
> > >       "allwinner,sun5i-a13-usb-clk" - for usb gates + resets on A13
> > >       "allwinner,sun6i-a31-usb-clk" - for usb gates + resets on A31
> > > +     "allwinner,sun9i-a80-usb-mod-clk" - for usb gates + resets on A=
80
> > > +     "allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets =
on A80
> > >
> > >  Required properties for all clocks:
> > >  - reg : shall be the control register address for the clock.
> > > diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> > > index 3a5292e3fcf8..058f273d6154 100644
> > > --- a/drivers/clk/sunxi/Makefile
> > > +++ b/drivers/clk/sunxi/Makefile
> > > @@ -9,6 +9,7 @@ obj-y +=3D clk-mod0.o
> > >  obj-y +=3D clk-sun8i-mbus.o
> > >  obj-y +=3D clk-sun9i-core.o
> > >  obj-y +=3D clk-sun9i-mmc.o
> > > +obj-y +=3D clk-usb.o
> >
> > Is that supposed to handle the other USB clocks in the future as well?
>=20
> I plan to do that. If you compare this and the original USB clk driver,
> you'll notice it's pretty much the same.

Yeah, hence why I asked :)

I'd rather not have two distinct copies of the same code. Could you
move these old clocks first, and then add the A80 clocks?

At least your commit log somewhat induces that this is new code, while
it clearly isn't.

> > >
> > >  obj-$(CONFIG_MFD_SUN6I_PRCM) +=3D \
> > >       clk-sun6i-ar100.o clk-sun6i-apb0.o clk-sun6i-apb0-gates.o \
> > > diff --git a/drivers/clk/sunxi/clk-usb.c b/drivers/clk/sunxi/clk-usb.=
c
> > > new file mode 100644
> > > index 000000000000..1a93400353de
> > > --- /dev/null
> > > +++ b/drivers/clk/sunxi/clk-usb.c
> > > @@ -0,0 +1,193 @@
> > > +/*
> > > + * Copyright 2013 Emilio L=C3=B3pez
> > > + *
> > > + * Emilio L=C3=B3pez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
> >
> > Hmmmm, the copyright notice seems weird :)
>=20
> The code was pulled from clk-sunxi.c, which only has Emilio's
> copyright. I suppose I could dig up who actually wrote the code.
> I think it was Hans.

Ok. The copyright date should at least be updated.

> > > +     clk_data->clks =3D kzalloc((qty+1) * sizeof(struct clk *), GFP_=
KERNEL);
> > > +     if (!clk_data->clks) {
> > > +             kfree(clk_data);
> > > +             return;
> > > +     }
> > > +
> > > +     for_each_set_bit(i, (unsigned long *)&data->clk_mask,
> > > +                      SUNXI_USB_MAX_SIZE) {
> > > +             of_property_read_string_index(node, "clock-output-names=
",
> > > +                                           j, &clk_name);
> > > +             clk_data->clks[i] =3D clk_register_gate(NULL, clk_name,
> > > +                                                   clk_parent, 0,
> > > +                                                   reg, i, 0, lock);
> > > +             WARN_ON(IS_ERR(clk_data->clks[i]));
> > > +             clk_register_clkdev(clk_data->clks[i], clk_name, NULL);
> >
> > Do we really need to use clkdev for these clocks?
>=20
> Original code. I don't think we do.

The only reason why we should have clkdev is for the protected
clocks. We should move away from that code, and I don't think any of
the USB clocks are in that case anyway.

> > > +     if (IS_ERR(reset_data->clk)) {
> > > +             pr_err("Could not get clock for reset controls\n");
> > > +             kfree(reset_data);
> > > +             return;
> > > +     }
> >
> > Newline, and that block should probably be part of the if block above.
>=20
> NULL is not considered an error, but maybe being in the same block
> makes it clear that they are related.

Yeah, maybe it's just me, but it triggered a might-be-uninitialized
warning in my brain while reading it (while the kzalloc above
obviously takes care of it)

It would be more logical to have that inside the if statement.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--924gEkU1VlJlwnwX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUxkMvAAoJEBx+YmzsjxAgmYUQALIc4h5yCRJrnGT/7aZ23hB3
UXq1rRQ7sWNK+t1Iw1lo2xStcWQMiEwHXHBrOJeqjSfYPXI0Rjc3cm2RPzHQ2/of
LxK9d5STplJQ+IrruSJuXcc1zS0ouB70uC4Is675BaIbJv21gGGLwBNIbBVYviwU
7gHt3DYNpEBUhJWC/DnIrATEZZKYduyJENKFE8we0j/clDSCv/qIhhbqQVcNvULZ
FzuXsg1BieiMQfARymOAFWe6xRSWwn28XOc5oZFL41hQPtmvsS0/Hjkm4jU0CrdR
jYL0EyNmDxO5vBsB8ve4yFncE2Mie5N4H7wO7xjab606mSYFTTYfgjJgo7gUGn4j
WJnPWKytwe5YhJojD+IoeHimrEPmpaYq8e11etDaum/lpCElFpQsInbg3aRIWbrn
J6WnKZDNywRY7Fzw2no9dn0rnYJDMox1JNNr39IGQgdbHlgTY3jTncvetUkJh1gC
1NKRsRviVk9vATEs10dw4rPetwWyRX0R6Ite0IJrRIJ7Ni7i66AoCwH/c+9/Qp7w
NU97RsX03Yu1olH4OeCYHV+wYOl5hd4ZCylTY1jL20K3Z6x4uId59z4F1WUqLUV4
vsJ5ydrnRXSYHtGdj3BbZAzeXiomJ/BUXzpv7559fh6mkpSO9jsPJYdLLZk3gsYD
GjcaFkzhppvjhXfsdRn7
=2MRX
-----END PGP SIGNATURE-----

--924gEkU1VlJlwnwX--
