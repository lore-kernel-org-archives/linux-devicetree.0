From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: net: bluetooth: Add broadcom-bluetooth
Date: Wed, 9 Aug 2017 18:16:53 -0500
Message-ID: <CAL_Jsq+akZpqXMPnSh8KRVchWJpFTrzFi6LpOpJ9FYDCrY1hPQ@mail.gmail.com>
References: <1502102366-2760-1-git-send-email-loic.poulain@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502102366-2760-1-git-send-email-loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 7, 2017 at 5:39 AM, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Add binding document for serial bluetooth chips using
> Broadcom protocol.
>
> Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  v2: dt-bindings as separate patch
>      rebase on upcoming pi3 dts changes
>  v3: changes in bcm serdev drivers:
>      name refactoring and additional comments
>      Add generic host_set_baudrate method
>      Use agnostic device_property_read
>  .../devicetree/bindings/net/broadcom-bluetooth.txt | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
>
> diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> new file mode 100644
> index 0000000..c51ea1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> @@ -0,0 +1,29 @@
> +Broadcom Bluetooth Chips
> +---------------------
> +
> +This documents the binding structure and common properties for serial
> +attached Broadcom devices.
> +
> +Serial attached Broadcom devices shall be a child node of the host UART
> +device the slave device is attached to.
> +
> +Required properties:
> +
> + - compatible: should contain one of the following:
> +   * "brcm,bcm43438-bt"
> +
> +Optional properties:

Most Broadcom devices have a couple of GPIOs needing control. Maybe
they are tied off active on RPi3, but you should document them here
even if the driver doesn't yet need them. I think they are the same as
the Nokia BT IIRC. Same goes for any input clocks.

> +
> + - max-speed: see Documentation/devicetree/bindings/serial/slave-device.txt
> +
> +Example:
> +
> +&uart2 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&uart2_pins>;
> +
> +       bluetooth {
> +               compatible = "brcm,bcm43438-bt";
> +               max-speed = <921600>;
> +       };
> +};
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
