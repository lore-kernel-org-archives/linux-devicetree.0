Return-Path: <robherring2@gmail.com>
Date: Fri, 2 Mar 2018 16:56:07 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 11/12] dt-bindings: usb: add documentation for typec
 port controller(TCPCI)
Message-ID: <20180302225607.75fj3n7qzdhevkeg@rob-hp-laptop>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
 <1519645759-12701-12-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519645759-12701-12-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net, a.hajda@samsung.com, mark.rutland@arm.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 26, 2018 at 07:49:18PM +0800, Li Jun wrote:
> TCPCI stands for typec port controller interface, its implementation
> has full typec port control with power delivery support, it's a
> standard i2c slave with GPIO input as irq interface, detail see spec
> "Universal Serial Bus Type-C Port Controller Interface Specification
> Revision 1.0, Version 1.1"
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
> Change for v2:
> - Use usb connector sub-node accordingly to specify typec properties.
> 
>  .../devicetree/bindings/usb/typec-tcpci.txt        | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/typec-tcpci.txt b/Documentation/devicetree/bindings/usb/typec-tcpci.txt
> new file mode 100644
> index 0000000..318bf01
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/typec-tcpci.txt
> @@ -0,0 +1,35 @@
> +TCPCI(Typec port cotroller interface) binding
> +---------------------------------------------
> +
> +Required properties:
> +- compatible:       should be "usb,tcpci".

usb is not a vendor. I'd do "usb-tcpci".

This will need chip specific compatible strings too.

> +- reg:              the i2c slave address of typec port controller device.
> +- interrupt-parent: the phandle to the interrupt controller which provides
> +                    the interrupt.
> +- interrupts:       interrupt specification for tcpci alert.
> +
> +Required sub-node:
> +- connector: The "usb-c-connector" attached to the tcpci chip, the bindings
> +  of connector node are specified in
> +  Documentation/devicetree/bindings/connector/usb-connector.txt
> +
> +Example:
> +
> +ptn5110@50 {
> +	compatible = "usb,tcpci";
> +	reg = <0x50>;
> +	interrupt-parent = <&gpio3>;
> +	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +
> +	usb_con: connector {
> +		compatible = "usb-c-connector";
> +		label = "USB-C";
> +		port-type = "dual";
> +		default-role = "sink";
> +		src-pdos = <0x380190c8>;
> +		snk-pdos = <0x380190c8 0x3802d0c8>;
> +		max-snk-mv = <9000>;
> +		max-snk-ma = <1000>;
> +		op-snk-mw = <9000>;
> +	};
> +};
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
