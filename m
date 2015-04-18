From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arch: arm: Show the serial number from
 devicetree in cpuinfo
Date: Sat, 18 Apr 2015 14:37:25 +0200
Message-ID: <1429360645.2424.4.camel@collins>
References: <1429296235-14123-1-git-send-email-contact@paulk.fr>
	 <1429296235-14123-2-git-send-email-contact@paulk.fr>
	 <20150418091310.GI12732@n2100.arm.linux.org.uk>
	 <1429350313.2424.1.camel@collins>
	 <20150418122758.GJ12732@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-nzixEL+UiLfmk8cyLAVP"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150418122758.GJ12732-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-nzixEL+UiLfmk8cyLAVP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 18 avril 2015 =C3=A0 13:27 +0100, Russell King - ARM Linux a
=C3=A9crit :
> On Sat, Apr 18, 2015 at 11:45:13AM +0200, Paul Kocialkowski wrote:
> > Le samedi 18 avril 2015 =C3=A0 10:13 +0100, Russell King - ARM Linux a
> > =C3=A9crit :
> > > Hi,
> > >=20
> > > On Fri, Apr 17, 2015 at 08:43:55PM +0200, Paul Kocialkowski wrote:
> > > >  static int __init init_machine_late(void)
> > > >  {
> > > > +#ifdef CONFIG_OF
> > > > +	unsigned long dt_root;
> > > > +	int size;
> > > > +
> > > > +	dt_root =3D of_get_flat_dt_root();
> > > > +
> > > > +	/* Scan for serial number */
> > > > +	system_serial =3D of_get_flat_dt_prop(dt_root, "serial-number", &=
size);
> > >=20
> > > I was really hoping for:
> > >=20
> > > 	if (of_property_read_string(of_root, "serial-number", &system_serial=
))
> > > 		system_serial =3D NULL;
> > >=20
> > > here.  I can't see a reason to use the flattened DT at this point as
> > > we've already parsed it.
> >=20
> > Good point -- I'm not very used to using device-tree so I didn't think
> > of it, thanks for mentioning it.
> >=20
> > At this point, I guess I can also add your Signed-Off-By to the patch.
>=20
> No - Signed-off-by is to indicate the path by which it was committed
> into the git tree, not for review, etc.

Right, but since you've provided me with code samples, you might as well
hold part of the authorship of the patch.

> I'm assuming you'll be submitting this to my patch system eventually,
> which means when I apply the patch, it'll have my S-o-b automatically
> added.

V3 (that includes your suggestion) was sent already.

Thanks for the review and comprehensive help!

--=-nzixEL+UiLfmk8cyLAVP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVMlAFAAoJEIT9weqP7pUMRB8P/2yC9BS4t5NZWMleGVIwo17M
94H2wu1doicDG0WrENg9pvSxm6wnE5ZkU5RDm55ihF3PBzZqpa3nuHvlFSo/cPSU
prcdpvcauoMmRxQepBNRB6ucOAKIjRetkPOBhwd7HZhzjYB5hAl6Br/TDJeajmz5
PXT8Njpd3kfP/Kr2KqJwsiLDSbVeeyzS/madhBh+4DLMPlP0/ADvIXoEwgvs1wR4
vHrVHJ3/4Y6hNm628yXXU/a1+sUZg7XW4+F2lh07AyzHcm7ofuArBCEUlojKepa0
35xBPb1b+xEHAA4nzTJWf+ioow/9SGDAT5Ia5CCqz8SS+nxC1MXhDiCuixa7MgKI
9dO3FWFHYvx9qaX2Bjtdds765qP3M+bTaU/r+IPySEV580GWK8SggOrX58sFRPcD
y30UtqO0Ei8sAyDVToZ32UXorVM7xcLHPXe2tPdLyVmnMSGcHShjIr2zE54AqMrU
25cuDEMy3aqekuLAcUs7Q4Foqh7Ix6VIl0fLGlyuXl8Jia/1q0I+6ThMCaieiOBy
CSH1q1TvIXtgfzUIaojWYQ+lw8mF5H0RPMmnNmWph8ISMxZvrbDUbmCvi25av8Xb
x661sL3FE0R8XYqJDAefBFJHaFFWF/P3FNdo1ZcjUrDcVLKecVHnpBmE+558dkYK
BhfBtjqqYOcDBPW+Um6e
=5+GE
-----END PGP SIGNATURE-----

--=-nzixEL+UiLfmk8cyLAVP--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
