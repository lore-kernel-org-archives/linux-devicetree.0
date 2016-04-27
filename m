From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Applied "regulator: rk808: remove linear range definitions with
 a single range" to the regulator tree
Date: Wed, 27 Apr 2016 17:41:14 +0100
Message-ID: <20160427164114.GD3217@sirena.org.uk>
References: <E1aukkg-0007km-6s@debutante> <57205DC2.7070506@phytec.de>
 <20160427135048.GQ3217@sirena.org.uk> <13413437.Ipf2eOczfj@diego>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1739659208142611686=="
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <13413437.Ipf2eOczfj@diego>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============1739659208142611686==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A5Bs66j+yxxuoNFj"
Content-Disposition: inline


--A5Bs66j+yxxuoNFj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2016 at 03:56:56PM +0200, Heiko St=FCbner wrote:
> Am Mittwoch, 27. April 2016, 14:50:48 schrieb Mark Brown:

> > Any ETA on a fix or should I revert?

> I guess
> 	[PATCH v4 1/7] regulator: rk808: Add rk808_reg_ops_ranges for LDO3
> from yesterday [0] might be the fix? At least it fits Wadim's description=
 above=20
> but I haven't had time to test it yet.

Oh, probably yeah.  It's easier if fixes are pulled out of serieses.

--A5Bs66j+yxxuoNFj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXIOupAAoJECTWi3JdVIfQ1ggH/jyCbSBG8TE/QrmwRhZYcSQz
K7uuKzfMUzBYn/TEXRrgE6sJdIb661aYpiGP9if/M3q98vytdidRcrZo8xkrXZpW
cXVRPHMSKi2kuit39nF2sSyVwtaWcoyicyLm/WhzaRYG6mRHespMixK4syf4Gu5z
ODwmOn5JzoGzdM+pwwx0yY6b1+xLnLP5tTdPlkSvCH9rHkk82MtAh3pKtg0hCcCh
kJN3a8x13ZU74qUK11opGcvP2TZ+0Gf5uX/UdmK5k7mfFs7UFGewdDx63tSwKu7L
QAHkmXcg5Xpwe38FCoglKe7DjrXjOBJACRi2UIHwvqFJiatnssYLFusXsWOk7MU=
=1PPO
-----END PGP SIGNATURE-----

--A5Bs66j+yxxuoNFj--


--===============1739659208142611686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip

--===============1739659208142611686==--
