From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] regulator: pwm: Add support for a fixed delay
 after duty cycle changes
Date: Thu, 1 Sep 2016 20:24:19 +0100
Message-ID: <20160901192419.GL5967@sirena.org.uk>
References: <1472617277-30814-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2284081235463652093=="
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1472617277-30814-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============2284081235463652093==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HBg0C3yr6HVa1ZCc"
Content-Disposition: inline


--HBg0C3yr6HVa1ZCc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 30, 2016 at 09:21:15PM -0700, Douglas Anderson wrote:

> A change of the duty cycle doesn't necessarily cause an immediate switch
> to the target voltage.  On many PWM regulators there is a fixed "settle
> time" (irrespective of the jump size) that we need to wait after an
> upward jump.  This change introduces the device tree property
> "settle-time-up-us" which allows us to specify a fixed delay after a
> voltage increase.

Why is this specific to regulators implemented with PWM controllers?
Most DCDCs have a PWM element and the concept of a hard time limit for
transition rather than a ramp rate doesn't seem like it'd be unique.

--HBg0C3yr6HVa1ZCc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXyIBiAAoJECTWi3JdVIfQOD8H/0qFr0dDOkmyN+xoLzbttad0
A8vebSkbaWa2XxU5XCCFbm0r06OqEOWoEOsGlw8tvDAouFDOJjhQcyp6X46PQ0Bq
dcR7BNXyKUDjeiUcMs+WeKSJ9j5eIUkaeoquV5q1IJag0q3p8Z0ZAp5bJofS41DA
dxLdvOwNuPthl0Feo614a7wSV8wyjyItcEDgit58Q49bTnRxFHWVWobXTQNghlAh
FuvAfFLMJWL9YZF42IwwDqeN+cAhkJNreCLMNP+gHoSk94Mxllsjs3/NKnwUJ8Un
SlZjKP0fBXhDjk7AMBe2A4TtxWEorYAJ2SLTg1YaMnue+PB/RNDoEGiElT4ada0=
=mzHm
-----END PGP SIGNATURE-----

--HBg0C3yr6HVa1ZCc--


--===============2284081235463652093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip

--===============2284081235463652093==--
