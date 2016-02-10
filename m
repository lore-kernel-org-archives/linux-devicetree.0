From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V3 1/4] dt-bindings: mfd: Add bindings for the MediaTek
 MT6323 PMIC
Date: Wed, 10 Feb 2016 17:01:27 +0000
Message-ID: <20160210170127.GW3782@x1>
References: <1453895258-44369-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453895258-44369-1-git-send-email-blogic@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

If you're submitting a set of patches like this, you really ought to
be providing a cover-letter.

Also, when submitting patches, please do so in the style expected by
the subsystem.  I will fix these once up for now, but please bear that
in mind in the future.

`git log --oneline -- <subsystem>` works well for this.

> Signed-off-by: John Crispin <blogic@openwrt.org>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Docum=
entation/devicetree/bindings/mfd/mt6397.txt
> index 15043e6..949c85f 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -1,6 +1,6 @@
> -MediaTek MT6397 Multifunction Device Driver
> +MediaTek MT6397/MT6323 Multifunction Device Driver
> =20
> -MT6397 is a multifunction device with the following sub modules:
> +MT6397/MT6323 is a multifunction device with the following sub modul=
es:
>  - Regulator
>  - RTC
>  - Audio codec
> @@ -8,14 +8,14 @@ MT6397 is a multifunction device with the following=
 sub modules:
>  - Clock
> =20
>  It is interfaced to host controller using SPI interface by a proprie=
tary hardware
> -called PMIC wrapper or pwrap. MT6397 MFD is a child device of pwrap.
> +called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of=
 pwrap.
>  See the following for pwarp node definitions:
>  Documentation/devicetree/bindings/soc/pwrap.txt
> =20
>  This document describes the binding for MFD device and its sub modul=
e.
> =20
>  Required properties:
> -compatible: "mediatek,mt6397"
> +compatible: "mediatek,mt6397" or "mediatek,mt6323"
> =20
>  Optional subnodes:
> =20
> @@ -26,6 +26,8 @@ Optional subnodes:
>  	Required properties:
>  		- compatible: "mediatek,mt6397-regulator"
>  	see Documentation/devicetree/bindings/regulator/mt6397-regulator.tx=
t
> +		- compatible: "mediatek,mt6323-regulator"
> +	see Documentation/devicetree/bindings/regulator/mt6323-regulator.tx=
t
>  - codec
>  	Required properties:
>  		- compatible: "mediatek,mt6397-codec"

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
