From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Applied "regulator: rk808: remove linear range definitions with
 a single range" to the regulator tree
Date: Wed, 27 Apr 2016 14:50:48 +0100
Message-ID: <20160427135048.GQ3217@sirena.org.uk>
References: <E1aukkg-0007km-6s@debutante> <2754883.PYP7KbpM33@diego>
 <57205DC2.7070506@phytec.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7572936211496085418=="
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <57205DC2.7070506-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============7572936211496085418==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lC5mtDCkBY9vM1au"
Content-Disposition: inline


--lC5mtDCkBY9vM1au
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2016 at 08:35:46AM +0200, Wadim Egorov wrote:
> On 26.04.2016 21:33, Heiko St=FCbner wrote:

> > with this patch applied, 4.6.0-rc5-next-20160426 fails to boot on=20
> > rk3288-veyron devices with the bug below. Reverting this one patch
> > results in the system booting again:

> This is because I missed to add the correct ops for LDO_REG3 in this patc=
h.

Any ETA on a fix or should I revert?

--lC5mtDCkBY9vM1au
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXIMO3AAoJECTWi3JdVIfQP58H/RIYe7XJNA5kA1cOquaaWbau
mPhq2KRpFNvY3jYlkmYkJ4kIDJogO1Ma0XjzCYqijsWQSDTRCoJGKX7cWpoWgNai
FJ8xeSP2aY6ma9Slc61DTFhg0XcPaj7DdORfwb9eMCnSa2anMcba7L14kpfV7JSN
tdxN/xe6xACfrs0P60m0CaIrPXxyfHY3Yr8tu1qOxE/IeOmVVDockzXT9pbiWui4
mftziiHYq0Gm1W6V4JcPw24h89rMyTyY2R5qPiqz0ASODqg76W/Ap/wlJ7lSzGKS
I5/hkegCu81rl4MWRNJ+HVe+9XPILq+289VcEgLULRPE76q18aXuofsDHShXHvE=
=eQgw
-----END PGP SIGNATURE-----

--lC5mtDCkBY9vM1au--


--===============7572936211496085418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip

--===============7572936211496085418==--
