From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: root node serial-number
 property documentation
Date: Thu, 16 Apr 2015 11:10:21 +0200
Message-ID: <1429175421.2483.1.camel@collins>
References: <1427564371-26039-1-git-send-email-contact@paulk.fr>
	 <f6f4f862c78fa626e7f94bde51eec5b1@agner.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-a/FDKcJLymSLyQkl38u/"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f6f4f862c78fa626e7f94bde51eec5b1-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-a/FDKcJLymSLyQkl38u/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 16 avril 2015 =C3=A0 09:56 +0200, Stefan Agner a =C3=A9crit :
> On 2015-03-28 18:39, Paul Kocialkowski wrote:
> > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
>=20
> I think this is a worthwhile standardization.
>=20
> Acked-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Thanks! I should also add a commit message in v2 mentioning that this is
already used in open firmware and reported by lshw.

> > ---
> >  Documentation/devicetree/booting-without-of.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/booting-without-of.txt
> > b/Documentation/devicetree/booting-without-of.txt
> > index 7768518..8b055897 100644
> > --- a/Documentation/devicetree/booting-without-of.txt
> > +++ b/Documentation/devicetree/booting-without-of.txt
> > @@ -828,6 +828,10 @@ address which can extend beyond that limit.
> >    name may clash with standard defined ones, you prefix them with your
> >    vendor name and a comma.
> > =20
> > +  Additional properties for the root node:
> > +
> > +    - serial-number : a string representing the board's serial number
> > +
> >    b) The /cpus node
> > =20
> >    This node is the parent of all individual CPU nodes. It doesn't
>=20


--=-a/FDKcJLymSLyQkl38u/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVL3x+AAoJEIT9weqP7pUMCZEP/iKxaW/3wi3/bdwt3wIWQX2Y
eS4GEPVSc4vAVnv+QnO5FLF3bkUukOqTggrvPSF7FC6VuTw8bLXso0VLnqKbFpnf
U6HKqKeiTjkkJPBYbBB4ECNkum3sMv/lqY8h0INAOTvu2g7vFzO0ke3bWysb+lVv
Cbfq/sUdjh7jOmcxcPenFZkfTDrKMShr0jJwOzRee2B8KT2q1L6dSJAdgqv7//wU
2I1exdgyutn0xPtVaHPZz7l2CGxZ0DlLvf59/smxeIZPboR8BFU+ZIPonhWTxFCc
U6v6TzGdib9jB7Iyi6r8NpNtDaBHb7U4KdszCVszMk4Up/dpI34mm9HqiC021xyu
N1AjAgdKpXC+XiKmZffBiBArENdFOxSM6gTufkSs+ewviLEH58BwUNCtK2rRg4Uf
a4fXgZ2rzvGJki0M5z5bAw7zjZPtLEy4MoFMG4ASAcVDKQASF7SYwpI6brdyK18O
oFBTeINxqVLOKIO78lWcsnTVx1xmMY/E55pwkW0lyT/rJCFF7w2QNQGxtmTpVyZg
qKr5FJgFlmReijmzQa3eEVFzn39DeMyUS62ySrjfmotPle59jC0oeOR+GabOiEt2
uLGu6/f4OMERMcOQShCxug5B6rogGXLzC3UJk/LGGkajN+YnODgEYWtkDFElfCL7
q/epKcxWvu2djWiq+nFe
=1vMJ
-----END PGP SIGNATURE-----

--=-a/FDKcJLymSLyQkl38u/--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
