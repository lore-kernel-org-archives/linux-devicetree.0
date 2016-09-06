From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 4/7] dts: sun8i-h3: add UART1-3 to Orange Pi Plus
Date: Tue, 6 Sep 2016 22:02:00 +0200
Message-ID: <20160906200200.GL9040@lukather>
References: <1472671858-29220-1-git-send-email-jorik@kippendief.biz>
 <1472671858-29220-5-git-send-email-jorik@kippendief.biz>
 <20160902070425.GB6313@lukather>
 <20160903120932.GA6289@carbon.kippendief.biz>
 <20160905193111.GC4728@lukather>
 <CAGb2v67dnnxOp_yPyC8icu-m0WZ-Rs1STs1tnxJMOLfcRfRzUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="f54savKjS/tSNRaU"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67dnnxOp_yPyC8icu-m0WZ-Rs1STs1tnxJMOLfcRfRzUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--f54savKjS/tSNRaU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2016 at 11:04:38AM +0800, Chen-Yu Tsai wrote:
> On Tue, Sep 6, 2016 at 3:31 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi Jorik,
> >
> > On Sat, Sep 03, 2016 at 02:09:32PM +0200, Jorik Jonker wrote:
> >> On Fri, Sep 02, 2016 at 09:04:25AM +0200, Maxime Ripard wrote:
> >> >Unfortunately, these pins can be used for other purposes as well, so
> >> >we cannot make force that decision down to our users.
> >>
> >> Yes, but since the associated peripheral is disabled, the users are fr=
ee to
> >> configure other functions/peripherals, right? I mean something like th=
is in
> >> pseudo-DT:
> >>
> >> /soc/pio: pinctrl@01c20800/uart1_pins:
> >>   allwinner,pins =3D "PG6, PG7";
> >> /soc/pio: pinctrl@01c20800/foo0_pins:
> >>   allwinner,pins =3D "PG6, PG7";
> >>   ..
> >> /soc/uart1: serial@serial@01c28400:
> >>   pinctrl-0 =3D <&uart1_pins>;
> >>   status =3D "disabled";
> >> /soc/bar:
> >>   pinctrl-0 =3D <&uart1_pins>;
> >>   status =3D "disabled";
> >>
> >> Assuming Linux/DT allows this, this would force nothing, only offer ch=
oice
> >> and ease of use.
> >
> > Hmm, sorry, I went over your patches too quickly...
> >
> > That's a great compromise I think. Chen-Yu, any opinion on this?
>=20
> In short, I'm ok with it. But please put an explicit
>=20
>     status =3D "disabled";
>=20
> and probably a comment about how/where the peripheral can be
> used in the board dts.
>=20
> I intended to do this for the Banana Pis. Though my original plan
> was to enable Raspberry Pi compatible peripherals by default, and
> list the other peripherals that are defined by the vendor as
> "disabled".
>=20
> "Defined by the vendor" means that the vendor has some sort of
> document associating the gpio header pins with the peripherals,
> as shown in:
>=20
>     http://www.orangepi.org/Docs/Pindefinition.html#CON3_Definition
>=20
> This should make it easier for the average user to enable the
> peripherals. I'm not sure we should list _all_ possible ones
> though. That would make the list very large, and some might
> end up never being used.

Having a clear limit on what we can put and what we can't isn't very
easy to do though. Any suggestion on how we can solve that?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--f54savKjS/tSNRaU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXzyC4AAoJEBx+YmzsjxAgo78P/3auAfN73m1ljLVvFHtoX4mp
d9GU7XOIQ+jzrhY75OMhB6O6OQximIJ0I4hn0HH/b/H7TNo28GubYZqXNydYnUzr
4og+m7riHBZUPKeaMd1L9QBKCpnyX0XTJCDJQJlU0DAbPEUojQoWiHyd9YIpScA7
qPwaQAYEzJg23IzP5NHlYNc37o0vDeyvYP+gRG4FojCPr4yN9wNI7gJn3uFcrgRR
fOaUoaTUC3OYsHff9SJ2x5DvIe9V+FkkyOaIVFYPB14HCTTZRJnTOx4wNVU89Mla
GR+bHSwNbBYi4NyV5utMQ7hfYvdlkp7adR/IO3X33YLB5qVhjYpu4e+U3a46OON8
md1gGkLny4AwbeYD6Sc7XiuMLr62dEyYNbDTpXZeKIKlFSWFGG2CjCVYedvUE84n
IGPErklR+QqNowGKVqo6vKUy8suga7EIk340+mPa0CBsRp/z+CHRfac6r1ZemwuR
gKjsgS7Viii4WYQKP1jmGOSZh+zSDTfhJ8B9VYxk3fBDxb5lpGs8kTSn34410KK0
N4GJZfHs5zVTpcSobPTFpZ6cNFWGXst2SvZ7QmhoMY8807DUmWrQ4UPvlkq+K8cp
4nj12mWUQJoSZdaULM2Uh/wHoD6kQz+WU827PTfxi2PRXfQMeLTwaLpqZ2efWed5
sedcPnnBNGrXXmY4ujVO
=NULC
-----END PGP SIGNATURE-----

--f54savKjS/tSNRaU--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
