From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 3/7] drm/tinydrm: Add MIPI DBI support
Date: Mon, 6 Feb 2017 09:48:48 +0100
Message-ID: <20170206084848.GC27607@ulmo.ba.sec>
References: <20170131160319.9695-1-noralf@tronnes.org>
 <20170131160319.9695-4-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0951705978=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170131160319.9695-4-noralf@tronnes.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: thomas.petazzoni@free-electrons.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============0951705978==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Content-Disposition: inline


--8NvZYKFJsRX2Djef
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 05:03:15PM +0100, Noralf Tr=C3=B8nnes wrote:
> Add support for MIPI DBI compatible controllers.
> Interface type C option 1 and 3 are supported (SPI).
>=20
> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> ---
>  Documentation/gpu/tinydrm.rst      |   12 +
>  drivers/gpu/drm/tinydrm/Kconfig    |    3 +
>  drivers/gpu/drm/tinydrm/Makefile   |    3 +
>  drivers/gpu/drm/tinydrm/mipi-dbi.c | 1005 ++++++++++++++++++++++++++++++=
++++++
>  include/drm/tinydrm/mipi-dbi.h     |  107 ++++
>  5 files changed, 1130 insertions(+)
>  create mode 100644 drivers/gpu/drm/tinydrm/mipi-dbi.c
>  create mode 100644 include/drm/tinydrm/mipi-dbi.h

Any reason why this is in the tinydrm subdirectory? Looks like this
could be useful to drivers outside of it.

> diff --git a/drivers/gpu/drm/tinydrm/mipi-dbi.c b/drivers/gpu/drm/tinydrm=
/mipi-dbi.c
> new file mode 100644
> index 0000000..5ded299
> --- /dev/null
> +++ b/drivers/gpu/drm/tinydrm/mipi-dbi.c
> @@ -0,0 +1,1005 @@
> +/*
> + * MIPI Display Bus Interface (DBI) LCD controller support
> + *
> + * Copyright 2016 Noralf Tr=C3=B8nnes
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <drm/tinydrm/mipi-dbi.h>
> +#include <drm/tinydrm/tinydrm-helpers.h>
> +#include <linux/debugfs.h>
> +#include <linux/dma-buf.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> +#include <video/mipi_display.h>
> +
> +#define MIPI_DBI_MAX_SPI_READ_SPEED 2000000 /* 2MHz */
> +
> +#define DCS_POWER_MODE_DISPLAY			BIT(2)
> +#define DCS_POWER_MODE_DISPLAY_NORMAL_MODE	BIT(3)
> +#define DCS_POWER_MODE_SLEEP_MODE		BIT(4)
> +#define DCS_POWER_MODE_PARTIAL_MODE		BIT(5)
> +#define DCS_POWER_MODE_IDLE_MODE		BIT(6)
> +#define DCS_POWER_MODE_RESERVED_MASK		(BIT(0) | BIT(1) | BIT(7))

Should these perhaps be defined in include/video/mipi_display.h since
that already defines the MIPI_DCS_GET_POWER_MODE that this is used with?

> +/**
> + * mipi_dbi_command - MIPI DCS command with optional parameter(s)
> + * @mipi: MIPI structure
> + * @cmd: Command
> + * @seq...: Optional parameter(s)
> + *
> + * Send MIPI DCS command to the controller. Use mipi_dbi_command_read() =
for
> + * get/read.
> + *
> + * Returns:
> + * Zero on success, negative error code on failure.
> + */
> +#define mipi_dbi_command(mipi, cmd, seq...) \
> +({ \
> +	u8 d[] =3D { seq }; \
> +	mipi_dbi_command_buf(mipi, cmd, d, ARRAY_SIZE(d)); \
> +})

I feel obligated to object to this because I objected to the same macro
when Andrzej wanted to add the same macro for MIPI DSI. But since I'm
apparently the only one that doesn't like this, maybe it's time for me
to embrace this.

Thierry

--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliYOG4ACgkQ3SOs138+
s6GB2BAAl5LJFTUEZ/WDFOPG8rBlEGNIN2VmxbkkPmjvgWovlMtvYL8p76+F4sHZ
OgaLos/3XfRiCyIp8Inya+/OuHtteKIBhmw0CcWRhrknTDwP25Xb+bvXryHTH0pu
6RVlNY2kTkUTcDwmodk30vZ7ejqKQTOv3mNvOwCxkNp15Uyp/ckaJMXGetrKdeYB
EsaYI0xs42jfQ+5K/7CjivW+zYjdJC29eLAAHIVCeNe+o67Xj/TK6OrQOaujy7o9
W/O7XZdwdJx2GWTnjRax3pf4CQYgYMqAKyoo8OeL5e5pck9fbCTy5TNmVrMQy5lz
LmN1D2m8GIYUij7NHNhvl0mVFkbhGZl2gbiCT70QxeB0uPKS0B3A0rmY7q/wB6rx
2mtfjdOC3IuwyfQAG5a44bbriGtJEvQH3vwKsOx6LKvYJwqgsHbbgnsyo6gYfmEI
xaNlBPNaGbH3KozyxpkXdGELB+zchB0aIRoXXSpZ61/1hcaJQ4gZewfi4Z7mAZY6
4gUI2YsMfQqL0E+wqs1G3Zqcom0Q19W1FXB/VX0qL5r79GLWYfYMFLMr/ducuzcA
n3blXHHNtCGgmeCPaGaLubjo63AMMCOPK0YaN1lSMEqAMpt5gxD567HZ7q0QHv/b
e9S2bkVdIcV96bc7qOmLV7s9l3QQyctzwsFhp8wfg3f7Z55V/qc=
=d0Xb
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--

--===============0951705978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0951705978==--
