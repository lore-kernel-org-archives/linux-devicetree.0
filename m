From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Generic DT binding for IPIs
Date: Thu, 10 Dec 2015 11:49:41 +1100
Message-ID: <20151210004941.GY20139@voom.fritz.box>
References: <561E2BE6.2090807@imgtec.com>
 <5628BE00.4020106@imgtec.com>
 <20151022115551.GI3953@io.lakedaemon.net>
 <56684877.3020708@imgtec.com>
 <CAL_Jsq+yv1UnBhrR+x+DEA41yETVANY9_-5W0DSQJVEQ4+Mx_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bNvn4bxlrUVLu6cT"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+yv1UnBhrR+x+DEA41yETVANY9_-5W0DSQJVEQ4+Mx_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lisa Parratt <Lisa.Parratt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--bNvn4bxlrUVLu6cT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2015 at 10:50:35AM -0600, Rob Herring wrote:
> On Wed, Dec 9, 2015 at 9:27 AM, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrot=
e:
> > Hi,
> >
> > On 10/22/2015 12:55 PM, Jason Cooper wrote:
> >>
> >> On Thu, Oct 22, 2015 at 11:44:16AM +0100, Qais Yousef wrote:
> >>>
> >>> Is there anything more I can do to get more attention about this? I
> >>> think Marc's suggestion is more generic and future proof, if I send
> >>> RFC patches for that would this be better?
> >>
> >> Please do.
> >
> >
> > Unfortunately I haven't had a chance to get around writing the patches =
yet.
> > I came up with a different description though that I thought maybe worth
> > sharing
> > to see if there's any opinion about it before the actual work being don=
e.
>=20
> I've not given this too much thought, but here's my initial thoughts.
>=20
> >
> > To summarise, the problem I am trying to solve is that we have a type of
> > coprocessors which share the interrupt controller with Linux, hence the=
 IPI
> > mechanism this controller uses. I've been working with Thomas on
> > implementing
> > a generic API to allocate IPIs for coprocesors and a way for drivers to=
 send
> > these IPIs [1].
> >
> > To complement this new API, we need a mechanism to describe this in
> > device tree so a driver that wants to allocate an IPI can have this done
> > automatically for it like we handle interrupts.
> >
> > What I have in mind is:
> >
> >      coproc {
> >              ipi-parent =3D <&gic>;
> >
> >              ipis =3D <CPU_VALUE IPI_SPEC>;
> >              ipi-names =3D "in";
> >      };
> >
> > This will allocate an IPI to go to cpu @CPU_VALUE passing @IPI_SPEC as
> > parameters to the controller. Which means we need a new ipi-cells to
> > define how many cells are in ipis property. Note the new ipi-parent too.
>=20
> These are still interrupts, so I'd prefer to use or extend the
> interrupt binding if possible.

I agree.  It should be possible to just describe these as interrupts,
with the interrupt-parent being a special interrupt controller node to
represent these IPIs.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bNvn4bxlrUVLu6cT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWaMwkAAoJEGw4ysog2bOSc1gP/1as/ZVKjydvXXC5UczHiJBq
Zhtob1DiTupJxjBszijfH/RWpoK4dH2+BOm9wOp6IpRasAK1B50FwfdmQR9tA9WG
VzUqcvlKH7L8qAK/kfTeIhLstXarOBQ1HjqHGwYtHhoYSkSO0ndP4BvvB6AB6rYF
m3BDd8sMBzT9Bu6WL4Zv5ojHuzoH3MJ1k2pjoVHj6Jaz9NBV4nnDK+a2gEmWhpRQ
A8SPwaTnAXyR+2xIbjSQkKCsSmaKRL/gfl9JlEOG8PxrzK8oi+w1+3bwF4E3q0mb
BeVnLslsbJDR93IysHUXV23qZiYOh7oDxg1KRa1zN6J2gqEkpndaDczEEtBcHcxj
hn9+8puF9L6Wu85PpGR+wXuyYcPyEFy80ClDlsuLO3n3PvNnmQl4AL8aiGi0DHJ3
eeMUM0Bjmhn5hDnXHMA8VGOjaCtiVcaudbA75UtvGXvHRBj0AcpMHUXEniDpNYWF
k0FsUj93OIBd+fXf6iQRDeKFVkmw2CfsSUqiyk5+QYf3/yh2raI1WDImhjZn3fPh
Io3yqINZ6bry5wUJjZcpmHLLA97nVTtterbhUwKS2wRD4qRKu9dEBY7lDDXAHG9z
tHABeol27XYRofucTpdVCiHtLuh0mutk84XkFVZohoH2i00F1ZmD8hRiM8ZhkE7C
9ufw94lyK2n/fxcQGcTC
=qJ05
-----END PGP SIGNATURE-----

--bNvn4bxlrUVLu6cT--
