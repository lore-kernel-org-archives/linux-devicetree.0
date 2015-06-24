From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 6/7] mfd: arizona: Update DT doc for new mic detection
 bindings
Date: Wed, 24 Jun 2015 15:19:08 +0100
Message-ID: <20150624141908.GR15013@x1>
References: <1434731014-19980-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1434731014-19980-7-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1434731014-19980-7-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Ah, you did Cc the DT guys on this version.

DT Ack please.

> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/arizona.txt |   16 +++++++++++=
+++++
>  1 files changed, 16 insertions(+), 0 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Docu=
mentation/devicetree/bindings/mfd/arizona.txt
> index 32a71b7..8d92c92 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -68,6 +68,22 @@ Optional properties:
>      If this node is not mentioned or if the value is unknown, then
>      headphone detection mode is set to HPDETL.
> =20
> +  - wlf,micd-detect-debounce : Additional software microphone detect=
ion
> +    debounce specified in milliseconds.
> +  - wlf,micd-pol-gpio : GPIO specifier for the GPIO controlling the =
headset
> +    polarity if one exists.
> +  - wlf,micd-bias-start-time : Time allowed for MICBIAS to startup p=
rior to
> +    performing microphone detection, specified as per the ARIZONA_MI=
CD_TIME_XXX
> +    defines.
> +  - wlf,micd-rate : Delay between successive microphone detection me=
asurements,
> +    specified as per the ARIZONA_MICD_TIME_XXX defines.
> +  - wlf,micd-dbtime : Microphone detection hardware debounces specif=
ied as the
> +    number of measurements to take, valid values being 2 and 4.
> +  - wlf,micd-timeout : Timeout for microphone detection, specified i=
n
> +    milliseconds.
> +  - wlf,micd-force-micbias : Force MICBIAS continuously on during mi=
crophone
> +    detection.
> +
>    - DCVDD-supply, MICVDD-supply : Power supplies, only need to be sp=
ecified if
>      they are being externally supplied. As covered in
>      Documentation/devicetree/bindings/regulator/regulator.txt

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
