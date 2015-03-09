From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2 v2] mfd: arizona: Add DT binding for the DMIC
 reference voltages
Date: Mon, 9 Mar 2015 09:38:05 +0000
Message-ID: <20150309093805.GJ3427@x1>
References: <1425395094-22397-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425395094-22397-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 03 Mar 2015, Charles Keepax wrote:

> Add a DT binding that lets the DMIC reference voltage source be
> specified for each input.
>=20
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>=20
> The only change since rev 1 is a slight tweak to the wording of
> everything to make clear these are voltages.
>=20
> Thanks,
> Charles
>=20
>  drivers/mfd/arizona-core.c |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> index 09ba8f1..d6f306e 100644
> --- a/drivers/mfd/arizona-core.c
> +++ b/drivers/mfd/arizona-core.c
> @@ -561,6 +561,16 @@ static int arizona_of_get_core_pdata(struct ariz=
ona *arizona)
>  		count++;
>  	}
> =20
> +	count =3D 0;
> +	of_property_for_each_u32(arizona->dev->of_node, "wlf,dmic-ref", pro=
p,
> +				 cur, val) {
> +		if (count =3D=3D ARRAY_SIZE(arizona->pdata.dmic_ref))
> +			break;
> +
> +		arizona->pdata.dmic_ref[count] =3D val;
> +		count++;
> +	}
> +
>  	return 0;
>  }
> =20

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
