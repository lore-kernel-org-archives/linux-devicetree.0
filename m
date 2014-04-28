From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/7] mfd: add support for sun6i PRCM
 (Power/Reset/Clock Management) unit
Date: Mon, 28 Apr 2014 16:29:23 -0700
Message-ID: <20140428232923.GR3134@lukather>
References: <1398697130-8338-1-git-send-email-boris.brezillon@free-electrons.com>
 <1398697130-8338-4-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pqmPt9oPL4cuP/b5"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBB6J7ONAKGQEVZ2YULI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398697130-8338-4-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pqmPt9oPL4cuP/b5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On Mon, Apr 28, 2014 at 04:58:46PM +0200, Boris BREZILLON wrote:
> The PRCM (Power/Reset/Clock Management) block exposes several subdevices
> in different subsystems (clk, reset ...)
>=20
> Add basic support for the PRCM unit with clk (AR100, AHB0, and APB0 clks)
> and reset controller subdevices.
>=20
> Other subdevices might be added later (if needed).
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/mfd/Kconfig      |   8 +++
>  drivers/mfd/Makefile     |   1 +
>  drivers/mfd/sun6i-prcm.c | 163 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 172 insertions(+)
>  create mode 100644 drivers/mfd/sun6i-prcm.c
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 2d347c9..0a9220d 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -731,6 +731,14 @@ config MFD_STA2X11
>  	select MFD_CORE
>  	select REGMAP_MMIO
> =20
> +config MFD_SUN6I_PRCM
> +	bool "Allwinner PRCM controller"

I'd mention the A31 in the prompt

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--pqmPt9oPL4cuP/b5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTXuRTAAoJEBx+YmzsjxAgfgwP/A+2L16NBfxlWk28zi8Q1Z5F
Gr9+6clQ3de70zI2P1tOjV49cZ66jBioWbhByiZKF8zRXC2kZRl8Rpp+UUs+yHsR
yhfV3QDldttadgfYOxvIPRbt8iqRyXxXMcT17b98xIwip/3r3NSb1xTXDfKzRCkk
AgCVaTjlczGM9sjSgZMfmtcccfdzWs6ZilHj9gUxinuSgwRgf6oKQrPAyO+aIZBa
LF0bUhx5eLiASPF/E6fMmrpdIIsClm24PaXlQufC+sPqFUPTgQAMF8seAKxH78Bl
dqeLyV1YP4s+hBthn1bVR+Px1V0LE2q4J7duvKmx8fiy2+k0Quw+qLZF7jSUk8Po
d1qrUtmCTL9XZM4D8vngfjvqZ3DfweXuOXQ5QZSl3XUs7oqop0kKQPH6L3TZOPui
QLsws788TeVhzXjl1p8Q7PjHoPpBd3HRvS7dAeikQ+c+c/+x8vhr75qbFEWsvIlS
u3hp9jcWUo6GpBg8p0a5ROKimPvyTqUgzZHfY/FEhixE3oQmsqCvEmzLeIU7oGuq
egEx57u5yrKvxRYlmYuojxzb5siQOr9aUB7mf/fSyDa6p78lx7dF8ZXGoMDOaPFE
YyfAHmw0ognCtl92Dub5VHJk/3K4N5DY/OG6m1EQUjJf1PIiKpXnxCa1r9yqWifS
l/2ptjhnCkZpwAX7Mufh
=A7oN
-----END PGP SIGNATURE-----

--pqmPt9oPL4cuP/b5--
