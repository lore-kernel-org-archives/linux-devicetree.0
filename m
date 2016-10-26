From: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH 4/5] w1: add a callback to call slave when a new
 device is connected
Date: Wed, 26 Oct 2016 19:30:13 +0200
Message-ID: <20161026173013.ryziy7hhtvxgtm3n@kwain>
References: <20161026145756.21689-1-antoine.tenart@free-electrons.com>
 <20161026145756.21689-5-antoine.tenart@free-electrons.com>
 <CANLsYkxfnF9-H9mawt3BWTgy5gjf8Qs3O6iSRGiLQ=8vfYACTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pb4xep5il2qdamck"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CANLsYkxfnF9-H9mawt3BWTgy5gjf8Qs3O6iSRGiLQ=8vfYACTQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--pb4xep5il2qdamck
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Mathieu,

On Wed, Oct 26, 2016 at 10:42:28AM -0600, Mathieu Poirier wrote:
> On 26 October 2016 at 08:57, Antoine Tenart
> <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >                 }
> > +               if (fops->callback) {
> > +                       err =3D fops->callback(sl);
> > +                       /*
> > +                        * Do not return an error as the slave driver c=
orrectly
> > +                        * probed.
> > +                        */
>=20
> I don't get this part.  What's the point of calling a callback if a
> failure is not important - maybe I'm just missing something.
>=20
> > +                       if (err)
> > +                               dev_err(&sl->dev,
> > +                                       "callback call failed. err=3D%d=
\n", err);
> > +               }

In our case it can be not that important: if we fail to apply an
overlay, we can still use the w1 interfaces to access the eeprom.

Anyway, all those errors weren't taken into account by the w1 framework
before (see my other patch). Also, the w1 patches are given for the
example and could be improved. Part of the reason is the w1 framework
itself :-)

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--pb4xep5il2qdamck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJYEOgiAAoJEFxNi8it27zYepQP/3CvERUMlDtDKlbrIedEV/Mw
dhetBFyeDDSRBQ8AOA45Ag/Cwq8At3ykeHI9WPeGq0+F0GPsfNvaLSujxFFSQrnr
3XhuRKdIKK7nKxCpHBoKCqe9uANn6NdTuq/Xpk5uZaMIy8ceWK71bQ8rWXc/ra2h
yHoCzLYp/6uUnP3sNVx9P+pXxzUtSJyqMb6j4DjwtNGum0yTYeYyTrwtK2GB1tm3
UE/fzT76jfRFv+vA7Xc5vvVMaNWU/9c1qoxPYSP9FrHhQ3fF19TnWWYwc4KbLg4n
CdracQWndOQLa0vdUDgmwWhkdY6hzeidEX7ZGZ3kpN57miHiu19K9HPk4U6/8g05
mdfW22CEml8lU79C/hHSLtkAsxH0f5lRP1I6SlkLXiABkt+7zhohULv3bnAY3Qa3
/tn7HtKf5QTLoDAJsviYUSKGTcUtlPvJ6pyLy7pnsT6wwiJKhR4b44Hs8fBT4axg
jUdee/5bZM6AK8HmHicegrRyZ+35UVIf22fm+sPtk4+93Ym6aRjqAGRCiNWL0nM/
K2EL7NRIwlWJdKYPUT0ydeal6Ukc9nV6EQL3Pekeo3xGOqAggcZrk4V3U81CUNbD
VGoOu3thn53m+j0BEq4kV3KKY4Ro/IUWOxL0F4TL6L0E5Pj5zm52FkiH9NXYJ1tm
jg2ghqn/mHmWS5OveB6e
=VfTI
-----END PGP SIGNATURE-----

--pb4xep5il2qdamck--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
