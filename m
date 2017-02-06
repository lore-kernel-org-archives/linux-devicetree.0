From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 3/7] drm/tinydrm: Add MIPI DBI support
Date: Mon, 6 Feb 2017 12:53:47 +0100
Message-ID: <20170206115347.GJ27607@ulmo.ba.sec>
References: <20170131160319.9695-1-noralf@tronnes.org>
 <20170131160319.9695-4-noralf@tronnes.org>
 <20170206084848.GC27607@ulmo.ba.sec> <87efzbblq6.fsf@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0125309322=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <87efzbblq6.fsf@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: thomas.petazzoni@free-electrons.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============0125309322==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VIOdPewhitSMo36n"
Content-Disposition: inline


--VIOdPewhitSMo36n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2017 at 01:30:09PM +0200, Jani Nikula wrote:
> On Mon, 06 Feb 2017, Thierry Reding <thierry.reding@gmail.com> wrote:
> > On Tue, Jan 31, 2017 at 05:03:15PM +0100, Noralf Tr=C3=B8nnes wrote:
> >> Add support for MIPI DBI compatible controllers.
> >> Interface type C option 1 and 3 are supported (SPI).
> >>=20
> >> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> >> ---
> >>  Documentation/gpu/tinydrm.rst      |   12 +
> >>  drivers/gpu/drm/tinydrm/Kconfig    |    3 +
> >>  drivers/gpu/drm/tinydrm/Makefile   |    3 +
> >>  drivers/gpu/drm/tinydrm/mipi-dbi.c | 1005 +++++++++++++++++++++++++++=
+++++++++
> >>  include/drm/tinydrm/mipi-dbi.h     |  107 ++++
> >>  5 files changed, 1130 insertions(+)
> >>  create mode 100644 drivers/gpu/drm/tinydrm/mipi-dbi.c
> >>  create mode 100644 include/drm/tinydrm/mipi-dbi.h
> >
> > Any reason why this is in the tinydrm subdirectory? Looks like this
> > could be useful to drivers outside of it.
> >
> >> diff --git a/drivers/gpu/drm/tinydrm/mipi-dbi.c b/drivers/gpu/drm/tiny=
drm/mipi-dbi.c
> >> new file mode 100644
> >> index 0000000..5ded299
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/tinydrm/mipi-dbi.c
> >> @@ -0,0 +1,1005 @@
> >> +/*
> >> + * MIPI Display Bus Interface (DBI) LCD controller support
> >> + *
> >> + * Copyright 2016 Noralf Tr=C3=B8nnes
> >> + *
> >> + * This program is free software; you can redistribute it and/or modi=
fy
> >> + * it under the terms of the GNU General Public License as published =
by
> >> + * the Free Software Foundation; either version 2 of the License, or
> >> + * (at your option) any later version.
> >> + */
> >> +
> >> +#include <drm/tinydrm/mipi-dbi.h>
> >> +#include <drm/tinydrm/tinydrm-helpers.h>
> >> +#include <linux/debugfs.h>
> >> +#include <linux/dma-buf.h>
> >> +#include <linux/gpio/consumer.h>
> >> +#include <linux/module.h>
> >> +#include <linux/regulator/consumer.h>
> >> +#include <linux/spi/spi.h>
> >> +#include <video/mipi_display.h>
> >> +
> >> +#define MIPI_DBI_MAX_SPI_READ_SPEED 2000000 /* 2MHz */
> >> +
> >> +#define DCS_POWER_MODE_DISPLAY			BIT(2)
> >> +#define DCS_POWER_MODE_DISPLAY_NORMAL_MODE	BIT(3)
> >> +#define DCS_POWER_MODE_SLEEP_MODE		BIT(4)
> >> +#define DCS_POWER_MODE_PARTIAL_MODE		BIT(5)
> >> +#define DCS_POWER_MODE_IDLE_MODE		BIT(6)
> >> +#define DCS_POWER_MODE_RESERVED_MASK		(BIT(0) | BIT(1) | BIT(7))
> >
> > Should these perhaps be defined in include/video/mipi_display.h since
> > that already defines the MIPI_DCS_GET_POWER_MODE that this is used with?
>=20
> Agreed.
>=20
> >
> >> +/**
> >> + * mipi_dbi_command - MIPI DCS command with optional parameter(s)
> >> + * @mipi: MIPI structure
> >> + * @cmd: Command
> >> + * @seq...: Optional parameter(s)
> >> + *
> >> + * Send MIPI DCS command to the controller. Use mipi_dbi_command_read=
() for
> >> + * get/read.
> >> + *
> >> + * Returns:
> >> + * Zero on success, negative error code on failure.
> >> + */
> >> +#define mipi_dbi_command(mipi, cmd, seq...) \
> >> +({ \
> >> +	u8 d[] =3D { seq }; \
> >> +	mipi_dbi_command_buf(mipi, cmd, d, ARRAY_SIZE(d)); \
> >> +})
> >
> > I feel obligated to object to this because I objected to the same macro
> > when Andrzej wanted to add the same macro for MIPI DSI. But since I'm
> > apparently the only one that doesn't like this, maybe it's time for me
> > to embrace this.
>=20
> I think that's less interesting for MIPI DSI now that we have specific
> functions for most standard DCS commands anyway. That also avoids the
> need to have a list of read functions like here.
>=20
> I guess the question is if it feels like too much duplication to have
> the DCS commands as functions also for DBI. And whether it's worth
> trying to deduplicate DSI and DBI in this case, or if it gets just too
> confusing/complicated.

