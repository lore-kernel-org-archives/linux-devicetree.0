From: Benoit Cousson <bcousson@baylibre.com>
Subject: Re: [PATCH RFC] ARM: dts: am335x: update USB DT references
Date: Tue, 22 Apr 2014 16:14:36 +0200
Message-ID: <5356794C.7070707@baylibre.com>
References: <1397647595-10927-1-git-send-email-leigh@solinno.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1397647595-10927-1-git-send-email-leigh@solinno.co.uk>
Sender: linux-omap-owner@vger.kernel.org
To: Leigh Brown <leigh@solinno.co.uk>, Mugunthan V N <mugunthanvnm@ti.com>
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Felipe Balbi <balbi@ti.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Leigh,

On 16/04/2014 13:26, Leigh Brown wrote:
> In "ARM: dts: am33xx: correcting dt node unit address for usb", the
> usb_ctrl_mod and cppi41dma nodes were updated with the correct regist=
er
> addresses.  However, the dts files that reference these nodes were no=
t
> updated, and those devices are no longer being enabled.
>
> This patch corrects the references for the affected dts files.

Thanks for the fix. BTW, why is it a RFC? Do you plan to send an update=
d=20
version?

=46YI, even with this fix, the BBB still does not have a working MUSB o=
n=20
3.15-rc2. Have you observed that as well?

> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>

If this is a final version, I'll apply it for -rc3.

Thanks,
Benoit


> ---
>   arch/arm/boot/dts/am335x-bone-common.dtsi | 4 ++--
>   arch/arm/boot/dts/am335x-evm.dts          | 4 ++--
>   arch/arm/boot/dts/am335x-evmsk.dts        | 4 ++--
>   arch/arm/boot/dts/am335x-igep0033.dtsi    | 4 ++--
>   4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/boot/dts/am335x-bone-common.dtsi b/arch/arm/boo=
t/dts/am335x-bone-common.dtsi
> index e3f27ec..2e7d932 100644
> --- a/arch/arm/boot/dts/am335x-bone-common.dtsi
> +++ b/arch/arm/boot/dts/am335x-bone-common.dtsi
> @@ -183,7 +183,7 @@
>   &usb {
>   	status =3D "okay";
>
> -	control@44e10000 {
> +	control@44e10620 {
>   		status =3D "okay";
>   	};
>
> @@ -204,7 +204,7 @@
>   		dr_mode =3D "host";
>   	};
>
> -	dma-controller@07402000  {
> +	dma-controller@47402000  {
>   		status =3D "okay";
>   	};
>   };
> diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am3=
35x-evm.dts
> index 28ae040..77df10d 100644
> --- a/arch/arm/boot/dts/am335x-evm.dts
> +++ b/arch/arm/boot/dts/am335x-evm.dts
> @@ -331,7 +331,7 @@
>   &usb {
>   	status =3D "okay";
>
> -	control@44e10000 {
> +	control@44e10620 {
>   		status =3D "okay";
>   	};
>
> @@ -352,7 +352,7 @@
>   		dr_mode =3D "host";
>   	};
>
> -	dma-controller@07402000  {
> +	dma-controller@47402000  {
>   		status =3D "okay";
>   	};
>   };
> diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/a=
m335x-evmsk.dts
> index ec08f6f..ab23885 100644
> --- a/arch/arm/boot/dts/am335x-evmsk.dts
> +++ b/arch/arm/boot/dts/am335x-evmsk.dts
> @@ -364,7 +364,7 @@
>   &usb {
>   	status =3D "okay";
>
> -	control@44e10000 {
> +	control@44e10620 {
>   		status =3D "okay";
>   	};
>
> @@ -385,7 +385,7 @@
>   		dr_mode =3D "host";
>   	};
>
> -	dma-controller@07402000  {
> +	dma-controller@47402000  {
>   		status =3D "okay";
>   	};
>   };
> diff --git a/arch/arm/boot/dts/am335x-igep0033.dtsi b/arch/arm/boot/d=
ts/am335x-igep0033.dtsi
> index 7063311..5942e7d 100644
> --- a/arch/arm/boot/dts/am335x-igep0033.dtsi
> +++ b/arch/arm/boot/dts/am335x-igep0033.dtsi
> @@ -202,7 +202,7 @@
>   &usb {
>   	status =3D "okay";
>
> -	control@44e10000 {
> +	control@44e10620 {
>   		status =3D "okay";
>   	};
>
> @@ -223,7 +223,7 @@
>   		dr_mode =3D "host";
>   	};
>
> -	dma-controller@07402000  {
> +	dma-controller@47402000  {
>   		status =3D "okay";
>   	};
>   };
>


--=20
Beno=EEt Cousson
BayLibre
Embedded Linux Technology Lab
www.baylibre.com
--
To unsubscribe from this list: send the line "unsubscribe linux-omap" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
