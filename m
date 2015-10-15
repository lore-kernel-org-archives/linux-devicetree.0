From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] mfd: arizona: Remove bindings covered in new
 subsystem specific docs
Date: Thu, 15 Oct 2015 09:08:18 +0100
Message-ID: <20151015080818.GN32409@x1>
References: <1444831944-4655-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1444831944-4655-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444831944-4655-4-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 14 Oct 2015, Charles Keepax wrote:

> Binding documentation has been added in new subsystem specific bindin=
g
> documents. This patch removes the now duplicate documentation from th=
e
> MFD documentation. Also whilst we are at it add a missing maintainers
> entry for the MFD binding document.
>=20
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/arizona.txt |   30 ++---------=
---------
>  MAINTAINERS                                       |    1 +
>  2 files changed, 4 insertions(+), 27 deletions(-)

Nice.  For my own reference:

  Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Once everyone is happy with the other two patches, I'll pick this.

> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Docu=
mentation/devicetree/bindings/mfd/arizona.txt
> index a8fee60..077c4fe 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -30,21 +30,9 @@ Required properties:
>    - #gpio-cells : Must be 2. The first cell is the pin number and th=
e
>      second cell is used to specify optional parameters (currently un=
used).
> =20
> -  - AVDD-supply, DBVDD1-supply, CPVDD-supply : Power supplies for th=
e device,
> -    as covered in Documentation/devicetree/bindings/regulator/regula=
tor.txt
> -
> -  - DBVDD2-supply, DBVDD3-supply : Additional databus power supplies=
 (wm5102,
> -    wm5110, wm8280, wm8998, wm1814)
> -
> -  - SPKVDDL-supply, SPKVDDR-supply : Speaker driver power supplies (=
wm5102,
> -    wm5110, wm8280, wm8998, wm1814)
> -
> -  - SPKVDD-supply : Speaker driver power supply (wm8997)
> -
>  Optional properties:
> =20
>    - wlf,reset : GPIO specifier for the GPIO controlling /RESET
> -  - wlf,ldoena : GPIO specifier for the GPIO controlling LDOENA
> =20
>    - wlf,gpio-defaults : A list of GPIO configuration register values=
=2E Defines
>      for the appropriate values can found in <dt-bindings/mfd/arizona=
=2Etxt>. If
> @@ -67,21 +55,9 @@ Optional properties:
>      present, the number of values should be less than or equal to th=
e
>      number of inputs, unspecified inputs will use the chip default.
> =20
> -  - wlf,hpdet-channel : Headphone detection channel.
> -    ARIZONA_ACCDET_MODE_HPL or 1 - Headphone detect mode is set to H=
PDETL
> -    ARIZONA_ACCDET_MODE_HPR or 2 - Headphone detect mode is set to H=
PDETR
> -    If this node is not mentioned or if the value is unknown, then
> -    headphone detection mode is set to HPDETL.
> -
> -  - DCVDD-supply, MICVDD-supply : Power supplies, only need to be sp=
ecified if
> -    they are being externally supplied. As covered in
> -    Documentation/devicetree/bindings/regulator/regulator.txt
> -
> -Optional subnodes:
> -  - ldo1 : Initial data for the LDO1 regulator, as covered in
> -    Documentation/devicetree/bindings/regulator/regulator.txt
> -  - micvdd : Initial data for the MICVDD regulator, as covered in
> -    Documentation/devicetree/bindings/regulator/regulator.txt
> +Also see child specific device properties:
> +  Regulator - ../regulator/arizona-regulator.txt
> +  Extcon    - ../extcon/extcon-arizona.txt
> =20
>  Example:
> =20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f353491..544c747 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11395,6 +11395,7 @@ S:	Supported
>  F:	Documentation/hwmon/wm83??
>  F:	Documentation/devicetree/bindings/extcon/extcon-arizona.txt
>  F:	Documentation/devicetree/bindings/regulator/arizona-regulator.txt
> +F:	Documentation/devicetree/bindings/mfd/arizona.txt
>  F:	arch/arm/mach-s3c64xx/mach-crag6410*
>  F:	drivers/clk/clk-wm83*.c
>  F:	drivers/extcon/extcon-arizona.c

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
