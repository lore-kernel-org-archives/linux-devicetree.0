Return-Path: <SRS0=qV72=RO=redhat.com=hdegoede@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: add documentation for typec
 switch via GPIO
References: <1552299557-6306-1-git-send-email-jun.li@nxp.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <afcbc9c0-d3f6-98ff-f7bc-9919cda6a034@redhat.com>
Date: Mon, 11 Mar 2019 12:02:39 +0100
MIME-Version: 1.0
In-Reply-To: <1552299557-6306-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jun Li <jun.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

On 11-03-19 11:40, Jun Li wrote:
> Some typec super speed active channel switch can be controlled via
> a GPIO, this binding can be used to specify the switch node by
> a GPIO and the remote endpoint of its consumer.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>   .../devicetree/bindings/usb/typec-switch-gpio.txt  | 30 ++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
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
> +		GPIO_ACTIVE_HIGH: GPIO state high for cc1;
> +		GPIO_ACTIVE_LOW:  GPIO state low for cc1.
> +- orientation-switch: must be present.

Shouldn't this have usb-c in the propery name, e.g.:
usb-c-orientation-switch  ?

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


Isn't this the wrong way around, shouldn't the "usb-c-connector"
compatible port be pointing to the orientation switch, rather then
the other way around?  Both will work in the end. but to me it
feels more natural to group all the info about the type-c connector
together in the "usb-c-connector" compatible port

Regards,

Hans
