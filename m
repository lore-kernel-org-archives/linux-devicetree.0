From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 5/8] dt-bindings: input: touchscreen: Add max11801-ts
 binding
Date: Thu, 16 Mar 2017 10:54:15 +0800
Message-ID: <20170316025413.GV3618@dragon>
References: <1489484897-14933-1-git-send-email-jagan@openedev.com>
 <1489484897-14933-6-git-send-email-jagan@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1489484897-14933-6-git-send-email-jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 14, 2017 at 03:18:14PM +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> 
> Add missing documentation of max11801-ts dt-binding details.
> 
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
> Changes for v5:
> - Newly added patch
> 
>  .../bindings/input/touchscreen/max11801-ts.txt         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/max11801-ts.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/max11801-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/max11801-ts.txt
> new file mode 100644
> index 0000000..b6ac452
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/max11801-ts.txt
> @@ -0,0 +1,18 @@
> +* MAXI MAX11801 Resistive touch screen controller with i2c interface
> +
> +Required properties:
> +- compatible: must be "max11801"
> +- reg: i2c slave address
> +- interrupt-parent: the phandle for the interrupt controller
> +- interrupts: touch controller interrupt
> +
> +Example:
> +
> +&i2c1 {
> +	ts: max11801@48 {

Node name should be generic while label can be specific.  That said, the
following form might be better choice.

	max11801: touchscreen@48 {

Shawn

> +		compatible = "max11801";
> +		reg = <0x48>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <31 2>;
> +	};
> +};
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
