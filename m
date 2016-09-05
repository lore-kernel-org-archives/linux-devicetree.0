From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i: Add dts file for the Orange Pi
 Plus2E SBC
Date: Mon, 5 Sep 2016 13:36:08 +0200
Message-ID: <20160905113608.GE6322@lukather>
References: <20160903110518.8267-1-hdegoede@redhat.com>
 <20160903110518.8267-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BZaMRJmqxGScZ8Mx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160903110518.8267-2-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--BZaMRJmqxGScZ8Mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 03, 2016 at 01:05:18PM +0200, Hans de Goede wrote:
> The Orange Pi Plus2E is an extended version of the Orange Pi Pc Plus,
> with 2G RAM and an external gbit ethernet phy.
>=20
> Note currently the dts is pretty much empty (except for including the
> pc-plus dts), I've a local patch which enables the emac actually making
> this dts different from the pc-plus one, but that needs the h3 emac
> driver to get merged first.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--BZaMRJmqxGScZ8Mx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXzVioAAoJEBx+YmzsjxAge+IQAJH6zYoN6t/nD3BZS+IbLJpZ
wnf0OX40Jj6xW2TvV6HWtSLXiiZrmFgNQQBwaaVA2/e024WGmRsVaMUXybudf+Sh
R+DO1+DaobVALxuK8+/PexVnPsJo2Y2hNy4nHz2BL2IBFUGN5TBV0XKWNkVQxnqU
oePv3RKGuJRa9xx6ElvwDOAg1eNDqCP/BhBhmHR4dXjhhsNjptBDG8s5XFt6BkaU
muJLidbuD6sLJsFbQ7DaDu1s0I6hVcSyWgpUNhC3egxIb6OxDUiJ2ae/BsaxKn0t
+7EMBqygwo1arWVzHObs7ebvAnKyL/Zpjd/WEVcC8GPe9rXFrhKXGF7RkhzmnmQy
8vBaeD/qXLv+ACqLHWzZ0qYAkr774JgAIbuB/qEM+nQ8TyPC+joLbEUdugc1kpYD
ed+YvmyjAwhNq8Q5ZAz9kRMDsWoJnKscY6AjAVllHCCMY3qnp2VWF9uHCn4+GGKI
FQL7Txg+vTCIRLtVdxz3jRO97l9r9gLRCkL2aOnigNViguMtW1mVYuAXhVjCuGbv
GtXiuz4am9MylXsfeTdmaPrsRZn8MEsDj/3KqhehDZ+wn6cP8Dtpz3pJfgAj9IOF
EgTx/QktWTTbKCIsyoaiyBOB30nhBYSgMJAzIWsH/St6xPcg6Rlizr8PPPEf4EVk
A9qbcjOGMxtI3X5lEOqM
=JtIC
-----END PGP SIGNATURE-----

--BZaMRJmqxGScZ8Mx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
