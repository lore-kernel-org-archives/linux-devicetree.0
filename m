From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 3/5] [RFT] ARM: dts: wheat: Fix ADV7513 address usage
Date: Mon, 12 Feb 2018 19:24:22 +0100
Message-ID: <bc0dfd28-652a-80e7-a08b-6909b0e34883@metafoo.de>
References: <1518459117-16733-1-git-send-email-kbingham@kernel.org>
 <1518459117-16733-4-git-send-email-kbingham@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518459117-16733-4-git-send-email-kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kieran Bingham <kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Jean-Michel Hautbois <jean-michel.hautbois-B+Q8N6RmIDZBDgjK7y7TUQ@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/12/2018 07:11 PM, Kieran Bingham wrote:
[...]
> +	/*
> +	 * The adv75xx resets its addresses to defaults during low power power
> +	 * mode. Because we have two ADV7513 devices on the same bus, we must
> +	 * change both of them away from the defaults so that they do not
> +	 * conflict.
> +	 */
>  	hdmi@3d {
>  		compatible = "adi,adv7513";
> -		reg = <0x3d>;
> +		reg = <0x3d 0x2d 0x4d, 0x5d>;

To have the correct semantics this should be:
		reg = <0x3d>, <0x2d>, <0x4d>, <0x5d>;

It is a set of 4 single cell addresses. The other thing is a single 4 cell
address. It will get compiled to the same bytes, but the DT tools should
complain about it, because it doesn't match #address-cells.

> +		reg-names = "main", "cec", "edid", "packet";
>  
>  		adi,input-depth = <8>;
>  		adi,input-colorspace = "rgb";
> @@ -272,7 +279,8 @@
>  
>  	hdmi@39 {
>  		compatible = "adi,adv7513";
> -		reg = <0x39>;
> +		reg = <0x39 0x29 0x49, 0x59>;

Same here.

> +		reg-names = "main", "cec", "edid", "packet";
>  
>  		adi,input-depth = <8>;
>  		adi,input-colorspace = "rgb";
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
