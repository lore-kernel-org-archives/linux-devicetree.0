From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 3/4] devicetree: add a binding for a group of regulator
Date: Mon, 24 Nov 2014 18:32:04 +0100
Message-ID: <20141124183204.79f3487e@avionic-0020>
References: <1416834123-23139-1-git-send-email-alban.bedel@avionic-design.de>
	<1416834123-23139-3-git-send-email-alban.bedel@avionic-design.de>
	<20141124152433.GD7712@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/QU=Byb/0kh.J=CXYMy64D.W"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141124152433.GD7712-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--Sig_/QU=Byb/0kh.J=CXYMy64D.W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 24 Nov 2014 15:24:33 +0000
Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Mon, Nov 24, 2014 at 02:02:02PM +0100, Alban Bedel wrote:
>=20
> > +This binding allow creating a group of regulators for use with simple
> > +drivers that only expect a single power supply. Additionally it is
> > +possible to enforce the enable ordering to create simple power up
> > +sequences.
>=20
> Absoutely not, this sort of scripting is not sensible - if the consumer
> device has multiple supplies the consumer device should be working with
> them independently and if the consumer has ordering constraints it needs
> to enforce them itself.  Trying to solve this problem with a bodge in
> the regulator API just isn't the right place, leaving aside the above
> most power sequences involve things other than regulators like clocks
> and reset signals so just doing things purely at the regulator API level
> isn't ging to solve the problem. =20
>=20
> Please look for the generic power sequence stuff that was getting
> discussed a while back and try to resurrect that if you feel there's a
> compelling reason to have this functionality without doing it for
> drivers.

Honestly my primary aim wasn't the sequencing, but rather to increase
the usefulness of generic drivers. Generic driver generally only
manipulate a single supply, however many hardware might have more,
and won't need any specific power up ordering. Having to write a full
new driver just because of an extra supply doesn't seems to make much
sense to me.

As alternative solution to this problem I though about allowing a list
of regulator for the supplies:

 vin-supply =3D <&reg1>, <&reg2>;

The API could still return a single consumer but it would operate on
all the regulators in the list instead of just one. Would that be a
better solution?

Alban

--Sig_/QU=Byb/0kh.J=CXYMy64D.W
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUc2uUAAoJEHSUmkuduC28AqgP/RJggBptXAJDoGAPuT9UKVL1
KwkvYyUe2A6BwZylDhvWJBNyADbOjDaXTGgCZEme/q/Hs4b3Z/mgStlxVp6/dwVS
3BrMI7hLZ4GYPJUwwPrpQ+h0V6yWGgN7OaGqn3vS02aO8TwN29BNmUajxZMDySYg
G0Lubcy8lRylMd6UrCCZ7S1ZltyrQ6a8ncAIS0MK40ilPbEB1/k1dZV2Tp2tSkG5
fSHqNGk2xu0EaWw2dxxcOmbJdWLdGI2Sn+V9/ECWm/UHfjreX5Q0TmpeQol8aBCi
GTP819nGuJ0CCrx55Cjz3ivJ4NgVkueGIoWeg2zL24CTqZciJVKI2bdhliPd+4JX
8HRK9v/Pv5VLwXdsor28WjjKiRTwUFEYLxcw8JMN5nNrBrClDzUg06ZwctENd7RA
/aW6xLA25sk+tDfczqWj4MvwRpX2aZvWi39vDC09d0+T+JjsOnDUqlR3960QHzeR
Badjmst7hyD7HYuE9r6todrtZ0EgtFfFbdlGkEpTOZqPSwO3TCckWlovuqmtBkOp
jmwQrO1MMbjj5XAYzW+KBNssnkrj0qTGyAvQ3ats0mO8SvWf2ABVLrgf3SIfwUFl
3wyIA0VXI7aderzFCT+JAI5XP27n4tcSIFQ8jv0cQkb1W1E45MOu2V4EuJzB/Kmx
nPzFJ2y7EPgFoLv/RMVH
=h4Kj
-----END PGP SIGNATURE-----

--Sig_/QU=Byb/0kh.J=CXYMy64D.W--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
