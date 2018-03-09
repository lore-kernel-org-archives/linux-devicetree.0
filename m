From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH RFC 2/3] nvmem: add driver for Raspberry Pi OTP
Date: Fri, 09 Mar 2018 13:06:55 -0800
Message-ID: <87tvtpgdqo.fsf@anholt.net>
References: <1520602328-28972-1-git-send-email-stefan.wahren@i2se.com>
 <1520602328-28972-3-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4727719823833381946=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1520602328-28972-3-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Phil Elwell <phil@raspberrypi.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============4727719823833381946==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren@i2se.com> writes:

> This patch brings read-only support for the Raspberry Pi Customer OTP.
> The driver accesses the OTP via the mailbox property interface
> provided by the VPU firmware.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  drivers/nvmem/Kconfig           |  10 +++
>  drivers/nvmem/Makefile          |   2 +
>  drivers/nvmem/raspberrypi-otp.c | 138 ++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 150 insertions(+)
>  create mode 100644 drivers/nvmem/raspberrypi-otp.c
>
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index ff505af..76b8af3 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -175,4 +175,14 @@ config NVMEM_SNVS_LPGPR
>  	  This driver can also be built as a module. If so, the module
>  	  will be called nvmem-snvs-lpgpr.
>=20=20
> +config NVMEM_RASPBERRYPI_OTP
> +	tristate "Raspberry Pi Customer OTP support"
> +	depends on (ARCH_BCM2835 && RASPBERRYPI_FIRMWARE) || (COMPILE_TEST && !=
RASPBERRYPI_FIRMWARE)
> +	depends on RASPBERRYPI_FIRMWARE
> +	help
> +	  This is a driver for access to the Customer OTP on the Raspberry Pi.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called nvmem-raspberrypi-otp.
> +
>  endif
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index e54dcfa..3b53b0b 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -37,3 +37,5 @@ obj-$(CONFIG_MESON_MX_EFUSE)	+=3D nvmem_meson_mx_efuse.o
>  nvmem_meson_mx_efuse-y		:=3D meson-mx-efuse.o
>  obj-$(CONFIG_NVMEM_SNVS_LPGPR)	+=3D nvmem_snvs_lpgpr.o
>  nvmem_snvs_lpgpr-y		:=3D snvs_lpgpr.o
> +obj-$(CONFIG_NVMEM_RASPBERRYPI_OTP)	+=3D nvmem-raspberrypi-otp.o
> +nvmem-raspberrypi-otp-y		:=3D raspberrypi-otp.o
> diff --git a/drivers/nvmem/raspberrypi-otp.c b/drivers/nvmem/raspberrypi-=
otp.c
> new file mode 100644
> index 0000000..e925435
> --- /dev/null
> +++ b/drivers/nvmem/raspberrypi-otp.c
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Raspberry Pi Customer OTP driver
> + *
> + * Copyright (C) 2018 Stefan Wahren <stefan.wahren@i2se.com>
> + */
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <soc/bcm2835/raspberrypi-firmware.h>
> +
> +#define CUSTOMER_CELLS 8
> +
> +struct rpi_otp {
> +	struct nvmem_device *nvmem;
> +	struct rpi_firmware *fw;
> +};
> +
> +/*
> + * Packet definition used by RPI_FIRMWARE_GET_CUSTOMER_OTP
> + */
> +struct rpi_customer_otp_packet {
> +	u32 index;
> +	u32 length;
> +	u32 cells[CUSTOMER_CELLS];
> +};
> +
> +static int rpi_otp_read(void *context, unsigned int offset, void *val,
> +			size_t bytes)
> +{
> +	struct rpi_customer_otp_packet packet;
> +	struct rpi_otp *otp =3D context;
> +	u32 *buf =3D val;
> +	int ret;
> +
> +	packet.index =3D 0;
> +	packet.length =3D CUSTOMER_CELLS;
> +	memset(packet.cells, 0xff, sizeof(packet.cells));
> +
> +	ret =3D rpi_firmware_property(otp->fw, RPI_FIRMWARE_GET_CUSTOMER_OTP,
> +				    &packet, sizeof(packet));
> +
> +	if (ret)
> +		return ret;
> +
> +	/* Request rejected by firmware */
> +	if (packet.index)
> +		return -EIO;
> +
> +	while (bytes) {
> +		if ((offset / 4) < sizeof(packet.cells))
> +			*buf =3D packet.cells[offset / 4];
> +		else
> +			*buf =3D 0;
> +
> +		buf++;
> +		bytes -=3D 4;
> +		offset +=3D 4;
> +	}

It looks like nvmem core makes sure that offset + bytes <=3D nvmem->size,
so I think you can turn this loop into just a memcpy.

Other than that,

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlqi928ACgkQtdYpNtH8
nuhYjg//WCuRvGFzC6H/XiOu4jo6F1CCH5GSEGpFp0ya97SDY/LVBuqyaOI/W/JI
4LlRiKX8M3CgcjXAyaUbMK+yFCzmJEgHg9DVPqIlTE9f8ZtGxj9Iqd29Aca5JlOc
K47C3Qlyi7kQoYiiuScsp34wWozd2+1gzpnV885qJ9nb4+IaAqtBayxkJgnkvCtP
wfGjSSI+pxKvG5aQd2dNfxYaVFPIxV6DBSPm1lkhQLe29WVmSl3Lvb+s45zxrPBT
/Kk1Sd9vYlrHiBXOnlzAqtozqw8XZaM8D7yhepjZ7zG+0S8kQ8PZGqYFk02swEB4
gSOpNNO5Q7cpl/8c19Oeam8m0h8SxVU26KuCeJN2tQRom0btQzkyHKpqRNJn1qw8
iy5gsyq4EOokczOBnijN35JMxQ13bKnEankFlRmY2kBwv6CrpnPIn03ZsEdloKSO
jkETW1koPQQY8gMgr8mVtDrf2+KkTN9wOgrNDH0OtTp+uTu83J2ldsBw4Gf7FSRJ
JWWjttVhNf30WPU27R9ofHI3C+K36ShH5HpFIidum15iTQzUOFH+BO2ifKrenC/S
Mo6Is0uZp9KEwfxI2wjdWQ4MvlBAPaIOE/dPuwuM79T8+1hk1Eglim1XZurZoXKU
8U1f67erOzlIFwbnXGP9btyq8H9P9rNP9lDkcSoUGiNsZgwWX6I=
=NEEM
-----END PGP SIGNATURE-----
--=-=-=--


--===============4727719823833381946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4727719823833381946==--
