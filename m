From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] ARM: zynq: DT: Add USB to device tree
Date: Mon, 01 Dec 2014 21:26:11 +0100
Message-ID: <547CCEE3.6020806@suse.de>
References: <1417459352-23401-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417459352-23401-1-git-send-email-soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Ola Jeppson <ola-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi S=F6ren,

Am 01.12.2014 um 19:42 schrieb Soren Brinkmann:
> Add USB nodes to zc702, zc706 and zed device trees.
>=20
> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/zynq-7000.dtsi | 22 +++++++++++++++++++++-
>  arch/arm/boot/dts/zynq-zc702.dts | 11 +++++++++++
>  arch/arm/boot/dts/zynq-zc706.dts | 10 ++++++++++
>  arch/arm/boot/dts/zynq-zed.dts   | 10 ++++++++++
>  4 files changed, 52 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zyn=
q-7000.dtsi
> index ce2ef5bec4f2..9ed60938f301 100644
> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> @@ -315,6 +315,26 @@
>  			clocks =3D <&clkc 4>;
>  		};
> =20
> +		usb0: usb@e0002000 {
> +			compatible =3D "xlnx,zynq-usb-2.20a", "chipidea,usb2";
> +			status =3D "disabled";
> +			clocks =3D <&clkc 28>;
> +			interrupt-parent =3D <&intc>;
> +			interrupts =3D <0 21 4>;
> +			reg =3D <0xe0002000 0x1000>;
> +			phy_type =3D "ulpi";
> +		};
> +
> +		usb1: usb@e0003000 {
> +			compatible =3D "xlnx,zynq-usb-2.20a", "chipidea,usb2";
> +			status =3D "disabled";
> +			clocks =3D <&clkc 29>;
> +			interrupt-parent =3D <&intc>;
> +			interrupts =3D <0 44 4>;
> +			reg =3D <0xe0003000 0x1000>;
> +			phy_type =3D "ulpi";
> +		};
> +
>  		watchdog0: watchdog@f8005000 {
>  			clocks =3D <&clkc 45>;
>  			compatible =3D "xlnx,zynq-wdt-r1p2";

This part looks good.

> @@ -324,6 +344,6 @@
>  			reg =3D <0xf8005000 0x1000>;
>  			reset =3D <0>;
>  			timeout-sec =3D <10>;
> -		};
> +		} ;
>  	};
>  };

Unrelated accidental change here though. :)

Did I miss a matching series actually implementing the driver? I'd need
to test the latest version to determine how to update the Parallella
device tree - I assume that USB0 is in dr_mode=3D"host", but with the
previous patchsets I was unable to verify. CC'ing Ola.

Regards,
Andreas

--=20
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 21284 AG N=FCrn=
berg
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
