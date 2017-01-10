From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH 3/6] clk: sunxi-ng: Add H5 clocks
Date: Tue, 10 Jan 2017 20:10:02 +0100
Message-ID: <20170110191002.tpdzjlf2eeck4fv6@lukather>
References: <20170109161500.Ep9GCmIb@smtp2p.mail.yandex.net>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3hvn6fukr4dve4o3"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBC7D2TBQKGQEEYMQUGQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170109161500.Ep9GCmIb-8ttnI0T0xQU0PDqKvflMoHmW9unr2Ajn@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--3hvn6fukr4dve4o3
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2017 at 09:13:12PM +0800, Icenowy Zheng wrote:
>=20
> 2017=E5=B9=B41=E6=9C=889=E6=97=A5 =E4=B8=8B=E5=8D=887:01=E4=BA=8E Maxime =
Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, Jan 06, 2017 at 06:48:31AM +0800, Icenowy Zheng wrote:=20
> > >=20
> > > 2017=E5=B9=B41=E6=9C=886=E6=97=A5 06:04=E4=BA=8E Maxime Ripard <maxim=
e.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A=20
> > > >=20
> > > > On Tue, Dec 27, 2016 at 12:25:15AM +0800, Icenowy Zheng wrote:=20
> > > > > Add the H5 CCU clocks set based on the H3 one.=20
> > > > >=20
> > > > > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > > >=20
> > > > Is there any difference with H3's?=20
> > >=20
> > > One more Transport Stream controller, so one more bus gate and bus=20
> > > reset for it.=20
> >
> > There's no need to duplicate more than 1000 lines of code just for=20
> > that then. Just add a new compatible and reuse the clocks already=20
> > defined.=20
>=20
> How can I do this? Add them in ccu-sun8i-h3.c ?

Yes, you can have a look at how I did it for sun5i for example if you
want.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--3hvn6fukr4dve4o3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYdTGKAAoJEBx+YmzsjxAge5IQALivA2EeJJ0z/3DRp+lkcvjW
MvWJ2BX3jMEKXKKYdleo46nAgvboW0wP4JjYqZdee/JdFNu686Ts3d3TPzY+mZJn
dLGNB26Vdhsb9gm0Yp6mkrRkflvhahrwKYhcHP8jJ6vkdrvieGwxTTTAhb6pNmt4
iCSUhVtd/ofYujZOwT1YNzVwbut6pub2WJh5h+lG3K43noyxcGIDJF2VDI9yaZcG
avmLzQcRpYGOeOJ4kUs32yexYwmTpLcmIwsQX+qoP12FhpW6tgZGa+LgIj4P2htt
f82FC2sGaWyRZQ8rp+DVdD0tSzSHf9JW2b6qQItTeV8olod1Ud2D41I6+DgvqbHh
Osob6/sTE4zBSQX+3pN7Hjc0K/PffGTpy0NU5/TjPR/da3VcT1C0iPbLWLufWUur
5gQyA1Ktv6zO/o9nU+SuIrrJqWj2V39aiOMOIGUOpn58jpRJeHe+UtDsbzJyOszV
3Fx1tnyEqgRpazmeYj402YGAJ4iGhiiFOY/tbPnYMPNvpw59HCwEY/q1Ll7WScOf
nbxkFxKln5ZgG2qzruFsCSGNa/Nvqarah0y9KFxCjHGZKhArWsuoGAGsQk8u4MHf
h7BwDa1ZuLAhA0KmJ8hB17hqM7Lg5vV+n3kCaF3rgWejIC/HQs4b3jiCIR/LtiJx
wyYZlPSK2IHQCvBx8+Eg
=0c+x
-----END PGP SIGNATURE-----

--3hvn6fukr4dve4o3--
