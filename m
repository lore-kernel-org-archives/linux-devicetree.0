From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 2/7] drm/tinydrm: Add helper functions
Date: Mon, 6 Feb 2017 09:56:29 +0100
Message-ID: <20170206085629.GD27607@ulmo.ba.sec>
References: <20170131160319.9695-1-noralf@tronnes.org>
 <20170131160319.9695-3-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1276641548=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170131160319.9695-3-noralf@tronnes.org>
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


--===============1276641548==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cQXOx3fnlpmgJsTP"
Content-Disposition: inline


--cQXOx3fnlpmgJsTP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 05:03:14PM +0100, Noralf Tr=C3=B8nnes wrote:
> Add common functionality needed by many tinydrm drivers.
>=20
> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  Documentation/gpu/tinydrm.rst                  |   9 +
>  drivers/gpu/drm/tinydrm/core/Makefile          |   2 +-
>  drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c | 462 +++++++++++++++++++=
++++++
>  include/drm/tinydrm/tinydrm-helpers.h          | 100 ++++++
>  4 files changed, 572 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c
>  create mode 100644 include/drm/tinydrm/tinydrm-helpers.h
>=20
> diff --git a/Documentation/gpu/tinydrm.rst b/Documentation/gpu/tinydrm.rst
> index ec4a20d..fb256d2 100644
> --- a/Documentation/gpu/tinydrm.rst
> +++ b/Documentation/gpu/tinydrm.rst
> @@ -19,3 +19,12 @@ Core functionality
> =20
>  .. kernel-doc:: drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c
>     :export:
> +
> +Additional helpers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. kernel-doc:: include/drm/tinydrm/tinydrm-helpers.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c
> +   :export:
> diff --git a/drivers/gpu/drm/tinydrm/core/Makefile b/drivers/gpu/drm/tiny=
drm/core/Makefile
> index 4f14a0f..fb221e6 100644
> --- a/drivers/gpu/drm/tinydrm/core/Makefile
> +++ b/drivers/gpu/drm/tinydrm/core/Makefile
> @@ -1,3 +1,3 @@
> -tinydrm-y :=3D tinydrm-core.o tinydrm-pipe.o
> +tinydrm-y :=3D tinydrm-core.o tinydrm-pipe.o tinydrm-helpers.o
> =20
>  obj-$(CONFIG_DRM_TINYDRM) +=3D tinydrm.o
> diff --git a/drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c b/drivers/gpu=
/drm/tinydrm/core/tinydrm-helpers.c
> new file mode 100644
> index 0000000..75e4e54
> --- /dev/null
> +++ b/drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c
> @@ -0,0 +1,462 @@
> +/*
> + * Copyright (C) 2016 Noralf Tr=C3=B8nnes
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <drm/tinydrm/tinydrm.h>
> +#include <drm/tinydrm/tinydrm-helpers.h>
> +#include <linux/backlight.h>
> +#include <linux/pm.h>
> +#include <linux/spi/spi.h>
> +#include <linux/swab.h>
> +
> +static unsigned int spi_max;
> +module_param(spi_max, uint, 0400);
> +MODULE_PARM_DESC(spi_max, "Set a lower SPI max transfer size");
> +
> +/**
> + * tinydrm_merge_clips - Merge clip rectangles
> + * @dst: Destination clip rectangle
> + * @src: Source clip rectangle(s)
> + * @num_clips: Number of @src clip rectangles
> + * @flags: Dirty fb ioctl flags
> + * @max_width: Maximum width of @dst
> + * @max_height: Maximum height of @dst
> + *
> + * This function merges @src clip rectangle(s) into @dst. If @src is NUL=
L,
> + * @max_width and @min_width is used to set a full @dst clip rectangle.
> + *
> + * Returns:
> + * true if it's a full clip, false otherwise
> + */
> +bool tinydrm_merge_clips(struct drm_clip_rect *dst,
> +			 struct drm_clip_rect *src, unsigned int num_clips,
> +			 unsigned int flags, u32 max_width, u32 max_height)
> +{
> +	unsigned int i;
> +
> +	if (!src || !num_clips) {
> +		dst->x1 =3D 0;
> +		dst->x2 =3D max_width;
> +		dst->y1 =3D 0;
> +		dst->y2 =3D max_height;
> +		return true;
> +	}
> +
> +	dst->x1 =3D ~0;
> +	dst->y1 =3D ~0;
> +	dst->x2 =3D 0;
> +	dst->y2 =3D 0;
> +
> +	for (i =3D 0; i < num_clips; i++) {
> +		if (flags & DRM_MODE_FB_DIRTY_ANNOTATE_COPY)
> +			i++;
> +		dst->x1 =3D min(dst->x1, src[i].x1);
> +		dst->x2 =3D max(dst->x2, src[i].x2);
> +		dst->y1 =3D min(dst->y1, src[i].y1);
> +		dst->y2 =3D max(dst->y2, src[i].y2);
> +	}
> +
> +	if (dst->x2 > max_width || dst->y2 > max_height ||
> +	    dst->x1 >=3D dst->x2 || dst->y1 >=3D dst->y2) {
> +		DRM_DEBUG_KMS("Illegal clip: x1=3D%u, x2=3D%u, y1=3D%u, y2=3D%u\n",
> +			      dst->x1, dst->x2, dst->y1, dst->y2);
> +		dst->x1 =3D 0;
> +		dst->y1 =3D 0;
> +		dst->x2 =3D max_width;
> +		dst->y2 =3D max_height;
> +	}
> +
> +	return (dst->x2 - dst->x1) =3D=3D max_width &&
> +	       (dst->y2 - dst->y1) =3D=3D max_height;
> +}
> +EXPORT_SYMBOL(tinydrm_merge_clips);

