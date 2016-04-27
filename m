From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] of: Add stub for of_get_next_parent()
Date: Wed, 27 Apr 2016 17:00:40 +0200
Message-ID: <20160427150039.GB4176@ulmo.ba.sec>
References: <1461755500-889-1-git-send-email-heikki.krogerus@linux.intel.com>
 <5345757.9RfGSJE06M@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5345757.9RfGSJE06M@wuerfel>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2016 at 01:13:33PM +0200, Arnd Bergmann wrote:
> On Wednesday 27 April 2016 14:11:40 Heikki Krogerus wrote:
> > Fixes a compiler error:
> >=20
> > drivers/phy/phy-core.c: In function =E2=80=98__of_phy_provider_register=
=E2=80=99:
> > drivers/phy/phy-core.c:848:13: error: implicit declaration of function
> > =E2=80=98of_get_next_parent=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]
> >     parent =3D of_get_next_parent(parent);
> >                  ^
> >=20
> > Fixes: 2f7600bc981c ("phy: core: Allow children node to be overridden")
> > Signed-off-by: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>=20
> Yes, this works. I have submitted an alternative patch to fix the
> build error, changing the PHY core to not use any of the OF interfaces
> if CONFIG_OF is disabled.
>=20
> We can also have both.
>=20
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

I'm thinking of simply open-coding this for now, to avoid the use of
of_get_next_parent(). This is part of a set of patches that has gone
through countless revisions over the past two years and the timing
is such that adding yet another dependency will likely make it miss
the next cycle again. I'd really like to avoid that.

If nobody objects I'll volunteer to refactor this after v4.7-rc1.

Alternatively, perhaps Rob can give a very quick Acked-by on the
of_get_next_parent() addition, then I might still have time to take
this through one or two linux-next releases before sending out the
pull requests around the end of the week.

Thierry

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXINQUAAoJEN0jrNd/PrOhBJQQAJVK7Llj+KTYH1RddC8Mcw47
G8SNI2ZYddTki+cS5bJ03qwwYfQHBr55FKkgID6YE709JWIK1TRW+6uMPZBZYuw+
qYch3adpbQLZYu4I84OIsSJYQRBKXsYFnxmNmTH550xDqSAbJREwiyIa/u54zGbE
1sfd5hNQhlh4LTFotCLOIRtcTgI+b/HLACdSuYIhjWF3h/T2FxTYhQ/BPwPM5Gz7
HgyabvfAVCgisB6maPvY7k6i4kxwdNjZFbotCnleRyu8i3wPrljaR/QwYMqdekcw
IGS3ySCO1BxgT9lmrd3MUfUYE/sgjGZURfr+9EvSVLEPV5ETPCQFYaw+MjWgFAds
QTO09vzPUnd7NEnrl6wL108ORtMqBYVgsk5+z01qVWJMqSNiX10UaYvzfinxcmr3
W8Ur/eY9Z69eqd5jzJAigrox0zKjhilpcsbazZJGHaWeaHg/yK3MUyebo2mEus1f
W7pRwWeAPHAtMNmFpqFSKnd2VKyhD2QJI9EHTzbYO4/Ftu4rJSgRgkGc6NjjqAGx
NrJfJaRpedhv1hvLJhi3NHQR7J4rLx87iD6KRe7aJ+ObOPCdbzr9EQ1RvUHkALuR
mzxM0YD330JCf1uI9LzpIH6Er3PVPhmYg2ZBoDEX2Nl1qpW6t2bG/xQNLT4js5aW
daw/C2JahrGnxSbnGY0p
=IF5M
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
