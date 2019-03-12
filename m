Return-Path: <robherring2@gmail.com>
Date: Tue, 12 Mar 2019 09:45:27 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: add documentation for typec
 switch via GPIO
Message-ID: <20190312144527.GA18735@bogus>
References: <1552299557-6306-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1552299557-6306-1-git-send-email-jun.li@nxp.com>
To: Jun Li <jun.li@nxp.com>
Cc: "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 11, 2019 at 10:40:09AM +0000, Jun Li wrote:
> Some typec super speed active channel switch can be controlled via
> a GPIO, this binding can be used to specify the switch node by
> a GPIO and the remote endpoint of its consumer.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  .../devicetree/bindings/usb/typec-switch-gpio.txt  | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/typec-switch-gpio.txt b/Documentation/devicetree/bindings/usb/typec-switch-gpio.txt
> new file mode 100644
> index 0000000..4ef76cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/typec-switch-gpio.txt
> @@ -0,0 +1,30 @@
> +Typec orientation switch via a GPIO
> +-----------------------------------
> +
> +Required properties:
> +- compatible: should be set one of following:
> +	- "nxp,ptn36043" for NXP Type-C SuperSpeed active switch.
> +
> +- gpios: the GPIO used to switch the super speed active channel,

Perhaps switch-gpios in case there are other gpios needed.

> +		GPIO_ACTIVE_HIGH: GPIO state high for cc1;
> +		GPIO_ACTIVE_LOW:  GPIO state low for cc1.
> +- orientation-switch: must be present.

Why is this needed? The compatible can't imply this?

> +
> +Required sub-node:
> +- port: specify the remote endpoint of typec switch consumer.
> +
> +Example:
> +
> +ptn36043 {
> +	compatible = "nxp,ptn36043";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ss_sel>;
> +	gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>;
> +	orientation-switch;
> +
> +	port {
> +		usb3_data_ss: endpoint {
> +			remote-endpoint = <&typec_con_ss>;
> +		};
> +	};
> +};
> -- 
> 2.7.4
> 
