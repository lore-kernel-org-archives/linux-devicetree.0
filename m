From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v7 11/18] v4l: async: Register sub-devices before calling
 bound callback
Date: Fri, 8 Sep 2017 14:28:40 +0200
Message-ID: <20170908122840.GL18365@amd>
References: <20170903201805.31998-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="I4VOKWutKNZEOIPu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170903201805.31998-1-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
 <20170903174958.27058-18-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
 <4900fc41-1b57-deb6-2041-26a6333f2033-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
 <20170903174958.27058-17-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
 <3921fde8-6192-87d7-9c5d-5dd2035a9565-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
 <20170904163400.z26qmxuejhgdcmrw-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
 <0bb75f81-cc81-a4bf-f2af-41862c1d777a-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
 <20170903174958.27058-16-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
 <20170904162925.hxtzy5jagv5ylq4c-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
 <96371574-0205-fd0e-452e-d001695bd69e-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
 <20170903174958.27058-15-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
 <20170904162705.thujzc7xw6hgjau3-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
 <9a68a9a6-0949-f1c2-f029-8045d7d688b0-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
 <20170903174958.27058-14-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
 <31d63a76-adab-2a04-12dc-4717b1512eaa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
 <6ad1c25a-e2a7-b73f-4d7c-6a5c071e6366-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
 <201709041
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--I4VOKWutKNZEOIPu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2017-09-03 20:49:51, Sakari Ailus wrote:
> Register the sub-device before calling the notifier's bound callback.
> Doing this the other way around is problematic as the struct v4l2_device
> has not assigned for the sub-device yet and may be required by the bound
> callback.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--I4VOKWutKNZEOIPu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmyjPgACgkQMOfwapXb+vIU7QCePl5cQWXsl+r5gT5D11yR2Zf4
rS8AnAjJkMAIdUkaudTEa+Bjt/zMdFPo
=gAI5
-----END PGP SIGNATURE-----

--I4VOKWutKNZEOIPu--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
