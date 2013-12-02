From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Add MIPI DSI bus device tree bindings
Date: Mon, 2 Dec 2013 22:04:36 +0100
Message-ID: <20131202210435.GA19644@ulmo.nvidia.com>
References: <1385998631-18515-1-git-send-email-treding@nvidia.com>
 <1564239.XE5EGzcucS@flatron>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1564239.XE5EGzcucS@flatron>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 02, 2013 at 08:57:20PM +0100, Tomasz Figa wrote:
> On Monday 02 of December 2013 16:37:11 Thierry Reding wrote:
[...]
> > +Example
> > +-------
> > +
> > +	dsi-host {
> > +		...
> > +
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		peripheral@0 {
> > +			compatible =3D "...";
> > +			reg =3D <0>;
> > +		};
> > +
> > +		...
> > +	};
> >=20
>=20
> In general, this looks good to me as a starter, so we could have support
> for DSI bus merged. IMHO we should consider adding some generic bus
> properties in future, though.

To be honest this looked somewhat minimal to me too at first, and then I
tried to come up with any other properties but couldn't think of any. Of
course anything that we add later on has the potential to break ABI
compatibility.

A few of the things I had in mind that might be added as properties were
the number of lanes or the video format. But those will already be
implied by the compatible value and therefore don't really belong in the
DT.

But if anyone can think of other properties that would be useful for DSI
host or peripherals, by all means, let me know.

> Anyway, have my
>=20
> Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Thanks,
Thierry

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnPXjAAoJEN0jrNd/PrOh1JwP+gOnHuS/6DXOlS3ioP7ysMxM
Oef3nUd+RfskjU5NELlJXxPyZGnyiT6sPYospX1kZcPmT1h5q4ccdsKOMObV3Onl
WjvZyw4FvgTmdZBeoIBlBzhLlyl/iGpbpY9JLbQ98c8/al2jwlShgasiN7E4kZ5m
3o//8wiv+fFQSGniE+HSM9hnzg6EqtBHTmrMrFj/ZUcRLlSaBzBhUmkxmsvSfpAY
8sxXkhrjWoGVZ4A3FKXfBpkJTDelZHqZuc5IffgHB0XBMOM004PDca6I8q0HN6jP
qhtnkyRRO4b15/fMCzvzOlc61XdIVdEEyEcpZxVLLQYH84jchqe4dPBnhnb5lzGU
2Mwy2sK9kh4aYafPAeFIThaPhJAPL/iC1CfXI9Q1xe8ETQWsPb1p34k/LCzPDFGH
jCQuXRhxxP2XdTcli7PvudBmkDK6vpu8irMAvjH1l2SsFcpNaWwNt04bcTrhp57h
N2Sl8kjbYqZICHjPsvWgHET0XYf3N09u7Uw0YtgKUqPrKy9o0M/DkdnYc5ai9k+C
UFzR1ftHLLla+0KkrxCz6pPw4gmyYuEG52mnmhJzBxgikIcrtPROk8wVjCJgX4ZP
SctSW9/FIU29R7dqnowaOfrfoRnRdNm1t2zsmj7vUBpZm0QWEyCsLAyl415jVfkO
cfy/99opnNM7Ycz0HWNm
=2yhk
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
