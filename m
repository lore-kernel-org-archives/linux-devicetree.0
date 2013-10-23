From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [RFC] of: Allow for experimental device
 tree bindings
Date: Wed, 23 Oct 2013 20:40:00 +0100
Message-ID: <20131023193959.GA6777@katana>
References: <1382540779-6334-1-git-send-email-treding@nvidia.com>
 <5267FA58.9050002@wwwdotorg.org>
 <20131023172001.GA3379@katana>
 <20131023185909.GC7863@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131023185909.GC7863-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I'd even go further and use "unstable-" as the prefix instead of "!"
> > which is way more explicit.
>=20
> I guess unstable- is as good as anything. I personally think that "!" is
> disturbing enough to the eye to make it abundantly clear that something
> is fishy.

"!" marks the binding as "special" whatever that is. A busy person might
decide to not look that up as long as it works right now. "unstable-"
(or maybe "unstable!-" ;)) is explicit so people know what they get.


--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJSaCYPAAoJEBQN5MwUoCm2SvoQAJf26pqdc4QrOjAAjxZqMrWU
GKOn+xrEppoIQeRHHye9NEm2rKfEusVHUDNd58N+lq7TKc3m7oyKGNSTwqVKysLg
BTiOgNC4NUuxK7yhbBQt3bhpTUErMQeTvDNr9WDgrj35UmCZxFxzplV0fbe6KIr3
P9rnPSXvBorXl00ysVOfwPRE6ANQ2XhYpay32RxrT+CychdkKHgxhJ9KNk5/8AcK
BXjFVpw2uxmQ4FMiHYMEnGKGpHG6HoN9S2VpP/KBe3wHdgbbcqzdt3f6VwIORtM8
Uj7jnp8ar2CEvEFlq6+Nclwe/QNO9XdkSBfeEbGxoRJNEbKFGNtDQHchaywzakKJ
AO0qpJxBzrXUjlqDnDHuU0Ln2Rxvg3wbz6Z1j4/ZA2P+hiGf52z5dp5VbYzydcvh
a5P4wRc3ggFfPh2qVHRqUhauCf1rTpY2TczNZlfvAIPf3ZiHFfEjsL/MW7aeQgp1
Ivgzy2iSdMaxjnh6pqcSpGZf78dDrCucA+2YgVEFZ4aLGLYFoIRkx/4vlPOMJhvP
FHqhThfkexiZdKp8/0N4nUKWeNyFgIDYLvzmg5Mr8Hk+OCsu2Uv3lkVeqx51fjdx
KSrOhEPSaABzVQptnL+Jdoa4miTb4BTrb412RNWaUfjYNqCU7RUJsoX0KsmjNC2I
UFse+c/zCLQbiIYbNwN/
=G9TJ
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
