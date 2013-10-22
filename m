From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Tue, 22 Oct 2013 11:39:24 +0200
Message-ID: <20131022093923.GC15640@ulmo.nvidia.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131020220839.GT2443@sirena.org.uk>
 <5264576F.6050307@wwwdotorg.org>
 <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
 <52658EBC.8020800@wwwdotorg.org>
 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7gGkHNMELEOhSGF6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.03.1310211632460.1951-hIgblCxmbi8OMTOF05IoTw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--7gGkHNMELEOhSGF6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2013 at 04:40:15PM -0400, Nicolas Pitre wrote:
> On Mon, 21 Oct 2013, Stephen Warren wrote:
[...]
> > but taking the big picture into
> > account, observe that we make life a lot more difficult for distros,
> > since they need to get the device tree from somewhere. Distros now are
> > forced to work out which DTB goes with which board,
>=20
> This is not a new problem.  Before you had to figure out which kernel=20
> would go with which board.

You still need to match kernels to boards even with DT. It's no good if
you provide a full DTB that describes your hardware if the kernel
doesn't support any of it.

> > or perhaps we need
> > to define a firmware interface to obtain the DTB and pass it to the
> > kernel.
>=20
> That's the bootloader's job.  Nothing magical actually: just have U-Boot=
=20
> or whatever load the DTB from some flash area.

I agree. I think most if not all architectures that support DT have long
had some interface on how to pass a DTB to the kernel. At least I know
that ARM and x86 have, but I'm pretty sure that PowerPC, SPARC and
others do too.

> > I
> > think we can still have a hack-free, churn-free, multi-platform kernel
> > without requiring DT, but by using board files.
>=20
> I kinda agree with you, but this is too late for that now.
>=20
> We have DT, and the best way forward is to fix the process which is,=20
> arguably, somewhat obstructive and broken at the moment.

I agree that the process could use some enhancements. But I also think
that we should be open to move away from DT again if it turns out to not
be a good enough solution. "It's too late" doesn't sound like a very
good argument to me.

Essentially DT is just a different way to represent what we used to have
in platform data, so we haven't fundamentally changed anything at that
level. Well, we've made things worse to some degree.

Thierry

--7gGkHNMELEOhSGF6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZkfLAAoJEN0jrNd/PrOhvVAP/0IAQtthlp/R0fASjpcWErPX
sSTYL9ivY8Rjqp+Z/lCK6LHnTed7NoUxZHFrIINGbOqDgjc4cxd+3wkwoA3pLb6e
CIkXi2nCh3SaFvNh8vEb7IdCDhcVUel064kKKxJ5XGK7/3EkUgUPXcD3ChXWEf0N
QXMEGZr7Lu2UEpOFDWYZjsxfrzYtxN0v4CAbiIemIvsMFksxWFarfs913Pgh9+U3
uFFZg2CBRoiWAiQPDSqP8cyud/m/Eer2OpIEY5HzeOwk35VrekJwczUA+S4zo1Oa
b7OWssHze6WcCTBB1dMzQzJW2YNMZJgnkfcoKRUBG1BNLtGS08FNHo/Pkn6V/qoe
b7uPYIbehW/mCE52ERdeXH/WxsSFx/Aw8HLECREmqFV6TMCtp+lY5uAyKFIodgsb
kLkdX1Yx/ZwKbThq5G0lvvigYAzOUl1ThTf4QSiErGvIgbNCKcrCAUkk3U1IjgA/
QKnsGS0GUCuAyeiI/jO6am7POLzFr5Ik/xcK+eVHtmMEZXlkVyL6QqoPcTO7Z0VO
yKCVwe0Dn3VopESSHLC3j9u5xU5lRTz7yp3DM/9jvGkTUOdj3j48r1S7+Tk0CS+C
tVsTpzbzofCqOzJJdrmwkZuAAJkqrnQLIZ7CokJ3eAjiIUmQe2hqCx5c2QiknXRh
dKJ+ZKgSvfakEbqi8pKL
=7hH+
-----END PGP SIGNATURE-----

--7gGkHNMELEOhSGF6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
