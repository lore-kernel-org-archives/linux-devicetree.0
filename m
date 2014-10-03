From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 1/4] hwmon: ltc2978: device tree bindings documentation
Date: Fri, 3 Oct 2014 13:27:36 +0100
Message-ID: <20141003122736.GH26643@leverpostej>
References: <1412275071-6417-1-git-send-email-atull@opensource.altera.com>
 <1412275071-6417-2-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412275071-6417-2-git-send-email-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "jdelvare-l3A5Bk7waGM@public.gmane.org" <jdelvare-l3A5Bk7waGM@public.gmane.org>, "lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org" <lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org>, "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 02, 2014 at 07:37:48PM +0100, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> Add device tree bindings documentation for ltc2978.
> 
> Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
> v2: clean whitespace
> ---
>  .../devicetree/bindings/hwmon/ltc2978.txt          |   41 ++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ltc2978.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ltc2978.txt b/Documentation/devicetree/bindings/hwmon/ltc2978.txt
> new file mode 100644
> index 0000000..b2d9c4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ltc2978.txt
> @@ -0,0 +1,41 @@
> +ltc2978
> +
> +Required properties:
> + - compatible: one of: ltc2974, ltc2977, ltc2978, ltc3880, ltc3883, ltm4676

Could we please format this like:

- compatible: should contain one of:
  * "ltc2974"
  * "ltc2977"
  * "ltc2978"
  * "ltc3880"
  * "ltc3883"
  * "ltm4676"

Given the file name, are these all variants of ltc2978? 

> + - reg: I2C address
> +
> +Optional properties:
> + Name of the optional regulator subnode must be "regulators".
> +  - #address-cells must be 1.

What's the single address cell used for?

> +  - #size-cells must be 0.
> +
> + For each regulator:
> +  - reg: regulator number

Which can be...?

What does this correspond to in the HW?

> +  - regulator-compatible: must be vout_en<regulator number> such as vout_en3
> +    valid range is:
> +      ltc2977, ltc2978 : vout_en0 - vout_en7
> +      ltc2974          : vout_en0 - vout_en3
> +      ltc3880, ltm4676 : vout_en0 - vout_en1
> +      ltc3883          : vout_en0 only

In other bindings I believe I've seen the node name used for this.

Mark, what's the preferred scheme for identifying regulators in a
container node?

> +  - regulator-name: arbitrary name for regulator

Drop the 'aribtarary'. Either this should be the name of the regulator
on the board, or it shouldn't be necessary.

Mark.

> +
> +Example:
> +ltc2978@5e {
> +	compatible = "ltc2978";
> +	reg = <0x5e>;
> +	regulators {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		vdacp0_reg: regulator@0 {
> +			reg = <0>;
> +			regulator-compatible = "vout_en0";
> +			regulator-name = "FPGA-2.5V";
> +		};
> +		vdacp2_reg: regulator@2 {
> +			reg = <2>;
> +			regulator-compatible = "vout_en2";
> +			regulator-name = "FPGA-1.5V";
> +		};
> +	};
> +};
> -- 
> 1.7.9.5
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
