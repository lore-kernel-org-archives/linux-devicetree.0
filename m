From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: amlogic: Add SoC information
 bindings
Date: Fri, 9 Jun 2017 08:37:17 -0500
Message-ID: <20170609133717.gkqnyatqezkrcaeg@rob-hp-laptop>
References: <1496742340-10307-1-git-send-email-narmstrong@baylibre.com>
 <1496742340-10307-2-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1496742340-10307-2-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 06, 2017 at 11:45:38AM +0200, Neil Armstrong wrote:
> Add bindings for the SoC information register of the Amlogic SoCs.
> 
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.txt | 32 +++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
> index 5c01e65..ae3e8ed 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.txt
> +++ b/Documentation/devicetree/bindings/arm/amlogic.txt
> @@ -60,3 +60,35 @@ Board compatible values (alphabetically, grouped by SoC):
>    - "amlogic,q201" (Meson gxm s912)
>    - "kingnovel,r-box-pro" (Meson gxm S912)
>    - "nexbox,a1" (Meson gxm s912)
> +
> +Amlogic Meson Firmware registers Interface
> +------------------------------------------
> +
> +The Meson SoCs have a register bank with status and data shared with the
> +secure firmware.
> +
> +Required properties:
> + - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-ao-secure", "syscon", "simple-mfd"
> +
> +Sub-nodes should indentify components of this register interface :
> +
> +Meson GX SoC Information
> +------------------------
> +A firmware register encodes the SoC type, package and revision information on
> +the Meson GX SoCs.
> +If present, a device node for this register should be added.
> +
> +Required properties:
> +  - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-chipid".
> +
> +Example
> +-------
> +
> +ao-secure@140 {
> +	compatible = "amlogic,meson-gx-ao-secure", "syscon", "simple-mfd";
> +	reg = <0x0 0x140 0x0 0x140>;
> +
> +	chipid {
> +		compatible = "amlogic,meson-gx-chipid";

No registers for this block? If not, this node is pointless. 
"amlogic,meson-gx-ao-secure" should be specific enough to determine if 
you have this block or not and the driver for it can create a device if 
the OS needs it.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
