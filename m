From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] devicetree: add a binding for a group of regulator
Date: Mon, 24 Nov 2014 15:24:33 +0000
Message-ID: <20141124152433.GD7712@sirena.org.uk>
References: <1416834123-23139-1-git-send-email-alban.bedel@avionic-design.de>
 <1416834123-23139-3-git-send-email-alban.bedel@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tEFtbjk+mNEviIIX"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416834123-23139-3-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--tEFtbjk+mNEviIIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2014 at 02:02:02PM +0100, Alban Bedel wrote:

> +This binding allow creating a group of regulators for use with simple
> +drivers that only expect a single power supply. Additionally it is
> +possible to enforce the enable ordering to create simple power up
> +sequences.

Absoutely not, this sort of scripting is not sensible - if the consumer
device has multiple supplies the consumer device should be working with
them independently and if the consumer has ordering constraints it needs
to enforce them itself.  Trying to solve this problem with a bodge in
the regulator API just isn't the right place, leaving aside the above
most power sequences involve things other than regulators like clocks
and reset signals so just doing things purely at the regulator API level
isn't ging to solve the problem. =20

Please look for the generic power sequence stuff that was getting
discussed a while back and try to resurrect that if you feel there's a
compelling reason to have this functionality without doing it for
drivers.

--tEFtbjk+mNEviIIX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUc02xAAoJECTWi3JdVIfQAb0H+wYUhYLOS3n1+LVp11OOqK07
4PQp5AtIDF5crOcHO5pivr7gB5eqNE6KpZZWZFk5ON7HbBIkIhnSlG/6QLOSvW8v
CIZk6SRZrhemYMJ5KdqNy76ytk1jdTFPWlJ0QXKeJ+X/r7VDbyvRTFh/BIKx4EP6
Ut6WFKvYfTJZIaJ+b0FpNGd5s7kdQ+S9iGsbvjpRszM+lqJH1upNlK2GK6R9WVW7
MiIMgJBGgsohsY/YUmyY5QbqsDg9ZDLSBWWx1qzCZgRvJBVTyvl+GSo7GdctxcQV
4Dd0xZlwtJ8zh4hATHOTaFi7eDrutEsrIAiSpEOr0+yly/whwhbK2RvQrC8RDsk=
=qh7o
-----END PGP SIGNATURE-----

--tEFtbjk+mNEviIIX--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
