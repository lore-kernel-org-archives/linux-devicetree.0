From: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH] drm/tilcdc: Remove redundant OF_DETACHED flag setting
Date: Fri, 13 Oct 2017 15:02:16 +0300
Message-ID: <3c7ecc25-d41b-1f01-f78d-9d59f22a167e@ti.com>
References: <20171013074755.14718-1-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171013074755.14718-1-stephen.boyd@linaro.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <stephen.boyd@linaro.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

=EF=BB=BF
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki

On 10/13/17 10:47, Stephen Boyd wrote:
> of_fdt_unflatten_tree() already sets the flag on this node to
> OF_DETACHED, because of_fdt_unflatten_tree() calls
> __unflatten_device_tree() with the detached bool set to true.
>=20
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---
>  drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c b/drivers/gpu/d=
rm/tilcdc/tilcdc_slave_compat.c
> index 623a9140493c..482299a6f3b0 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
> @@ -163,7 +163,6 @@ static struct device_node * __init tilcdc_get_overlay=
(struct kfree_table *kft)
>  		return NULL;
>  	}
> =20
> -	of_node_set_flag(overlay, OF_DETACHED);
>  	ret =3D of_resolve_phandles(overlay);
>  	if (ret) {
>  		pr_err("%s: Failed to resolve phandles: %d\n", __func__, ret);
>=20

Acked-by: Jyri Sarha <jsarha@gmail.com>

I'll pick this up for my next pull request.
