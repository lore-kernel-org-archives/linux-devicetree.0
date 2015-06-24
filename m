From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 6/7] mfd: arizona: Update DT doc for new mic detection
 bindings
Date: Wed, 24 Jun 2015 15:15:34 +0100
Message-ID: <20150624141534.GN15013@x1>
References: <1434709467-28147-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1434709467-28147-7-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1434709467-28147-7-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: cw00.choi@samsung.com, myungjoo.ham@samsung.com, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This requires a DT Ack.

[... which would be pretty difficult, as you didn't Cc them]

> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
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
