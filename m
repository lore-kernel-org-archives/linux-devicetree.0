From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] dt-bindings: usb: rt1711h device tree binding
 document
Date: Mon, 19 Mar 2018 09:29:03 -0700
Message-ID: <20180319162903.GB17189@roeck-us.net>
References: <1521431375-23207-1-git-send-email-leechu729@gmail.com>
 <1521431375-23207-3-git-send-email-leechu729@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521431375-23207-3-git-send-email-leechu729@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ShuFan Lee <leechu729@gmail.com>
Cc: greg@kroah.com, heikki.krogerus@linux.intel.com, shufan_lee@richtek.com, cy_huang@richtek.com, jun.li@nxp.com, mats.dev.list@gmail.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 19, 2018 at 11:49:35AM +0800, ShuFan Lee wrote:
> From: ShuFan Lee <shufan_lee@richtek.com>
> 
> Add device tree binding document for Richtek RT1711H Type-C chip driver

Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
is missing. Added here but it might make sense to resend.

>
> Signed-off-by: ShuFan Lee <shufan_lee@richtek.com>
> ---
>  .../devicetree/bindings/usb/richtek,rt1711h.txt    | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
> 
>  changelogs between v2 & v3
>  - add dt-bindings document for rt1711h typec chip driver
> 
> diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt b/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
> new file mode 100644
> index 000000000000..7da4dac78ea7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
> @@ -0,0 +1,30 @@
> +Richtek RT1711H TypeC PD Controller.
> +
> +Required properties:
> + - compatible : Must be "richtek,rt1711h".
> + - reg : Must be 0x4e, it's slave address of RT1711H.
> +
> +Recommended properties :
> + - interrupt-parent : the phandle for the interrupt controller that
> +   provides interrupts for this device.
> + - interrupts : <a b> where a is the interrupt number and b represents an
> +   encoding of the sense and level information for the interrupt.
> +
> +Optional properties :
> + - rt,intr-gpios : IRQ GPIO pin that's connected to RT1711H interrupt.
> +   if interrupt-parent & interrupts are not defined, use this property instead.
> +
> +Example :
> +rt1711h@4e {
> +	compatible = "richtek,rt1711h";
> +	reg = <0x4e>;
> +	interrupt-parent = <&gpio26>;
> +	interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +};
> +
> +Example using rt,intr-gpios :
> +rt1711h@4e {
> +	compatible = "richtek,rt1711h";
> +	reg = <0x4e>;
> +	rt,intr-gpios = <&gpio26 0 0x0>;
> +};
> -- 
> 1.9.1
> 
