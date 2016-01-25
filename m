From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2 1/4] dt-bindings: mfd: Add bindings for the MediaTek
 MT6323 PMIC
Date: Mon, 25 Jan 2016 12:41:51 +0000
Message-ID: <20160125124151.GH3368@x1>
References: <1453716887-38442-1-git-send-email-blogic@openwrt.org>
 <1453716887-38442-2-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453716887-38442-2-git-send-email-blogic@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Flora Fu <flora.fu@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Henry Chen <henryc.chen@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 25 Jan 2016, John Crispin wrote:

> Signed-off-by: John Crispin <blogic@openwrt.org>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

=46or my own reference:
  Acked-by: Lee Jones <lee.jones@linaro.org>

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
