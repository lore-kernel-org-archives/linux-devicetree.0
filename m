From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] devicetree: Add video bus switch
Date: Sat, 4 Feb 2017 02:04:06 +0100
Message-ID: <20170204010406.piycm675bm7r6vv6@earth>
References: <20161023200355.GA5391@amd>
 <20161119232943.GF13965@valkosipuli.retiisi.org.uk>
 <20161214122451.GB27011@amd>
 <20161222100104.GA30917@amd>
 <20161222133938.GA30259@amd>
 <20161224152031.GA8420@amd>
 <20170203123508.GA10286@amd>
 <20170203133219.GD26759@pali>
 <20170203210728.GB18379@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wwo6u4ofpcf75nb4"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170203210728.GB18379@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--wwo6u4ofpcf75nb4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 03, 2017 at 10:07:28PM +0100, Pavel Machek wrote:
> On Fri 2017-02-03 14:32:19, Pali Roh=E1r wrote:
> > On Friday 03 February 2017 13:35:08 Pavel Machek wrote:
> > > N900 contains front and back camera, with a switch between the
> > > two. This adds support for the switch component, and it is now
> > > possible to select between front and back cameras during runtime.
> >=20
> > IIRC for controlling cameras on N900 there are two GPIOs. Should
> > not you have both in switch driver?
>
> I guess you recall wrongly :-). Switch seems to work. The issue was
> with switch GPIO also serving as reset GPIO for one sensor, or
> something like that, if _I_ recall correctly ;-).

I have a schematic in my master thesis, which shows how the camera
sensors are connected to the SoC. The PDF is available here:

https://www.uni-oldenburg.de/fileadmin/user_upload/informatik/ag/svs/downlo=
ad/thesis/Reichel_Sebastian.pdf

The schematic is on page 37 (or 45 if your PDF reader does not
use different numbers for the preamble stuff).

--Sebastian

--wwo6u4ofpcf75nb4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAliVKIMACgkQ2O7X88g7
+pqQhA/+MvS+RlBq5lSlWktwYMY6QAuIMzNUgR+1iWcPQPuvnTBIV5Aq4RmKGxQ4
PlK1ToFJcF942ZTAKh+LV9JzMi199diZq+m59s07cVXDshKajLU0/UImDbZkDm2+
/t1Bw+r3jKnInzgWzFEusJXUoRZ47TDw8HBY9t1CkplGf5pNl+s0jJ96wR72ddmN
K0EGvamtelyzr9iYqQpolCp39TVyr5+ewCF2jipP5dBS8rOiQks4QIRpHQ6TjoaK
2q15y4/WCdRHyY0Jc22d38TzeKSbFLsDbnRDEN/s3ll2kyYyU2X9kAfm/V2WGOaW
xs0qWPrpPsisjlJWAQ7k85ocbep7FABt+m/LdBkoy2s/b+LdQ2DvuR/2VHc0brNq
MXOgqwPixU4QTHFmlriBtfBcqTXXtJRYJxMNh89AmjNOIstjPvDQubs6IJ3RMbyD
iss3CRWOLHusUsHmSWRVXql8OaTB6Wuvw/pLLEfDNYtBs4VFBGWd0Kmp0OChmU28
l+SlALxtXpDmbtW4+ku2pRZHrim904mxgAm3R9YqDrdc1/Fu/Eztp3CbbC6hRGV1
xMNjT3kE4MUakFS5w6Up4cZwzr+Fws4piaf8f7Npm92LTqFyl1O9oV7fnPU3ol5w
Rk9bciU3EJP3yltb6ff4V25l63lS4evfVXYvZ3Zcm+xkqYx/75I=
=Z4E1
-----END PGP SIGNATURE-----

--wwo6u4ofpcf75nb4--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
