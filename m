From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] DT: add binding for mxs regulator
Date: Mon, 29 Sep 2014 12:09:19 +0100
Message-ID: <20140929110919.GB2432@leverpostej>
References: <1411779588-22031-1-git-send-email-stefan.wahren@i2se.com>
 <1411779588-22031-2-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411779588-22031-2-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 27, 2014 at 01:59:47AM +0100, Stefan Wahren wrote:
> This patch adds the Device tree bindings for the Freescale MXS
> on-chip regulators.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  .../bindings/regulator/mxs-regulator.txt           |   36 ++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mxs-regulator.txt
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mxs-regulator.txt b/Documentation/devicetree/bindings/regulator/mxs-regulator.txt
> new file mode 100644
> index 0000000..e3133a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mxs-regulator.txt
> @@ -0,0 +1,36 @@
> +MXS regulators
> +
> +Required node properties:
> +- compatible: Should be "simple-bus"

This does not look like an appropriate use of simple-bus.

Why do you want the parent node to be a simple-bus?

> +- #address-cells: Number of cells required to define regulator register,
> +  must be 1
> +- #size-cells: Number of cells required to define register size, must be 1

Why must this be the case, given that the child node expects an absolute
physical address?

What's wrong with #address-cells = <2>, for example?

> +- reg: Absolute physical address and size of the register set for the device

Why is this here _and_ in the child node(s)?

What is the difference between this node and its children?

Can there be more than one sub-node?

Mark.

> +
> +Required regulator properties:
> +- compatible: Must be "fsl,mxs-regulator"
> +- reg: Absolute physical address of the register set for the regulator
> +
> +Any regulator property defined as part of the core regulator
> +binding, defined in regulator.txt, can also be used.
> +
> +Example:
> +
> +	power: power@80044000 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0x80044000 0x2000>;
> +		ranges;
> +
> +		reg_vddd: regulator@80044040 {
> +			reg = <0x80044040 0x10>;
> +			compatible = "fsl,mxs-regulator";
> +			regulator-name = "vddd";
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <1575000>;
> +			regulator-boot-on;
> +			vddd-supply = <&reg_vdda>;
> +		};
> +	};
> +
> -- 
> 1.7.9.5
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
