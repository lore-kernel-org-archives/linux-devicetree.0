Return-Path: <SRS0=b32q=P6=gmail.com=wens213@kernel.org>
MIME-Version: 1.0
References: <20190121203928.32723-1-beagleboard@davidjohnsummers.uk> <20190121203928.32723-2-beagleboard@davidjohnsummers.uk>
In-Reply-To: <20190121203928.32723-2-beagleboard@davidjohnsummers.uk>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 22 Jan 2019 10:40:10 +0800
Message-ID: <CAGb2v64j=hGFhb3GVocRo9B1uY+tFBjbrm6F71L4ejA+cruUvA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: Create the file for Realtek Bluetooth
 serial devices
Content-Type: text/plain; charset="UTF-8"
To: David Summers <beagleboard@davidjohnsummers.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

Interested party here. I'd like to get this working on the Pine64 which has
an RTL8723BS module. I had made some changes and had it working but didn't
get around to doing the patches yet.

On Tue, Jan 22, 2019 at 4:39 AM David Summers
<beagleboard@davidjohnsummers.uk> wrote:
>
> With the changes requested by Marcel Holtmann and Rob Herring.
>
> Capitalisation as requested.
>
> Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>

The commit log is a bit lacking, as it doesn't provide any context or details
relevant to the changes in this patch, but also has details that should be
in the changelog, and not the commit log.

> ---
>  .../bindings/net/realtek-bluetooth-serial.txt | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
>
> diff --git a/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt b/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
> new file mode 100644
> index 000000000000..2eddde1a0cf1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
> @@ -0,0 +1,32 @@
> +Realtek Bluetooth devices connected via a UART.
> +These devices typically also have a WI-FI connected via SDIO - the
> +compatible described here is used just for referencing the Bluetooth.
> +
> +- compatible: should be "realtek,<name>-bt"
> +  except for "realtek,trl8761atv" - which only has a serial Bluetooth connection
> +       "realtek,rtl8723as-bt"
> +       "realtek,rtl8723bs-bt"
> +       "realtek,rtl8723ds-bt"
> +       "realtek,rtl8761atv"
> +       "realtek,rtl8821as-bt"
> +       "realtek,rtl8821cs-bt"
> +       "realtek,rtl8822bs-bt"
> +
> +Example:
> +
> +&uart0 {
> +       status = "okay";
> +       pinctrl-0 = <&uart0_xfer>, <&uart0_cts>;
> +       bluetooth {
> +               compatible = "realtek,rtl8723bs-bt";
> +               uart_rts_gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
> +               pinctrl-names = "default","rts_gpio";
> +               pinctrl-0 = <&uart0_rts>;
> +               pinctrl-1 = <&uart0_gpios>;
> +               BT,reset_gpio    = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> +               BT,wake_gpio     = <&gpio4 26 GPIO_ACTIVE_HIGH>;
> +               BT,wake_host_irq = <&gpio4 31 GPIO_ACTIVE_HIGH>;

You haven't listed these three properties in the bindings.

Second, for the last one, the property name says irq, but it takes
a GPIO phandle. This is slightly misleading.

Furthermore, ACPI already uses the names "device-wake-gpios",
"enable-gpios", and "host-wake-gpios". Would it be possible to
stick to those?

Last, you don't actually add support for them in the driver.

So why are they there?

Regards
ChenYu

> +       };
> +};
> +
> +this ensures that the Bluetooth device is tied to the correct uart.
> --
> beagleboard@davidjohnsummers.uk
>
