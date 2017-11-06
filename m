From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: orange-pi-zero-plus2: fix sdcard detect
Date: Mon, 6 Nov 2017 13:26:33 +0100
Message-ID: <20171106122633.5mnqfh6xhmmxr45s@flea>
References: <20171103195855.15283-1-geomatsi@gmail.com>
 <20171103195855.15283-2-geomatsi@gmail.com>
 <CAMty3ZCs8kq1vUGLOi0ZghY7n0iXgUQ1E=ngBO6Y4wm7wMLF7Q@mail.gmail.com>
 <20171104154221.ao7kkcwqhnja3cxe@speedy.hunter>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="upsyiwlgqk2asb7s"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171104154221.ao7kkcwqhnja3cxe-tVm4GcgtBpsfMUw/CLfKLg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--upsyiwlgqk2asb7s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 04, 2017 at 06:42:21PM +0300, Sergey Matyukevich wrote:
> > > The sdcard detect pin on orange-pi-zero-plus2 is pulled up.
> > > Fix cd-gpio description to enable sdcard detect.
> > >
> > > Signed-off-by: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 2 =
+-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-pl=
us2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > > index b6b7a561df8c..a42fd79a62a3 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > > @@ -71,7 +71,7 @@
> > >         pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin>;
> > >         vmmc-supply =3D <&reg_vcc3v3>;
> > >         bus-width =3D <4>;
> > > -       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>;
> > > +       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;
> >=20
> > Was able to detect and do mount with existing dts
>=20
> Did you try to boot from sdcard ? I am not able to boot my board from
> sd-card without this change. As I mentioned earlier in my email
> to buildroot mailing list, with mmc debug enabled I see that mmc
> tries to init sd-card when I remove it from the slot.
>=20
> Maybe there is a minor differences between h/w versions or batches ?
> What is you board version ? I tested on board v1.0.

Looking at the schematics, it definitely looks like it's active low.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--upsyiwlgqk2asb7s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJaAFT5AAoJEBx+YmzsjxAg88UQAKOO1g0NqwESR+nkzCznAOFS
p+KjEEYROWHNDKJtIcdNHKI//zQOba++ccNRT9V1ySJhxJFerKh0UqRnLBv+V0gy
/D4z75riznPxq9F4nVHsYBHbeG6ki/CuWle+0tJLdRO19xlTJfXMYYHbIXEVUAGd
daN4wHQC1a9doNEdKMfgungNPpN3xNH7C7I7pWZwk9HvvQWL/nIpMKEKNwGlEnG+
fguvbZxue70Vr8jNmxRs+rzz/1oc3QSLoqJb/m6e3Tzc6cgJc5AbsgCoo0J88Jju
pMyYjPSEnzk8+/YR7iv3yRK3hPgc9dANFNc1NIodHjgMVmb66wmlHLFD8rfRYOKf
9FjkDbh6eNHaJiRZ5q8dpI0wBEo9c84Yy2i9ao1SgfBo+XkKkpYope9JR1WWDiUE
LwEdh6OFYXI/y5ydrcXljQiBAH0iQ7XMPe1PGhqSWPeY9CBtV+puZNWnN5t201LZ
FOBVOWiAoG7HuKMbcC8OEl+NYK2TspijwQSVk/4HkXDQpV3wg8V3tBTMrLZptq6S
fEiHQZm09hsa53UpD9qM/4FyuLrMbNK+D3B10U+kGuj6XylC0duCkuv7AbD9V/+j
t83QhwInqU976axRMxJI1J0AD8Eqp/DQtxRTctLNtF9/kXsEErGVE85nKTVBZKXm
HDmniwH7i3sY9KbxNX6i
=BRft
-----END PGP SIGNATURE-----

--upsyiwlgqk2asb7s--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
