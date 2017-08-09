From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] ARM: dts: bcm2837-rpi-3-b: Add bcm43438 as serial slave
Date: Wed, 9 Aug 2017 18:10:04 -0500
Message-ID: <CAL_JsqKxA2pgtjmG-cxy5XPWuRWUiia-weRZDSh4++Vn=QZmqA@mail.gmail.com>
References: <1502102366-2760-1-git-send-email-loic.poulain@gmail.com> <1502102366-2760-2-git-send-email-loic.poulain@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502102366-2760-2-git-send-email-loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 7, 2017 at 5:39 AM, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Add BCM43438 as a slave device of uart0 (pl011/ttyAMA0).
> This allows to automatically insert the bcm43438 to the bluetooth
> subsystem instead of relying on userspace helpers (hciattach).
>
> Overwrite bootargs to use 8250 aux uart (ttyS0) as console instead
> of pl011/ttyAMA0.
>
> Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  v2: dt-bindings as separate patch
>      rebase on upcoming pi3 dts changes
>  v3: changes in bcm serdev drivers:
>      name refactoring and additional comments
>      Add generic host_set_baudrate method
>      Use agnostic device_property_read
>
>  arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> index 20725ca..5abc1df 100644
> --- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> @@ -8,6 +8,11 @@
>         compatible = "raspberrypi,3-model-b", "brcm,bcm2837";
>         model = "Raspberry Pi 3 Model B";
>
> +       chosen {
> +               /* 8250 auxiliar UART instead of pl011 */
> +               bootargs = "earlyprintk console=ttyS0,115200";

This is an unrelated change. "earlyprintk" is arm32 specific and only
works with a kernel built with a specific uart type and address. Also,
stdout-path property is preferred to set the default over "console".

> +       };
> +
>         memory {
>                 reg = <0 0x40000000>;
>         };
> @@ -24,6 +29,11 @@
>         pinctrl-names = "default";
>         pinctrl-0 = <&uart0_gpio32 &gpclk2_gpio43>;
>         status = "okay";
> +
> +       bluetooth {
> +               compatible = "brcm,bcm43438-bt";
> +               max-speed = <921600>;
> +       };
>  };
>
>  /* uart1 is mapped to the pin header */
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
