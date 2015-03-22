From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] of: Empty node & property flag accessors when !OF
Date: Sun, 22 Mar 2015 22:03:15 +0100
Message-ID: <20150322210315.GA974@katana>
References: <1421859957-24457-1-git-send-email-pantelis.antoniou@konsulko.com>
 <CAL_JsqKxtJH=JyruyuMLXSFfTLdswOLa=AfGEbROsSSOhLLDkg@mail.gmail.com>
 <20150320121223.16D69C4076B@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150320121223.16D69C4076B-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2015 at 12:12:23PM +0000, Grant Likely wrote:
> On Thu, 22 Jan 2015 17:13:51 -0600
> , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  wrote:
> > +Wolfram
> >=20
> > On Wed, Jan 21, 2015 at 11:05 AM, Pantelis Antoniou
> > <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > > Introduce empty node and property flag accessors when CONFIG_OF is not
> > > defined.
> > > This allows us to use them without ifdef'ing them in places where it
> > > makes sense to do so.
> > >
> > > Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >=20
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >=20
> > I've asked Wolfram to apply. While not a fix itself, this is needed
> > for an I2C related fix for 3.19.
>=20
> I don't see this in mainline or linux-next, so I've applied to my tree.
> Thanks.

Thanks! I didn't have the original patch and asked for a resend. That
never happened, so it slipped through.


--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVDy4TAAoJEBQN5MwUoCm212QP/2KL1NxVjq8cjS2faaHGiwiF
O1gPTkTLra7OLHglui4SyEv7gpqnGf7Gq/Ib2Lb7r3DIHshxNKQkSzwgtLYm6RWj
ruSZJNJhsGRlZ0/+5IiffPQy3zmC0IPPVHHlZW4Z+REYFoJxN8M6baIotKTc6ho/
DqCSdrLaq9YwOi66dI5YQrTDFvLT2O4wJmm8B6LzBr0hpwbDCHJ0Sc9CZEfHrm5n
DuWXyxzAD1E9vPzl4qsmNof0zzg/5QrVZDStx5kBUmwA8sbmSSF5Or5b/qNkanrE
wLKxra5hWB/pYFr7H1O22gaVPU25ZL1Ld1tn6dUmknkoDzJ5Q8eHNDmqJFnlbQvb
WyuJFPe7pZYJkJiY9uEHjdeGVEw7YY0S3RRvOe6rE2mjnaNsjqBlecNUG8DPqnrD
QcQ4kwha+VNUqogeCYDei/Ejc4wJBkFUoeNoUkv5z2312o2TjvcJqaGsOtl1iVXL
vfVRCiQXmhOoRPP8SKNGsXHn1teMvukWqbT9dga9jxzTgc4oSh/NNJyjLH6vtZ9J
prq31YM2PM/Z6S03al4Kmmk6tMVxUTuEO2249JXtdfEC0lRJtXa3wP2HAQb9cEZc
p4+FdGEMcV28J4FhNrKf0vvpvfFlYlV6I73PmOZhoW17UZ/wV1fvs3bF/r+DXEGv
KORCGvPw1yUJe+9lUFaA
=Rrj5
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
