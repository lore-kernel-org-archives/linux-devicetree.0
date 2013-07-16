From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/4] iio: lps331ap: Add support for DT
Date: Tue, 16 Jul 2013 15:22:04 +0200
Message-ID: <20130716132204.GG3125@lukather>
References: <1372767338-13179-1-git-send-email-l.czerwinski@samsung.com>
 <1372767338-13179-5-git-send-email-l.czerwinski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AGZzQgpsuUlWC1xT"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1372767338-13179-5-git-send-email-l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, denis.ciocca-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--AGZzQgpsuUlWC1xT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jacek,

I find myself needing these bindings as well, so I'm definitely
interested by your patches.

On Tue, Jul 02, 2013 at 02:15:38PM +0200, Lukasz Czerwinski wrote:
> From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>=20
> This patch adds DT support for the lps331ap barometer
> sensor.
>=20
> Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../bindings/iio/pressure/st_pressure.txt          |   41 ++++++++++++++=
++++++
>  drivers/iio/pressure/st_pressure_i2c.c             |    9 +++++
>  drivers/iio/pressure/st_pressure_spi.c             |    9 +++++
>  3 files changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/pressure/st_pre=
ssure.txt
>=20
> diff --git a/Documentation/devicetree/bindings/iio/pressure/st_pressure.t=
xt b/Documentation/devicetree/bindings/iio/pressure/st_pressure.txt
> new file mode 100644
> index 0000000..73a4b7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/pressure/st_pressure.txt
> @@ -0,0 +1,41 @@
> +* STMicroelectronics LPS331AP barometer sensor
> +
> +Required properties:
> +
> +  - compatible : should be "lps331ap"
> +  - reg : the I2C address of the barometer
> +
> +Optional properties:
> +
> +  - drdy-int-pin : redirect DRDY on pin INT1 (1) or pin INT2 (2) (u8)
> +  - interrupt-parent : phandle to the interrupt map subnode
> +  - interrupts : interrupt mapping for LPS331AP interrupt sources:
> +		2 sources: 0 - INT1, 1 - INT2

Maybe you could use interrupts-names here, instead of requiring to
hardcode the interrupt index. Plus, I guess that it's assuming that you
can only use INT2 when you already use INT1?

> +  - irq-map : irq sub-node defining interrupt map
> +	      (all properties listed below are required):
> +      - #interrupt-cells : should be 1
> +      - #address-cells : should be 0
> +      - #size-cells : should be 0
> +      - interrupt-map : table of entries consisting of three child eleme=
nts:
> +	  - unit_interrupt_specifier - 0 : INT1, 1 : INT2
> +	  - interrupt parent phandle
> +	  - parent unit interrupt specifier consisiting of two elements:
> +	      - index of the interrupt within the controller
> +	      - flags : should be 0

I don't really get why it's needed. Isn't that redundant with the
interrupt parent and the interrupt number already defined by
interrupt-parent and interrupts in the top node?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--AGZzQgpsuUlWC1xT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJR5Uj8AAoJEBx+YmzsjxAg2esQAJQBL0SHQgpTns6pQrkB+kJX
8DrauXcWJGu34VZG8VBYVQDr5OpBDqFvXE05POPJQkvKJMvu5UiiwQV/K+w8g860
LOywz9vF9w80o2zLW4lM5E0Wcjdtg4ZLPZWZyzBF9lJKq4AXT6KJLlw9IOjmw8NK
hz665P+GPI4ILrGqFutFXY2nY/l14FxMu1Q6Z7Nau6N8MkX+ipy08g0bv422oBQ5
uk7IF+SsBeXsxx98YW49y8aOQogr+mr50SZIwFrGNH1vzxc3YlIrTvzszyE8bVuF
P9moGV63IMnkYHiAGg+pVntmpp9dot5melsiaKK660lDiJgP0agLMV+YSc//P7qH
L0zO0ZHUHModMi7t1Q6ncIioIUGCKWP9Oj6OY++uwQyUpkDdyNkLlnU5FXzsFfC/
Y+9NuF7XBVw7pG7yLMW8Y2lCgu6LsoNeQpJzYUQl917yiy9eH6rK/hZ7HaM0VsOO
zv/f0w9IJCNKXNx0pp6Xemp3IasBvCfDmlnexs4pt5QaGvC5jb+ht/E9WFLwfY6d
MbtrMdhGlnm5zNDUdEIj7as03hx6nIFitLH1oYdTlxpt3lKQW+EwMGzvrVl+3wAw
wRVgbtFTUc/LUaTwz0nS/aEk5fWY1c2HMBEI/SPIqNehf602r6NCILaqd7zwtV2k
FDrVlDJzmlNDL4CjpEGq
=jQiF
-----END PGP SIGNATURE-----

--AGZzQgpsuUlWC1xT--
