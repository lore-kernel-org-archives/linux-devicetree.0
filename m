From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH] devicetree: Add video bus switch
Date: Fri, 10 Feb 2017 22:17:40 +0100
Message-ID: <20170210211739.GB1615@amd>
References: <20161023200355.GA5391@amd>
 <20161119232943.GF13965@valkosipuli.retiisi.org.uk>
 <20161214122451.GB27011@amd>
 <20161222100104.GA30917@amd>
 <20161222133938.GA30259@amd>
 <20161224152031.GA8420@amd>
 <20170203123508.GA10286@amd>
 <20170208213609.lnemfbzitee5iur2@rob-hp-laptop>
 <20170208223451.GB18807@amd>
 <CAL_JsqK2RHLoLc_ikHzP2B5_Lof2g9NG+zvamGe4o1ko1ggGQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqK2RHLoLc_ikHzP2B5_Lof2g9NG+zvamGe4o1ko1ggGQA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-02-09 16:58:29, Rob Herring wrote:
> On Wed, Feb 8, 2017 at 4:34 PM, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org> wrote:
> >> > +
> >> > +This is a binding for a gpio controlled switch for camera interface=
s. Such a
> >> > +device is used on some embedded devices to connect two cameras to t=
he same
> >> > +interface of a image signal processor.
> >> > +
> >> > +Required properties
> >> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> > +
> >> > +compatible : must contain "video-bus-switch"
> >>
> >> video-bus-gpio-mux
> >
> > Sakari already asked for rename here. I believe I waited reasonable
> > time, but got no input from you, so I did rename it. Now you decide on
> > different name.
> >
> > Can we either get timely reactions or less bikeshedding?
>=20
> You mean less than 5 days because I don't see any other version of
> this? But in short, no, you can't.

Could we switch device tree bindings from "cc: subsystem, to: device
tree" to "to: subsystem, cc: device tree" mode? Currently it takes
more effort to merge the device tree parts than the relevant driver,
and that is not quite good.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlieLfMACgkQMOfwapXb+vLnsgCeNcc8Nh0PChLaxzfMg86wi5+Q
7foAoJIINIWM/YEYJUcNCsB1O5tyJrsr
=J3G6
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
