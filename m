MIME-Version: 1.0
Date: Fri, 25 Jan 2019 13:46:32 -0600
References: <20190121203928.32723-1-beagleboard@davidjohnsummers.uk>
	<20190121203928.32723-2-beagleboard@davidjohnsummers.uk>
In-Reply-To: <20190121203928.32723-2-beagleboard@davidjohnsummers.uk>
Message-ID: <CAL_Jsq+9zjPaDiJ0Uynp9p7WpH-NK-sT91vUm-+R7D_me8a9Mw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: Create the file for Realtek Bluetooth
 serial devices
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: David Summers <beagleboard@davidjohnsummers.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Jan 21, 2019 at 2:39 PM David Summers
<beagleboard@davidjohnsummers.uk> wrote:
>
> With the changes requested by Marcel Holtmann and Rob Herring.
>
> Capitalisation as requested.

Write something that makes sense for the git history. The above 2
lines are not useful information.

> Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
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

Don't show 'status' in examples.

> +       pinctrl-0 = <&uart0_xfer>, <&uart0_cts>;
> +       bluetooth {
> +               compatible = "realtek,rtl8723bs-bt";
> +               uart_rts_gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;

We already have a standard property name and location for handling RTS
on a GPIO and this is not it.

> +               pinctrl-names = "default","rts_gpio";
> +               pinctrl-0 = <&uart0_rts>;

This belongs in the parent node.

> +               pinctrl-1 = <&uart0_gpios>;
> +               BT,reset_gpio    = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> +               BT,wake_gpio     = <&gpio4 26 GPIO_ACTIVE_HIGH>;
> +               BT,wake_host_irq = <&gpio4 31 GPIO_ACTIVE_HIGH>;

All the above need to be documented. Putting in an example is not documented.

Drop the 'BT,' as the part preceding the comma should be a vendor name
if present and use '-' rather than '_' in property names.

'reset-gpios' is the standard name for a reset gpio. An irq should use
the 'interrupts' binding even if connected to a GPIO on the host.

Rob
