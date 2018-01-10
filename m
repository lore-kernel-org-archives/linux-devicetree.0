From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 0/5] Add OV5640 parallel interface and RGB565/YUYV
 support
Date: Wed, 10 Jan 2018 16:37:24 +0100
Message-ID: <20180110153724.l77zpdgxfbzkznuf@flea>
References: <1514973452-10464-1-git-send-email-hugues.fruchet@st.com>
 <20180108153811.5xrvbaekm6nxtoa6@flea>
 <3010811e-ed37-4489-6a9f-6cc835f41575@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yy36qmxeqrgaten3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3010811e-ed37-4489-6a9f-6cc835f41575-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hugues FRUCHET <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--yy36qmxeqrgaten3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hugues,

On Mon, Jan 08, 2018 at 05:13:39PM +0000, Hugues FRUCHET wrote:
> I'm using a ST board with OV5640 wired in parallel bus output in order=20
> to interface to my STM32 DCMI parallel interface.
> Perhaps could you describe your setup so I could help on understanding=20
> the problem on your side. From my past experience with this sensor=20
> module, you can first check hsync/vsync polarities, the datasheet is=20
> buggy on VSYNC polarity as documented in patch 4/5.

It turns out that it was indeed a polarity issue.

It looks like that in order to operate properly, I need to setup the
opposite polarity on HSYNC and VSYNC on the interface. I looked at the
signals under a scope, and VSYNC is obviously inversed as you
described. HSYNC, I'm not so sure since the HBLANK period seems very
long, almost a line.

Since VSYNC at least looks correct, I'd be inclined to think that the
polarity is inversed on at least the SoC I'm using it on.

Yong, did you test the V3S CSI driver with a parallel interface? With
what sensor driver? Have you found some polarities issues like this?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--yy36qmxeqrgaten3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpWMyQACgkQ0rTAlCFN
r3R+WQ/+PpWKwzSUt4jRJ8W/ScArU4/gCpyJ90zzHEpU5YibSFD+Etb6WdYIwqoq
l4AIotyMvFEfpMxHV5xEJhOEO8wPiU52YwzhKbcnL4spKJPA4/x7OBxczGkgqZ04
N0UcCoc//jFHggsO9gwLSE+gOXMS3hUdj4ty6zu6qbP1DKPSte9VEezr9haPy8/Y
QHUGPUWRA4wVEvNfDbz46xg6GUfBcjxm/FwdMRpyH73FXlPL9dvc1HvL9Z6Tauf0
6+YSE8g6VM2JV8jhSYp3tmAcrrXOOa/jVApoXgvyivChqUHCLECVAKEaGGktnFgF
YVKKYFnf0FhyOVxcu5ydyKZYMzZgEXXPHTiQ2ZnI5qnT19zDx+0qT3JpIYia1ua3
5FQFSc2dQ0V9RnLEpT5CFaoQhElJjPOdAf1Bm+fdOYT0BbBgUo8zNhwQO5DE1u7t
PJ+cISh8Cm/EwwtWeEk+vHf/+UURVhIM4L9TZ5ayHy5GQQv2T+RG5U35b9f/p08s
RwkJlSToH8tO3f6e3XpFBBqBvVDwWHzYiI6Ad2GCjXW7aI1Q7Qlb71rJX9kp+z7S
JNVvlw0AVGKDGOUMoapqEXaniFkhQ0ipWSE7tylHI2zrcSDu142fcLJ4nSb/yaW4
XDcJ6Jj4Ulq8lRGNGV679JmRMcublqIZlUq2/9I2xWWorRW34Kc=
=6cVj
-----END PGP SIGNATURE-----

--yy36qmxeqrgaten3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
