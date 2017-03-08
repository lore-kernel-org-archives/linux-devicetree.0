From: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: meson-gxbb-odroidc2: enable USB Host Nodes
Date: Wed, 8 Mar 2017 22:52:32 +0530
Message-ID: <CANAwSgTUPpYvFWcZOf+j6K+1rDZJNUeu9K1fGAB8TC6TgzRXCg@mail.gmail.com>
References: <1488918961-4666-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488918961-4666-1-git-send-email-linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Brian Kim <brian.kim-vC+yAUbXFBlQ0OI7PeSoCw@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi All,

On 8 March 2017 at 02:06, Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> update the regulator supply nodes for usb host to
> enable usb host on odroid-c2
>
> Signed-off-by: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> root@odroid64:/usr/src/odroidxu3-4.y-devel# lsusb -t
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
>     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>         |__ Port 1: Dev 3, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M
>         |__ Port 1: Dev 3, If 1, Class=Human Interface Device, Driver=usbhid, 1.5M
>         |__ Port 2: Dev 4, If 0, Class=Mass Storage, Driver=usb-storage, 480M
>         |__ Port 4: Dev 5, If 0, Class=Mass Storage, Driver=usb-storage, 480M
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index c59403a..304b676 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -64,6 +64,18 @@
>                 reg = <0x0 0x0 0x0 0x80000000>;
>         };
>
> +       usb_host_pwr: regulator-usb-pwrs {
> +               compatible = "regulator-fixed";
> +
> +               regulator-name = "USB_HOST_PWR";
> +
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +
> +               gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
> +
>         usb_otg_pwr: regulator-usb-pwrs {
>                 compatible = "regulator-fixed";
>
> @@ -184,6 +196,7 @@
>
>  &usb1_phy {
>         status = "okay";
> +       phy-supply = <&usb_host_pwr>;
>  };
>
>  &usb0 {
> --
> 2.7.4
>

Please ignore this patch, It not working.
I will try to submit a new patch.

Best Regards
-Anand Moon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
