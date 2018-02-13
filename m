From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v3 3/5] [RFT] ARM: dts: wheat: Fix ADV7513 address usage
Date: Tue, 13 Feb 2018 14:11:38 +0200
Message-ID: <5701429.SOn1uAbrAx@avalon>
References: <1518473273-6333-1-git-send-email-kbingham@kernel.org> <1518473273-6333-4-git-send-email-kbingham@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518473273-6333-4-git-send-email-kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kieran Bingham <kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Jean-Michel Hautbois <jean-michel.hautbois-B+Q8N6RmIDZBDgjK7y7TUQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Tuesday, 13 February 2018 00:07:51 EET Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> 
> The r8a7792 Wheat board has two ADV7513 devices sharing a single i2c
> bus, however in low power mode the ADV7513 will reset it's slave maps to
> use the hardware defined default addresses.
> 
> The ADV7511 driver was adapted to allow the two devices to be registered
> correctly - but it did not take into account the fault whereby the
> devices reset the addresses.
> 
> This results in an address conflict between the device using the default
> addresses, and the other device if it is in low-power-mode.
> 
> Repair this issue by moving both devices away from the default address
> definitions.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> ---
> v2:
>  - Addition to series
> 
> v3:
>  - Split map register addresses into individual declarations.
> 
>  arch/arm/boot/dts/r8a7792-wheat.dts | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7792-wheat.dts
> b/arch/arm/boot/dts/r8a7792-wheat.dts index b9471b67b728..42fff8837eab
> 100644
> --- a/arch/arm/boot/dts/r8a7792-wheat.dts
> +++ b/arch/arm/boot/dts/r8a7792-wheat.dts
> @@ -240,9 +240,16 @@
>  	status = "okay";
>  	clock-frequency = <400000>;
> 
> +	/*
> +	 * The adv75xx resets its addresses to defaults during low power power
> +	 * mode. Because we have two ADV7513 devices on the same bus, we must
> +	 * change both of them away from the defaults so that they do not
> +	 * conflict.
> +	 */
>  	hdmi@3d {
>  		compatible = "adi,adv7513";
> -		reg = <0x3d>;
> +		reg = <0x3d>, <0x2d>, <0x4d>, <0x5d>;
> +		reg-names = "main", "cec", "edid", "packet";
> 
>  		adi,input-depth = <8>;
>  		adi,input-colorspace = "rgb";
> @@ -272,7 +279,8 @@
> 
>  	hdmi@39 {
>  		compatible = "adi,adv7513";
> -		reg = <0x39>;
> +		reg = <0x39>, <0x29>, <0x49>, <0x59>;
> +		reg-names = "main", "cec", "edid", "packet";
> 
>  		adi,input-depth = <8>;
>  		adi,input-colorspace = "rgb";

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
