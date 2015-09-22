From: Josh Cartwright <joshc@ni.com>
Subject: Re: [PATCH v11 4/4] fpga manager: add driver for socfpga fpga manager
Date: Tue, 22 Sep 2015 17:47:23 -0500
Message-ID: <20150922224723.GB26335@jcartwri.amer.corp.natinst.com>
References: <1442935271-10375-1-git-send-email-atull@opensource.altera.com>
 <1442935271-10375-5-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1887566569101365014=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1442935271-10375-5-git-send-email-atull@opensource.altera.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: atull@opensource.altera.com
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, kyle.teske@ni.com, jgunthorpe@obsidianresearch.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, galak@codeaurora.org, broonie@kernel.org, philip@balister.org, Petr Cvek <petr.cvek@tul.cz>, dinguyen@opensource.altera.com, monstr@monstr.eu, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, pavel@denx.de, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org


--===============1887566569101365014==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline


--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2015 at 10:21:11AM -0500, atull@opensource.altera.com wrote:
> From: Alan Tull <atull@opensource.altera.com>
>=20
> Add driver to fpga manager framework to allow configuration
> of FPGA in Altera SoCFPGA parts.
>=20
> Signed-off-by: Alan Tull <atull@opensource.altera.com>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> Acked-by: Moritz Fischer <moritz.fischer@ettus.com>
[..]
> +++ b/drivers/fpga/Kconfig
> @@ -11,4 +11,14 @@ config FPGA
>  	  kernel.  The FPGA framework adds a FPGA manager class and FPGA
>  	  manager drivers.
> =20
> +if FPGA

FPGA is unconditionally set here, otherwise drivers/fpga/Kconfig
wouldn't even be considered.

> +
> +config FPGA_MGR_SOCFPGA
> +	tristate "Altera SOCFPGA FPGA Manager"
> +	depends on ARCH_SOCFPGA
> +	help
> +	  FPGA manager driver support for Altera SOCFPGA.
> +
> +endif # FPGA
> +
>  endmenu
> diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
> index 3313c52..ba6c5c5 100644
> --- a/drivers/fpga/Makefile
> +++ b/drivers/fpga/Makefile
> @@ -6,3 +6,4 @@
>  obj-$(CONFIG_FPGA)			+=3D fpga-mgr.o
> =20
>  # FPGA Manager Drivers
> +obj-$(CONFIG_FPGA_MGR_SOCFPGA)		+=3D socfpga.o
> diff --git a/drivers/fpga/socfpga.c b/drivers/fpga/socfpga.c
> new file mode 100644
> index 0000000..706b80d
> --- /dev/null
> +++ b/drivers/fpga/socfpga.c
[..]
> +/*
> + * Step 9: write data to the FPGA data register
> + */
> +static int socfpga_fpga_ops_configure_write(struct fpga_manager *mgr,
> +					    const char *buf, size_t count)
> +{
> +	struct socfpga_fpga_priv *priv =3D mgr->priv;
> +	u32 *buffer_32 =3D (u32 *)buf;

Seems sketchy from an endianess perspective, but it may be okay if
SOCFPGA doesn't support BE (which my follow up question would be: why
not?).  Same thing applies with seemingly cavalier usages of the
__raw_readl/writel variants.

  Josh

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWAdp4AAoJEKp7ZBKwQFArdnUH/1O/KH6vXBPpAkqQv6egoz5o
A7rkrmsHk+b0OuWWzRZn15ydXT76VejVZYou5fmW+Oec/ueiUSYWsQKMeKihLgE4
NcLDZXkMUo60NEhWULINmSI9BOe9xxJSxkYjDt5VPOnJWuTqXdRFLhqBqKlOR+Hl
ScvzOz9iqgNLg+/angU3lWhOht+s2A3B9+wBDXBsB7HIs4cep3/pQ5zTuHbsu1KD
tw7XG0WqLUjxuA8EeMHz8aGP/gmsG68E6vi+8HINrtE5luMsF0pa3Op6l2YYqApd
P67ORUaLfYlHmTghijrfaOujJ2PZz8EmRmgd9JWb2McfUQnz6Xw9sbjzuQ2wsI4=
=GKZC
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--

--===============1887566569101365014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============1887566569101365014==--
