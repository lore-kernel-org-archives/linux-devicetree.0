From: Mats Karrman <mats.dev.list@gmail.com>
Subject: Re: [PATCH v4 02/13] dt-bindings: usb: add documentation for typec
 port controller(TCPCI)
Date: Mon, 30 Apr 2018 09:41:07 +0200
Message-ID: <dd2ec510-d696-340f-eb0f-7655c08275ae@gmail.com>
References: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
 <1522253178-32414-3-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1522253178-32414-3-git-send-email-jun.li@nxp.com>
Content-Language: en-US
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
Cc: devel@driverdev.osuosl.org, peter.chen@nxp.com, heikki.krogerus@linux.intel.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, a.hajda@samsung.com, robh+dt@kernel.org, linux-imx@nxp.com, linux@roeck-us.net, shufan_lee@richtek.com
List-Id: devicetree@vger.kernel.org

Hi Li Jun,

Are you working on an updated version of this patch series?
I'm pondering other changes that builds on these patches (the documentation
and the fwnode added to the tcpc_dev and tcpm primarily).

Btw, there is a semi-colon missing in your example below.

BR // Mats

On 2018-03-28 18:06, Li Jun wrote:

> TCPCI stands for typec port controller interface, its implementation
> has full typec port control with power delivery support, it's a
> standard i2c slave with GPIO input as irq interface, detail see spec
> "Universal Serial Bus Type-C Port Controller Interface Specification
> Revision 1.0, Version 1.1"
>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>   .../devicetree/bindings/usb/typec-tcpci.txt        | 33 ++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
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
> +		compatible = "usb-c-connector";
> +		label = "USB-C";
> +		port-type = "dual";
> +		try-power-role = "sink"

Here!

> +		source-pdos = <0x380190c8>;
> +		sink-pdos = <0x380190c8 0x3802d0c8>;
> +		op-sink-microwatt-hours = <9000000>;
> +	};
> +};
>
