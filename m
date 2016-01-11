From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] mfd: arizona: Add device tree binding to specify
 mono outputs
Date: Mon, 11 Jan 2016 07:31:52 +0000
Message-ID: <20160111073152.GY3331@x1>
References: <1450088352-10470-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450088352-10470-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 14 Dec 2015, Charles Keepax wrote:

> Add device tree bindings to support specifying outputs from the chip =
as
> mono outputs. Whilst we are doing it change the out_mono pdata from a
> bool to an int, because Sparse gets upset about using ARRAY_SIZE on
> bools.
>=20
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>=20
> No changes since v1.
>=20
> Thanks,
> Charles
>=20
>  drivers/mfd/arizona-core.c        | 10 ++++++++++
>  include/linux/mfd/arizona/pdata.h |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> index b9489a0..4bb4866 100644
> --- a/drivers/mfd/arizona-core.c
> +++ b/drivers/mfd/arizona-core.c
> @@ -861,6 +861,16 @@ static int arizona_of_get_core_pdata(struct ariz=
ona *arizona)
>  		count++;
>  	}
> =20
> +	count =3D 0;
> +	of_property_for_each_u32(arizona->dev->of_node, "wlf,out-mono", pro=
p,
> +				 cur, val) {
> +		if (count =3D=3D ARRAY_SIZE(pdata->out_mono))
> +			break;
> +
> +		pdata->out_mono[count] =3D !!val;
> +		count++;
> +	}
> +
>  	return 0;
>  }
> =20
> diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/ar=
izona/pdata.h
> index 57b45ca..64faeef 100644
> --- a/include/linux/mfd/arizona/pdata.h
> +++ b/include/linux/mfd/arizona/pdata.h
> @@ -171,7 +171,7 @@ struct arizona_pdata {
>  	int inmode[ARIZONA_MAX_INPUT];
> =20
>  	/** Mode for outputs */
> -	bool out_mono[ARIZONA_MAX_OUTPUT];
> +	int out_mono[ARIZONA_MAX_OUTPUT];
> =20
>  	/** PDM speaker mute setting */
>  	unsigned int spk_mute[ARIZONA_MAX_PDM_SPK];

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
