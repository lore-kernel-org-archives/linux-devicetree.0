From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 16:19:56 +0200
Message-ID: <20131024141955.GB25061@ulmo.nvidia.com>
References: <20131023174458.GC5208@netboy>
 <1382553982.31058.10.camel@sakura.staff.proxad.net>
 <20131024095232.27BBCC4039D@trevor.secretlab.ca>
 <1382614439.6040.16.camel@sakura.staff.proxad.net>
 <1382615278.8522.72.camel@shinybook.infradead.org>
 <20131024122346.GD11296@ulmo.nvidia.com>
 <1382619655.6040.52.camel@sakura.staff.proxad.net>
 <516bfc7f9366ff3ef9187c36dd160888.squirrel@twosheds.infradead.org>
 <1382621431.6040.66.camel@sakura.staff.proxad.net>
 <af289ef3cc80be8de26274ba1f598d54.squirrel@twosheds.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <af289ef3cc80be8de26274ba1f598d54.squirrel-fWAbwA/6YHlc2C7mugBRk2EX/6BAtgUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 02:05:58PM -0000, David Woodhouse wrote:
>=20
> >
> > On Thu, 2013-10-24 at 13:10 +0000, David Woodhouse wrote:
> >
> >> Note that you are not describing a normal "DT scenario" here. You are
> >> describing a case in which we screwed up
> >
> > AKA "real world"
>=20
> No. Absolutely not. That was a screwup, and it needs to be *rare*. The
> excuses you present for it are crappy and uunacceptable.

That's not helping. The fact is that is has happened. And we've handled
this in the past by just changing the DT bindings. Much of the current
frustration comes from the fact that things we used to be able to do
easily are now impossible.

While I agree that many of these screwups shouldn't have happened in the
first place, it's nothing that we were prepared for two years ago. At
some point everyone agreed that DT was the way forward, so DT is what we
did. Nobody said anything about stable ABI back then, so nobody cared.
We treated DT the same way we had treated platform data before, which
has inevitable lead to the current mess, which is only slightly better
than what we used to have.

Thierry

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaSyLAAoJEN0jrNd/PrOhLIMQAJSmoILvBU5tmcUT2ohCMk+L
w9Dx7JZD5IpcoXxA4nIHaUuAcIGZULdwVd5eqSmDAk+uDm1OJwZqCQKJS9ROVDLe
7vwuTO6VlGyfB4UAaOFTpy2araqKmyRxLUR69mveVUreRapXfB96z/hLGMo/GlX+
oOEsTg/Qh4siDNMZIzZKVZahaKB2jd4NEeKbVGluz+OvkaaqD1eRS92DooxSqWiZ
3mKhKUwrFcFnqJv3RD5UctRqMjkih7wntLeB1s1Xzw+3hAY5mNUAy2UGLLXc7z4Z
C0BUh5akqiSNlMsr71SiGCeponNUPSrTXufMbZu4+jM86QL4Vmgjs0aVLqOQSgSi
YtHaoGBHzwxPccwW1zGKpesFfrbsogac7+8MKIqAw4SO2636RyspMDMDv8nI5QFZ
fqcMfRRVQf+/WED50SzFBLrXSWeK2hWTX//CgKqtbuF3kYgtYXYmySljP6ZwzgSv
pYb+9QUIrUMT6HcR6vsvrZZy62YOp3oh4cQ2bcroW3RsWwQzAXE2GAu7qy5XDZTx
4tUbHh1Oxhs/M5+tKBmf9bWkJOwcAR9rlaUZE/3vO0pWHaTXvHfDlEPKvIYSVFcX
wB95JiKaBnE2w5ZxqIGHs15HP+s1wtTPS2w+4If//CI06HiVZTORBQpGzH/b9Qct
NfTIBVyP9c7T0/2VgQEA
=VlDb
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
