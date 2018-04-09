From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 02/13] dt-bindings: usb: add documentation for typec
 port controller(TCPCI)
Date: Mon, 9 Apr 2018 15:04:02 -0500
Message-ID: <20180409200402.qkhutincgvtmipao@rob-hp-laptop>
References: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
 <1522253178-32414-3-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1522253178-32414-3-git-send-email-jun.li@nxp.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Li Jun <jun.li@nxp.com>
Cc: devel@driverdev.osuosl.org, peter.chen@nxp.com, heikki.krogerus@linux.intel.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, a.hajda@samsung.com, linux-imx@nxp.com, linux@roeck-us.net, shufan_lee@richtek.com
List-Id: devicetree@vger.kernel.org

On Thu, Mar 29, 2018 at 12:06:07AM +0800, Li Jun wrote:
> TCPCI stands for typec port controller interface, its implementation
> has full typec port control with power delivery support, it's a
> standard i2c slave with GPIO input as irq interface, detail see spec
> "Universal Serial Bus Type-C Port Controller Interface Specification
> Revision 1.0, Version 1.1"
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  .../devicetree/bindings/usb/typec-tcpci.txt        | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/typec-tcpci.txt b/Documentation/devicetree/bindings/usb/typec-tcpci.txt
> new file mode 100644
> index 0000000..7a7a8e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/typec-tcpci.txt
> @@ -0,0 +1,33 @@
> +TCPCI(Typec port cotroller interface) binding
> +---------------------------------------------
> +
> +Required properties:
> +- compatible:       should be "usb-tcpci,chip-specific-string".

Compatible strings should be in the form of "<vendor prefix>,<device>"

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
> +	compatible = "usb-tcpci,ptn5110";
> +	reg = <0x50>;
> +	interrupt-parent = <&gpio3>;
> +	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +
> +	usb_con: connector {

How is the OF graph done in this case? You need some link to the USB 
controller.

> +		compatible = "usb-c-connector";
> +		label = "USB-C";
> +		port-type = "dual";
> +		try-power-role = "sink"
> +		source-pdos = <0x380190c8>;
> +		sink-pdos = <0x380190c8 0x3802d0c8>;
> +		op-sink-microwatt-hours = <9000000>;
> +	};
> +};
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
