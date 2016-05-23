From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 4/4] documentation: Add secure monitor binding
 documentation
Date: Mon, 23 May 2016 17:38:15 +0100
Message-ID: <20160523163815.GE4976@leverpostej>
References: <1464021024-29380-1-git-send-email-carlo@caione.org>
 <1464021024-29380-5-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464021024-29380-5-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Minor nit, but please put the binding earlier in the series than the
code implementing it, as per
Documentation/devicetree/bindings/submitting-patches.txt

This makes it possible to review a series in a linear fashion.

On Mon, May 23, 2016 at 06:30:24PM +0200, Carlo Caione wrote:
> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> 
> Add the binding documentation for the Amlogic secure monitor driver.
> 
> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> ---
>  .../bindings/firmware/meson/meson_sm.txt           | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
> 
> diff --git a/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt b/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
> new file mode 100644
> index 0000000..2b71716
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
> @@ -0,0 +1,51 @@
> +* Amlogic Secure Monitor
> +
> +In the Amlogic SoCs the Secure Monitor code is used to provide access to the
> +NVMEM, enable JTAG, set USB boot, etc...
> +
> +Required properties for the secure monitor node:
> +- compatible: Should be "amlogic,meson-sm"
> +- amlogic,sm-cmd-input-base: SMC32 function identifier to read the physical
> +                             address of the input buffer
> +- amlogic,sm-cmd-output-base: SMC32 function identifier to read the physical
> +                              address of the output buffer

Do the IDs for these actually differ per board?

Are some functions simply not implemented on some boards?

> +
> +Example:
> +
> +	#include <dt-bindings/firmware/meson-gxbb-sm.h>
> +
> +	...
> +
> +	firmware {
> +		compatible = "simple-bus";
> +
> +		sm: secure-monitor {
> +			compatible = "amlogic,meson-sm";
> +			amlogic,sm-cmd-input-base = <SM_GET_SHARE_MEM_INPUT_BASE>;
> +			amlogic,sm-cmd-output-base = <SM_GET_SHARE_MEM_OUTPUT_BASE>;
> +		};
> +	};
> +
> +Node of a device using the secure monitor must have a custom property to
> +specify the SMC32 function the driver is going to use. The values of all the
> +SMC function identifiers are listed in a SoC-specific header file:
> +
> +"include/dt-bindings/firmware/meson-gxbb-sm.h" - for the Meson GXBB secure monitor.
> +
> +Example of the node using the secure monitor:
> +
> +	#include <dt-bindings/firmware/meson-gxbb-sm.h>
> +
> +	...
> +
> +	efuse: efuse {
> +		compatible = "amlogic,meson-gxbb-efuse";
> +		secure-monitor = <&sm>;
> +		amlogic,sm-cmd-read-efuse = <SM_EFUSE_READ>;
> +		amlogic,sm-cmd-max-efuse = <SM_EFUSE_USER_MAX>;

Likewise for these?

Mark.

> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		...
> +	};
> +
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
