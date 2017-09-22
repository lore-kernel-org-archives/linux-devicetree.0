From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [PATCH v2] ARM: dts: iwg22d: Enable SDHI0 controller
Date: Fri, 22 Sep 2017 13:33:39 +0000
Message-ID: <TY1PR06MB08955E235768A72D33FE2AD3C0670@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <TY1PR06MB0702E99A48352C055705E3A9B7670@TY1PR06MB0702.apcprd06.prod.outlook.com>
 <1506085262-13639-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506085262-13639-1-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Simon,

just to clarify the changes between v1 and v2, we can't use SDR50 and SDR10=
4 (due to an HW issue) therefore the pinctrl for UHS has been removed and w=
e dropped property "sd-uhs-sdr104". High Speed has been tested, therefore i=
f you are happy with the patch I guess you can update the following page ac=
cordingly:
http://elinux.org/index.php?title=3DRenesas-MMC-Enabled-Speeds&type=3Drevis=
ion&diff=3D451426&oldid=3D451421

Although (due to a bug) sdhi0 may not hold a reference to "vccq_sdhi0", the=
 gpio regulator will initialize "SDHI0 VccQ" at 3.3V.
I have sent another patch (mmc: tmio: check mmc_regulator_get_supply return=
 value) to start a discussion about a possible fix for the bug.

Let me know if you need more information.

Thanks,
Fabrizio

> -----Original Message-----
> From: linux-renesas-soc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-renesas-soc-o=
wner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Fabrizio Castro
> Sent: 22 September 2017 14:01
> To: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>=
; Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>;
> Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>; Chris Paterson <Chris.Paterson2@ren=
esas.com>; Fabrizio Castro
> <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>; Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>; dev=
icetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-renesas-
> soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Chris Paterson=
 <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> Subject: [PATCH v2] ARM: dts: iwg22d: Enable SDHI0 controller
>
> Enable the SDHI0 controller on iWave RZ/G1E carrier board.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Signed-off-by: Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 29 +++++++++++++++++++++++=
++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/=
dts/r8a7745-iwg22d-sodimm.dts
> index aac84c6..8772c56 100644
> --- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> +++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> @@ -24,6 +24,19 @@
>  bootargs =3D "ignore_loglevel rw root=3D/dev/nfs ip=3Ddhcp";
>  stdout-path =3D "serial0:115200n8";
>  };
> +
> +vccq_sdhi0: regulator-vccq-sdhi0 {
> +compatible =3D "regulator-gpio";
> +
> +regulator-name =3D "SDHI0 VccQ";
> +regulator-min-microvolt =3D <1800000>;
> +regulator-max-microvolt =3D <3300000>;
> +
> +gpios =3D <&gpio0 20 GPIO_ACTIVE_LOW>;
> +gpios-states =3D <1>;
> +states =3D <3300000 1
> +  1800000 0>;
> +};
>  };
>
>  &pfc {
> @@ -36,6 +49,12 @@
>  groups =3D "avb_mdio", "avb_gmii";
>  function =3D "avb";
>  };
> +
> +sdhi0_pins: sd0 {
> +groups =3D "sdhi0_data4", "sdhi0_ctrl";
> +function =3D "sdhi0";
> +power-source =3D <3300>;
> +};
>  };
>
>  &scif4 {
> @@ -63,3 +82,13 @@
>  micrel,led-mode =3D <1>;
>  };
>  };
> +
> +&sdhi0 {
> +pinctrl-0 =3D <&sdhi0_pins>;
> +pinctrl-names =3D "default";
> +
> +vmmc-supply =3D <&reg_3p3v>;
> +vqmmc-supply =3D <&vccq_sdhi0>;
> +cd-gpios =3D <&gpio6 6 GPIO_ACTIVE_LOW>;
> +status =3D "okay";
> +};
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
