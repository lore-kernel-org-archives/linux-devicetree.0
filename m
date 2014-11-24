From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] devicetree: add a binding for a group of regulator
Date: Mon, 24 Nov 2014 17:55:16 +0000
Message-ID: <20141124175516.GM7712@sirena.org.uk>
References: <1416834123-23139-1-git-send-email-alban.bedel@avionic-design.de>
 <1416834123-23139-3-git-send-email-alban.bedel@avionic-design.de>
 <20141124152433.GD7712@sirena.org.uk>
 <20141124183204.79f3487e@avionic-0020>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SEFvVLxbW/dEDtN8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141124183204.79f3487e@avionic-0020>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--SEFvVLxbW/dEDtN8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2014 at 06:32:04PM +0100, Alban Bedel wrote:

> Honestly my primary aim wasn't the sequencing, but rather to increase
> the usefulness of generic drivers. Generic driver generally only
> manipulate a single supply, however many hardware might have more,
> and won't need any specific power up ordering. Having to write a full
> new driver just because of an extra supply doesn't seems to make much
> sense to me.

I'm having a really hard time following the above - you say "generic
driver generally only manipulate a single supply" but that's absolutely
not the case.  A driver should control exactly as many supplies as the
device it is controlling does. =20

The nearest I can get to something that I think I can understand is a
device variant that has some changes in supplies but varaints aren't
something that we need to write entirely new drivers for, just new
device IDs and a few lines of conditional code.

It's possible that I'm missing something but I'm really struggling to
see the problem that you're trying to solve here or why this is an
abstraction that makes sense.

> As alternative solution to this problem I though about allowing a list
> of regulator for the supplies:

>  vin-supply =3D <&reg1>, <&reg2>;

> The API could still return a single consumer but it would operate on
> all the regulators in the list instead of just one. Would that be a
> better solution?

No, that's even worse - this is just hacking around whatever problem
you're facing.  The device tree should accurately describe the hardware
not some random thing that vaguely looks like the hardware because it
happens to let us shoehorn things onto it.

--SEFvVLxbW/dEDtN8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUc3EEAAoJECTWi3JdVIfQPEEH/RLOmYkaZrn1S5iAYK3KXtrx
tmfcUWVcfTsqjxGZD7uhFiz5eGm85mjWHoJkpQL6tD9q9pEJ9/hrydsoVGwVSu9T
oHXcBCZrc0ID/qjI0krbFdh5BGgq2icLKdkV8vrHkFr2FZ9F4WN9vWkXaMiLpdPO
84ES0JT0jmJ/2iU64AnuImgqHn2UOTt8TX8ZgZXk2XwDsMpjGO2OwFA+ZTUsQ0Io
iJff3QoTo33O8LcnOydynYdAWKAONBCIrMWPE0w79FwZpMrZzwnYWfUbvhW+PWHD
oArJSldXA6OksCl7AMct30z8aJ89Ygj8wHHE0kbFetBBC4foUk2aNxlLb+WB+sI=
=uMfH
-----END PGP SIGNATURE-----

--SEFvVLxbW/dEDtN8--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
