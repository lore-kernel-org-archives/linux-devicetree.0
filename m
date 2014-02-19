From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] of: Add self test for of_match_node()
Date: Wed, 19 Feb 2014 14:31:31 +0800
Message-ID: <20140219063130.GC14031@pek-khao-d1.corp.ad.wrs.com>
References: <1392762680-1498-1-git-send-email-grant.likely@linaro.org>
 <1392762680-1498-5-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6zdv2QT/q3FMhpsV"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392762680-1498-5-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--6zdv2QT/q3FMhpsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2014 at 10:31:20PM +0000, Grant Likely wrote:
> Adds a selftest function for the of_match_node function. of_match_node
> is supposed to handle precedence for the compatible property as well as
> the name and device_type values. This patch adds some test case data and
> a function that makes sure each test node matches against the correct
> entry of an of_device_id table.
>=20
> This code was written to verify the new of_match_node() implementation
> that is an earlier part of this series.
>=20
> Currently all but one test passes. There is one scenario where the empty
> "b/name2" node is getting matched against an entry without any
> device_type property at all. It is unknown why this is, but it needs to
> be solved before this patch can be committed. (However, this is testing
> the new of_match_table implementation, which still does far better than
> the old implementation which gets the precedence completely wrong.)

We can drop the above paragraph now since all the test cases passed on
the new version of of_match_node().

>=20
> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Kevin Hau <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

s/Hau/Hao/

Thanks,
Kevin

--6zdv2QT/q3FMhpsV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTBE/CAAoJEJNY7TDerrFxSrUH/3Jr8oBBifVwicj6UbNkWpwA
7qCsikQdidZLBq79gSbUVWA8maUumULh8oLUG8DMMyraVU1eFs9rvO7Wd7GMmTkN
+r2oFwTFxVumTNcvi2QYkbENwk2Z3477/dLCfIbJIUYKYKFf+Mxr4VS2kggd2qlw
bK7jVWChOQrPWBqWCJYwFhZeIfVwLwL/0SXm8VpYlPKs9GMMMF0H35Sr5pD6/w/i
Rvssz9XzmfMSpkVLzhRHhDhDLX40dshrrg3huKqIZ3D+5ORo2ZRdeBCUsILYardf
F8QCkPfbi2jpTBjWbGRoxPV+kP7QcVgHrjT1BgUk0SnszJ/QK/4d8NtiJfi/34E=
=/94d
-----END PGP SIGNATURE-----

--6zdv2QT/q3FMhpsV--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
