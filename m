From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/4] ipmi: bt-i2c: added documentation for bt-i2c
 drivers
Date: Thu, 10 Aug 2017 15:25:35 -0500
Message-ID: <20170810202535.7bctfuhjh63b6jtm@rob-hp-laptop>
References: <20170805011855.1027-1-brendanhiggins@google.com>
 <20170805011855.1027-2-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170805011855.1027-2-brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: corbet-T1hC0tSOHrs@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, minyard-HInyCGIudOg@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, benjaminfair-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 04, 2017 at 06:18:52PM -0700, Brendan Higgins wrote:
> Added device tree binding documentation for ipmi-bt-i2c (host) and
> ipmi-bmc-bt-i2c (BMC) and documentation for the Block Transfer over I2C
> (bt-i2c) protocol.

Please split the bindings to a separate patch.

> 
> Signed-off-by: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
> Changes for v2:
>   - Fixed a typo
>   - Reworded a sentence to make it clear that I was talking about IBM's BT-BMC
>   - Deleted an unnecessary discussion of the host side interface (unnecessary
>     since the OpenIPMI stuff already has its own documentation).
> ---
>  Documentation/bt-i2c.txt                           | 109 +++++++++++++++++++++
>  .../devicetree/bindings/ipmi/ipmi-bt-i2c.txt       |  21 ++++
>  .../bindings/ipmi_bmc/ipmi-bmc-bt-i2c.txt          |  21 ++++
>  3 files changed, 151 insertions(+)
>  create mode 100644 Documentation/bt-i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/ipmi/ipmi-bt-i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/ipmi_bmc/ipmi-bmc-bt-i2c.txt


> diff --git a/Documentation/devicetree/bindings/ipmi/ipmi-bt-i2c.txt b/Documentation/devicetree/bindings/ipmi/ipmi-bt-i2c.txt
> new file mode 100644
> index 000000000000..bd956f2805e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi/ipmi-bt-i2c.txt
> @@ -0,0 +1,21 @@
> +Device tree configuration for the ipmi-bt-i2c driver.
> +
> +Required Properties:
> +- compatible 	: should be "ipmi-bt-i2c"
> +- reg		: the I2C slave address of the ipmi-bmc-bt-i2c
> +
> +i2c0: i2c-bus@40 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	reg = <0x40 0x40>;
> +	compatible = "aspeed,ast2400-i2c-bus";

This is the host side, right? So this should be something besides an 
ASpeed I2C controller.

> +	clock-frequency = <100000>;
> +	status = "disabled";

Don't should status in examples.

> +	interrupts = <0>;
> +	interrupt-parent = <&i2c>;
> +
> +	bt-i2c-master@41 {

But it's the slave device you are describing here, right? The host is 
the master. Just "ipmi-bt" is probably enough.

> +		compatible = "ipmi-bt-i2c";
> +		reg = <0x41>;
> +	};
> +};
> diff --git a/Documentation/devicetree/bindings/ipmi_bmc/ipmi-bmc-bt-i2c.txt b/Documentation/devicetree/bindings/ipmi_bmc/ipmi-bmc-bt-i2c.txt
> new file mode 100644
> index 000000000000..6e82693ee50e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi_bmc/ipmi-bmc-bt-i2c.txt
> @@ -0,0 +1,21 @@
> +Device tree configuration for the ipmi-bmc-bt-i2c driver.
> +
> +Required Properties:
> +- compatible 	: should be "ipmi-bmc-bt-i2c"
> +- reg		: the I2C slave address of this driver.
> +
> +i2c0: i2c-bus@40 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	reg = <0x40 0x40>;
> +	compatible = "aspeed,ast2400-i2c-bus";
> +	clock-frequency = <100000>;
> +	status = "disabled";
> +	interrupts = <0>;
> +	interrupt-parent = <&i2c>;
> +
> +	bt-i2c-slave@41 {
> +		compatible = "ipmi-bmc-bt-i2c";
> +		reg = <0x41>;

This doesn't follow the slave binding which sets bit 30 for slave 
devices.

> +	};
> +};
> -- 
> 2.14.0.rc1.383.gd1ce394fe2-goog
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
