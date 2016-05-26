From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 2/3] documentation: Add secure monitor binding
 documentation
Date: Thu, 26 May 2016 09:20:27 +0200
Message-ID: <5746A3BB.3030505@baylibre.com>
References: <1464207511-11786-1-git-send-email-carlo@caione.org>
 <1464207511-11786-3-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464207511-11786-3-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Carlo,

On 05/25/2016 10:18 PM, Carlo Caione wrote:
> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> 
> Add the binding documentation for the Amlogic secure monitor driver.
> 
> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> ---
>  .../bindings/firmware/meson/meson_sm.txt           | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
> 
> diff --git a/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt b/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
> new file mode 100644
> index 0000000..896758d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
> @@ -0,0 +1,42 @@
> +* Amlogic Secure Monitor
> +
> +In the Amlogic SoCs the Secure Monitor code is used to provide access to the
> +NVMEM, enable JTAG, set USB boot, etc...
> +
> +Required properties for the secure monitor node:
> +- compatible: Should be "amlogic,meson-gxbb-sm"
> +
> +Example:
> +
> +	#include <dt-bindings/firmware/meson-sm.h>
> +
> +	...
> +
> +	firmware {
> +		compatible = "simple-bus";
> +
> +		sm: secure-monitor {
> +			compatible = "amlogic,meson-gxbb-sm";
> +		};
> +	};
> +
> +Node of a device using the secure monitor must have a custom property to
> +specify the SMC32 function ID the driver is going to use.
> +
> +Example of the node using the secure monitor:
> +
> +	#include <dt-bindings/firmware/meson-sm.h>
> +
> +	...
> +
> +	efuse: efuse {
> +		compatible = "amlogic,meson-gxbb-efuse";
> +		secure-monitor = <&sm>;
> +		amlogic,sm-cmd-read-efuse = <SM_EFUSE_READ>;
> +		amlogic,sm-cmd-max-efuse = <SM_EFUSE_USER_MAX>;

Same here, since the compatible is "gxbb" specific, there is no need for these properties, and so no need for the dt-bindings header.

> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		...
> +	};
> +
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
