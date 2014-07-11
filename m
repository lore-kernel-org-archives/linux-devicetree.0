From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2 RESEND] mfd: arizona: Update DT binding to support
 MICVDD init_data
Date: Fri, 11 Jul 2014 09:32:27 +0100
Message-ID: <20140711083227.GL11948@lee--X1>
References: <1405008249-4370-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1405008249-4370-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1405008249-4370-2-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 10 Jul 2014, Charles Keepax wrote:

> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/arizona.txt |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Docu=
mentation/devicetree/bindings/mfd/arizona.txt
> index fd51988..5c7e723 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -42,13 +42,15 @@ Optional properties:
>      the chip default will be used.  If present exactly five values m=
ust
>      be specified.
> =20
> -  - DCVDD-supply : Power supply, only needs to be specified if DCVDD=
 is being
> -    externally supplied. As covered in

Patch 1 in this series just added these two lines.  Normally I'd ask
you to squash them, but as they've been around for a while already and
_might_ have (benefit of the doubt) originated from separate
patch-sets, I'll apply it anyway.

Applied, thanks.

> +  - DCVDD-supply, MICVDD-supply : Power supplies, only need to be sp=
ecified if
> +    they are being externally supplied. As covered in
>      Documentation/devicetree/bindings/regulator/regulator.txt
> =20
>  Optional subnodes:
>    - ldo1 : Initial data for the LDO1 regulator, as covered in
>      Documentation/devicetree/bindings/regulator/regulator.txt
> +  - micvdd : Initial data for the MICVDD regulator, as covered in
> +    Documentation/devicetree/bindings/regulator/regulator.txt
> =20
>  Example:
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
