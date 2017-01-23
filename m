From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/18] Documentation: devicetree: amlogic: Reorder boards
Date: Mon, 23 Jan 2017 10:48:31 -0600
Message-ID: <20170123164831.ux2kkofq7xf2whnp@rob-hp-laptop>
References: <20170120222118.21476-1-afaerber@suse.de>
 <20170120222118.21476-2-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170120222118.21476-2-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 20, 2017 at 11:21:01PM +0100, Andreas Färber wrote:
> Enforce groupment by SoCs and order alphabetically within the group
> (with some exceptions). This should facilitate adding new boards.
> 
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.txt | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
> index c246cd2730d9..b03d23c9ea78 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.txt
> +++ b/Documentation/devicetree/bindings/arm/amlogic.txt
> @@ -29,23 +29,30 @@ Boards with the Amlogic Meson GXM S912 SoC shall have the following properties:
>    Required root node property:
>      compatible: "amlogic,s912", "amlogic,meson-gxm";
>  
> -Board compatible values:
> +Board compatible values (grouped by SoC):

...and alphabetical order within each SoC.

> +
>    - "geniatech,atv1200" (Meson6)
> +
>    - "minix,neo-x8" (Meson8)
> -  - "tronfy,mxq" (Meson8b)
> +
>    - "hardkernel,odroid-c1" (Meson8b)
> +  - "tronfy,mxq" (Meson8b)
> +
> +  - "amlogic,p200" (Meson gxbb)
> +  - "amlogic,p201" (Meson gxbb)
> +  - "hardkernel,odroid-c2" (Meson gxbb)
> +  - "nexbox,a95x" (Meson gxbb or Meson gxl s905x)
>    - "tronsmart,vega-s95-pro", "tronsmart,vega-s95" (Meson gxbb)
>    - "tronsmart,vega-s95-meta", "tronsmart,vega-s95" (Meson gxbb)
>    - "tronsmart,vega-s95-telos", "tronsmart,vega-s95" (Meson gxbb)
> -  - "hardkernel,odroid-c2" (Meson gxbb)
> -  - "amlogic,p200" (Meson gxbb)
> -  - "amlogic,p201" (Meson gxbb)
>    - "wetek,hub" (Meson gxbb)
>    - "wetek,play2" (Meson gxbb)
> +
>    - "amlogic,p212" (Meson gxl s905x)
> +
>    - "amlogic,p230" (Meson gxl s905d)
>    - "amlogic,p231" (Meson gxl s905d)
> +
>    - "amlogic,q200" (Meson gxm s912)
>    - "amlogic,q201" (Meson gxm s912)
> -  - "nexbox,a95x" (Meson gxbb or Meson gxl s905x)
>    - "nexbox,a1" (Meson gxm s912)
> -- 
> 2.10.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
