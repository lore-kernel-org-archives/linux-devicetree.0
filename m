From: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH 6/6] MIPS: BMIPS: Add device tree example for BCM6362
Date: Tue, 14 Jun 2016 16:46:23 +0200
Message-ID: <CAOiHx==5ZOfL5JGyv9t6jUEXGfL4xnNjKmUocEv5gBeve8=KLA@mail.gmail.com>
References: <1465803534-25840-1-git-send-email-noltari@gmail.com> <1465803534-25840-6-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1465803534-25840-6-git-send-email-noltari@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: MIPS Mailing List <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, Rob Herring <robh@kernel.org>, Simon Arlott <simon@fire.lp0.eu>
List-Id: devicetree@vger.kernel.org

Hi,

On 13 June 2016 at 09:38, =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gma=
il.com> wrote:
> This adds a device tree example for SFR NeufBox 6.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>  arch/mips/bmips/Kconfig                    |   4 +
>  arch/mips/boot/dts/brcm/Makefile           |   2 +
>  arch/mips/boot/dts/brcm/bcm6362.dtsi       | 134 +++++++++++++++++++=
++++++++++
>  arch/mips/boot/dts/brcm/bcm96362nb6ser.dts |  22 +++++
>  4 files changed, 162 insertions(+)
>  create mode 100644 arch/mips/boot/dts/brcm/bcm6362.dtsi
>  create mode 100644 arch/mips/boot/dts/brcm/bcm96362nb6ser.dts
>
> diff --git a/arch/mips/bmips/Kconfig b/arch/mips/bmips/Kconfig
> index 5b0ad8c..43da496 100644
> --- a/arch/mips/bmips/Kconfig
> +++ b/arch/mips/bmips/Kconfig
> @@ -33,6 +33,10 @@ config DT_BCM96358NB4SER
>         bool "BCM96358NB4SER"
>         select BUILTIN_DTB
>
> +config DT_BCM96362NB6SER
> +       bool "BCM96362NB6SER"

DT_SFR_NEUFBOX6_SERCOMM
       bool "SFR Neufbox 6 (Sercomm)"

maybe?

> +       select BUILTIN_DTB
> +
>  config DT_BCM96368MVWG
>         bool "BCM96368MVWG"
>         select BUILTIN_DTB
> diff --git a/arch/mips/boot/dts/brcm/Makefile b/arch/mips/boot/dts/br=
cm/Makefile
> index c553b95..161e54b 100644
> --- a/arch/mips/boot/dts/brcm/Makefile
> +++ b/arch/mips/boot/dts/brcm/Makefile
> @@ -3,6 +3,7 @@ dtb-$(CONFIG_DT_BCM93384WVG)            +=3D bcm93384=
wvg.dtb
>  dtb-$(CONFIG_DT_BCM93384WVG_VIPER)     +=3D bcm93384wvg_viper.dtb
>  dtb-$(CONFIG_DT_BCM963268VR3032U)      +=3D bcm963268vr3032u.dtb
>  dtb-$(CONFIG_DT_BCM96358NB4SER)                +=3D bcm96358nb4ser.d=
tb
> +dtb-$(CONFIG_DT_BCM96362NB6SER)                +=3D bcm96362nb6ser.d=
tb

Similar here.

>  dtb-$(CONFIG_DT_BCM96368MVWG)          +=3D bcm96368mvwg.dtb
>  dtb-$(CONFIG_DT_BCM9EJTAGPRB)          +=3D bcm9ejtagprb.dtb
>  dtb-$(CONFIG_DT_BCM97125CBMB)          +=3D bcm97125cbmb.dtb
> @@ -20,6 +21,7 @@ dtb-$(CONFIG_DT_NONE)                 +=3D \
>                                                 bcm93384wvg_viper.dtb=
   \
>                                                 bcm963268vr3032u.dtb =
   \
>                                                 bcm96358nb4ser.dtb   =
   \
> +                                               bcm96362nb6ser.dtb   =
   \
>                                                 bcm96368mvwg.dtb     =
   \
>                                                 bcm9ejtagprb.dtb     =
   \
>                                                 bcm97125cbmb.dtb     =
   \

(snip)

> diff --git a/arch/mips/boot/dts/brcm/bcm96362nb6ser.dts b/arch/mips/b=
oot/dts/brcm/bcm96362nb6ser.dts
> new file mode 100644
> index 0000000..a470230
> --- /dev/null
> +++ b/arch/mips/boot/dts/brcm/bcm96362nb6ser.dts

Similar here.

> @@ -0,0 +1,22 @@
> +/dts-v1/;
> +
> +/include/ "bcm6362.dtsi"
> +
> +/ {
> +       compatible =3D "sfr,nb6-ser", "brcm,bcm6362";

I don't see the sfr vendor prefix documented (at least not in
4.7-rc2). If it is already in -next, then disregard that comment.


> +       model =3D "SFT NeufBox 6 (Sercomm)";

SFT? Not SFR? ;p



Regards
Jonas
