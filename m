From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/8] OF: Introduce DT overlay support.
Date: Tue, 27 May 2014 00:36:30 +0200
Message-ID: <20140526223630.GA32691@earth.universe>
References: <CAMuHMdUWfQ=2xPhNsS36mT6nv-CfR3_1exZ+5qYgdkjbBntrWg@mail.gmail.com>
 <20140516105814.3EA3FC403C2@trevor.secretlab.ca>
 <CAMuHMdWw39n8O0fFWECR6v6GaEJ3aB5S3ront4eDdXwxNO6Fgw@mail.gmail.com>
 <20140520055026.E3A98C412DA@trevor.secretlab.ca>
 <CAMuHMdXjWENrq0MW-DU2x7WnaCsWyipN4DO=y0ZTL+3G_fPYGg@mail.gmail.com>
 <20140526104824.63F13C42129@trevor.secretlab.ca>
 <CAMuHMdUGdjVKBR5rRzZ274rf7p8XfztNRWEojH1RrZV8c_V1uA@mail.gmail.com>
 <20140526112348.907B7C421A5@trevor.secretlab.ca>
 <A6195DFD-0447-4444-AC09-501C43F09924@konsulko.com>
 <20140526213303.C1C73C40E11@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140526213303.C1C73C40E11-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pete Popov <pet>
List-Id: devicetree@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 26, 2014 at 10:33:03PM +0100, Grant Likely wrote:
> After thinking about it more, I think it is very likely that removing
> all the overlays is the correct thing to do in the kexec use-case. When
> kexec-ing, it makes sense that we'd want the exact same behaviour from
> the kexec'ed kernel. That means we want the device drivers to do the
> same thing including loading whatever overlays they depend on.
>=20
> If the flattened tree was left applied, then the behaviour becomes
> different.
>=20
> I say always remove the overlays unless explicitly told not to, but I'm
> struggling to come up with use cases where keeping them applied is
> desirable.

I would assume, that I want them applied in most cases. DT describes
the hardware. If I kexec into a new kernel I change software, not
hardware.

Maybe I'm missing the main purpose of the feature. I currently see
two useful usecases for DT overlays:

1. The dtb the kernel is booted with cannot be changed for some
   reason, but the board has additional hardware attached (e.g.
   the user added a sensor on the i2c bus)
2. The hardware is changed on the fly (e.g. the user flashed the
   FPGA part of a zynq processor), sensors on i2c bus, ...

In both cases the kernel should be booted with the additional
overlay information IMHO. Though for the second case it should
be possible to remove the "programmed" hardware information
somehow.

-- Sebastian

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJTg8HuAAoJENju1/PIO/qaNmgP/jnomQAKsCJ1AIRJLvOXnMRq
tQRkJ1pWWW46W3t+dPbmyifRKuT7VL0ylZwSOySoQ/MG/Lw5VhSy4HkYVLc18gfh
dookRIUMrmoKOmjzG31ykCMU8397lofN1Ry0PKWB1p5LzvuhM4KBvqH5L2DLk7c2
9kCz8vsenmFwKyjWnO31EGtf1fNrufK2NMQVIooh0dvClqcQVuFXR287t8LWd+ep
L4Avbfk9KVpeWC7ES7/MsHiwqIjn3EFqzc52vijaQ/J5TOw4ySgH1nFc+wzU7ae3
vyoRmQ/yPYN7By1NGSqWTy0uMMD/4DR52kP4qsUn8VWGcIWoXfMmRpeZzctyAujS
MsWkG5ZzdA7POBGD+YTyzvg/JeIsY0+InRjV9bq1bsZmK58y2Go+IOFRQK7n4wwZ
wCx2yfeziAGy8EM0ZxlAfu9US6pfhVp5qsy6IcKdqHu5YP5CB/btyd0AmZ1+uDw2
LdHTo4TszXbAUHRkQWML9GQE65n7s5CNXcOxdlLpYtKg++UfAIAoip3qVpGY1coX
TTuIdlNYDqrL+1/YAa5pRvE5+FndL82WZR9eqBadOuJOO7QdIHUXw0VnKcAmHBsE
2u9mDqPjKeNLjLeGxutoYRu9u3bRip6QPtjR1iYDgizzPnsSd4JA/0yCmLLAcdPD
0/8ZCeNCV2m+BzagEEBJ
=yR8R
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
