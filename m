From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH -next v2] gpu: host1x: gr2d: fix error return code in
 gr2d_submit()
Date: Wed, 24 Apr 2013 08:43:59 +0200
Message-ID: <20130424064359.GB1429@avionic-0098.mockup.avionic-design.de>
References: <CAPgLHd8zemyHf9j18qUrB4DUD8Qfn5PNj+KM7YVqL0RxHSVbzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3410757126782494505=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPgLHd8zemyHf9j18qUrB4DUD8Qfn5PNj+KM7YVqL0RxHSVbzw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============3410757126782494505==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2013 at 10:44:08AM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
>=20
> Fix to return -EINVAL in the host1x_bo lookup error handling
> case instead of 0, as done elsewhere in this function.

So with my comment to v1 addressed this becomes invalid again. I think
in both cases using -ENOENT is a better choice. Pretty much any instance
where drm_gem_object_lookup() fails is handled by returning -ENOENT, so
we should do the same in this driver for consistency.

Thierry

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRd38vAAoJEN0jrNd/PrOhkx8QAKirR4dkrXP0hQxUzEyeBxI9
S2fyPytNZVBYQTI9pyOU1Psu/xA0u3o5qmbmdwuM76EKyWdNnXGJITr9n40XIQBU
/2F7xzDhsQbe9Pg2KMUN8h5cNAHLSBsltqHJvnr5zNsGgrF4fBOwIVnSVIjELr7A
U5mGFPI0rt5nEcGNopsuh7nf2fBcSuCrJmM3vHlBXNDSxcdMYc7zhkIBOZprTHN9
HoOrO7BiVQRNU1bOrkjHscYiKMaLJtrrLbJFlBO4QdDGQXOcxbBJlxU9kno5p8Yu
yjwI61HksrlR0l7h+s3KNGlDr7B6WuQ8WgBxFpojtO0nA7w+PWJhQODccgZ5kY5b
cTUCVpMOk8Vn6kVtii52Txdexbn7ZQPgfWwannMB/wJHG5EQb5dyOLNuGuOZZvBV
Lfw3qWY6tlEdLIPQ7bf/ETNJjGXyrNIHVb/hZFtzjU9/hoDO6pvsTxweN1nwajnP
lta8LtlsHBvK+1fI7okL2vRQe2JqwhNtSeI0IjPXjkzDI0irmkoPyfX9kBbl/99Z
9LwburFHQi8YT5wUMlFlzVCduOWiXSWpZOEwFJBMFleHZfI0ggotAQoz09op/Ce/
tv4DwOhcyGZh5o9tnlm2AyRw3mymz7oCx8nqPfQlyTKpTXy/Kbu/QSkG6zZ0eL8d
29WEKSy5q7xhIVV/wJBk
=C2h1
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--

--===============3410757126782494505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3410757126782494505==--
