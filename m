From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] regulator: st-flashss: Add a regulator driver for
 flashss vsense.
Date: Wed, 13 Apr 2016 18:23:18 +0100
Message-ID: <20160413172318.GC29471@sirena.org.uk>
References: <1460474204-5351-1-git-send-email-peter.griffin@linaro.org>
 <1460474204-5351-3-git-send-email-peter.griffin@linaro.org>
 <20160413061514.GI14664@sirena.org.uk>
 <570DFC44.8060408@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <570DFC44.8060408-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Giuseppe CAVALLARO <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Youssef TRIKI <youssef.triki-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 13, 2016 at 09:59:00AM +0200, Giuseppe CAVALLARO wrote:
> On 4/13/2016 8:15 AM, Mark Brown wrote:
> >>>+static void st_get_satinize_powerup_voltage(struct st_vsense *vsense)
> >>>+{

> >or am I missing something?  Why do we need to do this anyway, it's very
> >surprsing?

> This functions is to sanitize the vsense voltages when the regulator
> is probed and in some circumstances the reset value of this register
> does not reflect the hw status/config. For example, by default, after
> the reset, the bit 0 is set so the EMMC, inside the flash subsystem,
> is supposed to operate at 3v3. But the latched bit 24 can be 0 on
> a platform where it is actually set at 1v8.
> So the bit 0 must be reset to keep this coherent and to allow MMC
> framework to properly setup the Vdd when the framework starts.

I'm afraid I can't follow that explanation, perhaps because I don't know
anything about the content of this register except for these three bits.
I think we do need a comment in the driver explaining what's going on,
and probably a simplification of the code too if my understanding of the
effect of all those operations is correct.

--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXDoCEAAoJECTWi3JdVIfQEz8H/RPhtGRQrOquL5xePbKThd7c
QvZyD98ASeRzcyX7DqlGVtyVwVErGLJZF9XRanv9z7CuxUqxoNcLbNLypEh+v1ly
nwhAOITteBH7i2JjbxypVqLGpZMbKViAKKBR0/yXYdbMmqR2U6JunkCom4ooaiuh
5gij/xURWJkBpIwjMacJwJoDDhlZQU8wSa1HUa43Sj10V9+KA5N9njhTwE0yWZGo
QdAzzDrdRpWVXzQE86VZuSAD0j3nQ8W1qjb5z5poU/qSW5EtJ1u4b/jbjztLepmj
3B+WqRvkkx4w+hI8ym3uuMNoyvhP+bMZxpKuwItMua9z7dHFTcr+IpyxSHd9+EM=
=/N0I
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
