From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] extcon: arizona: Update naming for micd-timeout DT to
 include units
Date: Tue, 24 Nov 2015 09:04:16 +0900
Message-ID: <5653A980.30100@samsung.com>
References: <1448290290-19267-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1448290290-19267-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015=EB=85=84 11=EC=9B=94 23=EC=9D=BC 23:51, Charles Keepax wrote:
> Add time units of -ms (milliseconds) to wlf,micd-timeout.
>=20
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  .../devicetree/bindings/extcon/extcon-arizona.txt  |    2 +-
>  drivers/extcon/extcon-arizona.c                    |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.=
txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> index da9813b..05d85ac 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> +++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> @@ -33,7 +33,7 @@ Optional properties:
>      specified as per the ARIZONA_MICD_TIME_XXX defines.
>    - wlf,micd-dbtime : Microphone detection hardware debounces specif=
ied as the
>      number of measurements to take, valid values being 2 and 4.
> -  - wlf,micd-timeout : Timeout for microphone detection, specified i=
n
> +  - wlf,micd-timeout-ms : Timeout for microphone detection, specifie=
d in
>      milliseconds.
>    - wlf,micd-force-micbias : Force MICBIAS continuously on during mi=
crophone
>      detection.
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-=
arizona.c
> index c377030..8647533 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -1230,7 +1230,7 @@ static int arizona_extcon_device_get_pdata(stru=
ct arizona *arizona)
>  	device_property_read_u32(arizona->dev, "wlf,micd-dbtime",
>  				 &pdata->micd_dbtime);
> =20
> -	device_property_read_u32(arizona->dev, "wlf,micd-timeout",
> +	device_property_read_u32(arizona->dev, "wlf,micd-timeout-ms",
>  				 &pdata->micd_timeout);
> =20
>  	pdata->micd_force_micbias =3D device_property_read_bool(arizona->de=
v,
>=20

Applied it.

Thanks,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
