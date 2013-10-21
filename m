From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Mon, 21 Oct 2013 11:15:56 +0200
Message-ID: <20131021091555.GB21518@ulmo.nvidia.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131020220839.GT2443@sirena.org.uk>
 <5264576F.6050307@wwwdotorg.org>
 <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.03.1310201911190.1951-hIgblCxmbi8OMTOF05IoTw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 20, 2013 at 09:00:08PM -0400, Nicolas Pitre wrote:
[...]
> The hardware support in the kernel, on the other hand, can be improved=20
> incrementally with time.  It doesn't matter if it is not optimal at=20
> first. It can be revisited, optimized, reviewed, and sometimes even=20
> redesigned.  And only when it reaches maturity would be the time to use=
=20
> the experience from the kernel development and make some firmware out of=
=20
> it.  But what would be the point then?

I agree. However that's currently no longer the case. We're severely
limiting ourselves because we're requiring DT to be a stable ABI.

A stable ABI means there's about zero chance of redesigning something
after it's been merged. Unless we want to live with having to support
several DT bindings in a driver.

The kind of flexibility and unstable API within the kernel is something
that I've always been very fond of, precisely because it allows us to
get features implemented fairly quickly. At the same time we have the
possibility to redesign code when we have to. It's just impossible to
take into account every possible detail up front simply because we're
all only human and because some things just might change over time. I'm
fairly sure that Linux wouldn't be where it is today if we didn't have
that flexibility.

Right now, we're taking away much of that flexibility and I see progress
on ARM actively hindered.

Thierry

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZPDLAAoJEN0jrNd/PrOhPtAP/2mLmVU7rmhWmqfzKEwCLBCH
ymWtnETCwBtabYeA67tDfTSakdBZkDN7HtMIvTNHpyeVOyYTz4c54HnjXH2cPV8X
REq5z1stcFz6L4yeGMypf/pKj/wn+Y4GNXwYa3tnh/T5kV20fqmH737nqFeNupn4
SEJWeeI5OR+DetRd4xwx1IXZIJYAMgHHXgCzzQPmNtQ6FXmQvr7K1UFPWEjJq5YO
Qyhpm4hs2kQhAOQAyFfon8CbmeRxIpiR6iBt4sG3JXuMM9XpP0Cyua5xDjeB3i3r
xlXYp6fIsRWcbmBuaKNekZZv6rWSxh8UvJ2hluvxyzSF3rkYwvk8l6Nzt/z00HGU
FJNiK24LPLgFmpZ+kHR5By85Yka5NcSacY+U42rBuftD8yRhmAz9qfRPrqT4uCfH
akQK6MbVnyZVMbx/UTSz+Uj4FAGB83CUU6m8zp9ZdOgNWxtMf6jjh7jMbNhFzk9S
a9pYEuuofMuok7FqGeq7L2+zaftdw1nQXTfEaLKrwqmzcL+C4J1iNzmUnBPbsPoh
jZgGB/YXE74nRDDiOtJ8Fd1N47zRBycjhIYUC6TlfhdI1LBP2rGxAziVY2kKSRHM
cAXVAolutCEHFwq/OVO4aYcPxf5K3g4Jct1XkKD8HGOElr/RAFN85yDCR4rkjl/D
dpuYxu/88q5i9Mrl2CXg
=4eOZ
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