Should this perhaps be part of drm_rect.c?

> +#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
> +/**
> + * tinydrm_of_find_backlight - Find backlight device in device-tree
> + * @dev: Device
> + *
> + * This function looks for a DT node pointed to by a property named 'bac=
klight'
> + * and uses of_find_backlight_by_node() to get the backlight device.
> + * Additionally if the brightness property is zero, it is set to
> + * max_brightness.
> + *
> + * Returns:
> + * NULL if there's no backlight property.
> + * Error pointer -EPROBE_DEFER if the DT node is found, but no backlight=
 device
> + * is found.
> + * If the backlight device is found, a pointer to the structure is retur=
ned.
> + */
> +struct backlight_device *tinydrm_of_find_backlight(struct device *dev)
> +{
> +	struct backlight_device *backlight;
> +	struct device_node *np;
> +
> +	np =3D of_parse_phandle(dev->of_node, "backlight", 0);
> +	if (!np)
> +		return NULL;
> +
> +	backlight =3D of_find_backlight_by_node(np);
> +	of_node_put(np);
> +
> +	if (!backlight)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	if (!backlight->props.brightness) {
> +		backlight->props.brightness =3D backlight->props.max_brightness;
> +		DRM_DEBUG_KMS("Backlight brightness set to %d\n",
> +			      backlight->props.brightness);
> +	}
> +
> +	return backlight;
> +}
> +EXPORT_SYMBOL(tinydrm_of_find_backlight);
> +
> +/**
> + * tinydrm_enable_backlight - Enable backlight helper
> + * @backlight: Backlight device
> + *
> + * Returns:
> + * Zero on success, negative error code on failure.
> + */
> +int tinydrm_enable_backlight(struct backlight_device *backlight)
> +{
> +	unsigned int old_state;
> +	int ret;
> +
> +	if (!backlight)
> +		return 0;
> +
> +	old_state =3D backlight->props.state;
> +	backlight->props.state &=3D ~BL_CORE_FBBLANK;
> +	DRM_DEBUG_KMS("Backlight state: 0x%x -> 0x%x\n", old_state,
> +		      backlight->props.state);
> +
> +	ret =3D backlight_update_status(backlight);
> +	if (ret)
> +		DRM_ERROR("Failed to enable backlight %d\n", ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(tinydrm_enable_backlight);
> +
> +/**
> + * tinydrm_disable_backlight - Disable backlight helper
> + * @backlight: Backlight device
> + *
> + * Returns:
> + * Zero on success, negative error code on failure.
> + */
> +int tinydrm_disable_backlight(struct backlight_device *backlight)
> +{
> +	unsigned int old_state;
> +	int ret;
> +
> +	if (!backlight)
> +		return 0;
> +
> +	old_state =3D backlight->props.state;
> +	backlight->props.state |=3D BL_CORE_FBBLANK;
> +	DRM_DEBUG_KMS("Backlight state: 0x%x -> 0x%x\n", old_state,
> +		      backlight->props.state);
> +	ret =3D backlight_update_status(backlight);
> +	if (ret)
> +		DRM_ERROR("Failed to disable backlight %d\n", ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(tinydrm_disable_backlight);
> +#endif

These look like they really should be part of the backlight subsystem. I
don't see anything DRM specific about them. Well, except for the error
messages.

> +#ifdef CONFIG_SPI
> +
> +/**
> + * tinydrm_spi_max_transfer_size - Determine max SPI transfer size
> + * @spi: SPI device
> + * @max_len: Maximum buffer size needed (optional)
> + *
> + * This function returns the maximum size to use for SPI transfers. It c=
hecks
> + * the SPI master, the optional @max_len and the module parameter spi_ma=
x and
> + * returns the smallest.
> + *
> + * Returns:
> + * Maximum size for SPI transfers
> + */
> +size_t tinydrm_spi_max_transfer_size(struct spi_device *spi, size_t max_=
len)
> +{
> +	size_t ret;
> +
> +	ret =3D min(spi_max_transfer_size(spi), spi->master->max_dma_len);
> +	if (max_len)
> +		ret =3D min(ret, max_len);
> +	if (spi_max)
> +		ret =3D min_t(size_t, ret, spi_max);
> +	ret &=3D ~0x3;
> +	if (ret < 4)
> +		ret =3D 4;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(tinydrm_spi_max_transfer_size);
> +
> +/**
> + * tinydrm_spi_bpw_supported - Check if bits per word is supported
> + * @spi: SPI device
> + * @bpw: Bits per word
> + *
> + * This function checks to see if the SPI master driver supports @bpw.
> + *
> + * Returns:
> + * True if @bpw is supported, false otherwise.
> + */
> +bool tinydrm_spi_bpw_supported(struct spi_device *spi, u8 bpw)
> +{
> +	u32 bpw_mask =3D spi->master->bits_per_word_mask;
> +
> +	if (bpw =3D=3D 8)
> +		return true;
> +
> +	if (!bpw_mask) {
> +		dev_warn_once(&spi->dev,
> +			      "bits_per_word_mask not set, assume 8-bit only\n");
> +		return false;
> +	}
> +
> +	if (bpw_mask & SPI_BPW_MASK(bpw))
> +		return true;
> +
> +	return false;
> +}
> +EXPORT_SYMBOL(tinydrm_spi_bpw_supported);
> +
> +static void
> +tinydrm_dbg_spi_print(struct spi_device *spi, struct spi_transfer *tr,
> +		      const void *buf, int idx, bool tx)
> +{
> +	u32 speed_hz =3D tr->speed_hz ? tr->speed_hz : spi->max_speed_hz;
> +	char linebuf[3 * 32];
> +
> +	hex_dump_to_buffer(buf, tr->len, 16,
> +			   DIV_ROUND_UP(tr->bits_per_word, 8),
> +			   linebuf, sizeof(linebuf), false);
> +
> +	printk(KERN_DEBUG
> +	       "    tr(%i): speed=3D%u%s, bpw=3D%i, len=3D%u, %s_buf=3D[%s%s]\n=
", idx,
> +	       speed_hz > 1000000 ? speed_hz / 1000000 : speed_hz / 1000,
> +	       speed_hz > 1000000 ? "MHz" : "kHz", tr->bits_per_word, tr->len,
> +	       tx ? "tx" : "rx", linebuf, tr->len > 16 ? " ..." : "");
> +}
> +
> +/* called through tinydrm_dbg_spi_message() */
> +void _tinydrm_dbg_spi_message(struct spi_device *spi, struct spi_message=
 *m)
> +{
> +	struct spi_transfer *tmp;
> +	struct list_head *pos;
> +	int i =3D 0;
> +
> +	list_for_each(pos, &m->transfers) {
> +		tmp =3D list_entry(pos, struct spi_transfer, transfer_list);
> +
> +		if (tmp->tx_buf)
> +			tinydrm_dbg_spi_print(spi, tmp, tmp->tx_buf, i, true);
> +		if (tmp->rx_buf)
> +			tinydrm_dbg_spi_print(spi, tmp, tmp->rx_buf, i, false);
> +		i++;
> +	}
> +}
> +EXPORT_SYMBOL(_tinydrm_dbg_spi_message);
> +
> +/**
> + * tinydrm_spi_transfer - SPI transfer helper
> + * @spi: SPI device
> + * @speed_hz: Override speed (optional)
> + * @header: Optional header transfer
> + * @bpw: Bits per word
> + * @buf: Buffer to transfer
> + * @len: Buffer length
> + *
> + * This SPI transfer helper breaks up the transfer of @buf into chunks w=
hich
> + * the SPI master driver can handle. If the machine is Little Endian and=
 the
> + * SPI master driver doesn't support 16 bits per word, it swaps the byte=
s and
> + * does a 8-bit transfer.
> + * If @header is set, it is prepended to each SPI message.
> + *
> + * Returns:
> + * Zero on success, negative error code on failure.
> + */
> +int tinydrm_spi_transfer(struct spi_device *spi, u32 speed_hz,
> +			 struct spi_transfer *header, u8 bpw, const void *buf,
> +			 size_t len)
> +{
> +	struct spi_transfer tr =3D {
> +		.bits_per_word =3D bpw,
> +		.speed_hz =3D speed_hz,
> +	};
> +	struct spi_message m;
> +	u16 *swap_buf =3D NULL;
> +	size_t max_chunk;
> +	size_t chunk;
> +	int ret =3D 0;
> +
> +	if (WARN_ON_ONCE(bpw !=3D 8 && bpw !=3D 16))
> +		return -EINVAL;
> +
> +	max_chunk =3D tinydrm_spi_max_transfer_size(spi, 0);
> +
> +	if (drm_debug & DRM_UT_DRIVER)
> +		pr_debug("[drm:%s] bpw=3D%u, max_chunk=3D%zu, transfers:\n",
> +			 __func__, bpw, max_chunk);
> +
> +	if (bpw =3D=3D 16 && !tinydrm_spi_bpw_supported(spi, 16)) {
> +		tr.bits_per_word =3D 8;
> +		if (tinydrm_machine_little_endian()) {
> +			swap_buf =3D kmalloc(min(len, max_chunk), GFP_KERNEL);
> +			if (!swap_buf)
> +				return -ENOMEM;
> +		}
> +	}
> +
> +	spi_message_init(&m);
> +	if (header)
> +		spi_message_add_tail(header, &m);
> +	spi_message_add_tail(&tr, &m);
> +
> +	while (len) {
> +		chunk =3D min(len, max_chunk);
> +
> +		tr.tx_buf =3D buf;
> +		tr.len =3D chunk;
> +
> +		if (swap_buf) {
> +			const u16 *buf16 =3D buf;
> +			unsigned int i;
> +
> +			for (i =3D 0; i < chunk / 2; i++)
> +				swap_buf[i] =3D swab16(buf16[i]);
> +
> +			tr.tx_buf =3D swap_buf;
> +		}
> +
> +		buf +=3D chunk;
> +		len -=3D chunk;
> +
> +		tinydrm_dbg_spi_message(spi, &m);
> +		ret =3D spi_sync(spi, &m);
> +		if (ret)
> +			return ret;
> +	};
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(tinydrm_spi_transfer);

Similarly for the above.

Thierry

--cQXOx3fnlpmgJsTP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliYOjwACgkQ3SOs138+
s6GNWg//eXZGdsvOroVaNdxvuQgdJ3DM+IiEijzwxtl8aszqTchgvuZcUWsFPZM2
mU3M0P/xe0CKhUr3t9cKo4oNbJYguv7GUjDjuCiWqtiKIB1X2irRNsW9D1eUDRed
wh9uL/AOXAiwWJkc7Ar623YQBNXrxdDlCExX3affR0p71I2lGoJGSSxYxIAdR/SZ
J87Sqn5BbYMNdODggAUGl6s620LApHJnIy/A6y1hw0sllWPBTlZl5QtCJUZlh7uB
IkINhTkhSj9XBqiWha8wq4JQOgOiEsabHIVwZ8w8ugmPHJwa6D0YYhp/ok8RHXuI
KCqBZ1jVNTaOiPScHYkoHljnorzazUpqXsbABLATBYduTe4hd/xN8Vj3TAeOCA5l
8Jwx2IzyIjKJ5Jg+bJc+tKQz7P5upzelGX9BRL7LOUNvh2ZP69gsTLyEMuY3+aTU
+0E6Y0AlMvGacemhy+a1AVcJSeQuLoDUGhH1YKTHhJZRoCe8L+MgpLEVHGqbAgcg
SItDRLkXc9SHTFpBpKzyasaFIOwfcXbQm5Z8kEsrKtRxwmPsHAwzsQvK1ijk66OB
/IuD2luyesMbTLLqZlZ0tRqTmZCW45aOcSoz9n/C2g7gOaEO0oCf7y8FHWwUu7q1
JO+VNPC+VY3eNzSLhWeSsCa0RTNsF+9QD2rlxebx64WVm2rF5gk=
=1f67
-----END PGP SIGNATURE-----

--cQXOx3fnlpmgJsTP--

--===============1276641548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1276641548==--