The problem with this is that we can't possible have all accesses
covered by specific functions. Most of the calls using this function or
macro are for panel-specific commands that often take an arbitrary
number of arguments.

I personally think that Maxime's implementation for ST7789V is somewhat
nicer, though it would require some more work for DSI and DBI to have it
all stashed into a single buffer for the transfer.

Anyway, my main concern with these is that we need to allow for proper
error handling, and the above correctly propagates error codes, so the
matter that it's a macro with a variable argument list and might store
potentially huge arrays on the stack could be addressed when they
become really problematic, rather than just annoying me because they
aren't pretty.

Thierry

--VIOdPewhitSMo36n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliYY8kACgkQ3SOs138+
s6HkEBAAm90S1WDC6JRrOjY+ppDt8sLyYSg1hGyxqKHkExvBn6YdFHUrO+OlgYOf
0o9HPiKnppnu1069TeMyH6xr/txUSSKEjuuBouI4ASShjKiv+BRPY1IT21XbPTPz
uAZNhR4GZUmzXvFRt+t6abU9sfV6yZ2O5pktLeB5ky+TP94lVxdAvORLgOqMHyw/
sWKynfqiqzxFFk9ddqG2JqNEyqEJwxN/nZpuV+j72j7+8e9BnKEeRKc4JOkf1/Y8
Cf9cWW+cnc3wWBn+8dsmUHSr10pWHsApBr9pH0Y7ZTqOWweh/qQlw7D8KQc0s1Wb
PwG2zA54VL1j7m3pJAmwtVQIGAtIytHxC77E+/X1ydHwlQb/xmuOI1YL8AG0Yk5Z
qKdPNUdnX4ysPhFXbWkt5RSro9wLsX62FwzkwpFRPBDuTkLDNFEFnI0FKQCG5doV
pgWfCqDtwrG4IKyE6Fa5/07/bqCAiZvOpKzNKJLxm+RBkWiiYPwIUr5o4iDX1oJj
lfld5zlv7hjpy5hxa1EAIMP1g3VaR97vaZbKGzEN4xWwuv2XTOYbtv6CQ7G0FcUg
ouExKtiKEQDNIU0urALlbVnvFGNQjq/vAV8wx4H+nm0AFGj0dFRW9nvo3lJqqy8p
WVPSXZX8VyvFjT9m5RrbhNEuLhDHVR/Qg8MHHhqCoKOnfg+cnu0=
=+YrG
-----END PGP SIGNATURE-----

--VIOdPewhitSMo36n--

--===============0125309322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0125309322==--
