From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] devicetree: Add vendor prefix for Shenzhen
 Sunchip Technology Co., Ltd
Date: Tue, 16 Aug 2016 07:56:24 -0500
Message-ID: <20160816125624.GA20716@rob-hp-laptop>
References: <20160812235312.GB10557@vip.cybercity.dk>
 <bae6ad6c04f7567b224e008ab27b32d2dac1d9c1.1471125083.git.ccc94453@vip.cybercity.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <bae6ad6c04f7567b224e008ab27b32d2dac1d9c1.1471125083.git.ccc94453-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rask Ingemann Lambertsen <ccc94453-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 11, 2016 at 10:11:51PM +0200, Rask Ingemann Lambertsen wrote:
> Shenzhen Sunchip Technology Co., Ltd produces TV boxes and TV dongles,
> some of which are sold under other brands. Website:
> <URL:http://www.sunchip-tech.com/>
> 
> Signed-off-by: Rask Ingemann Lambertsen <ccc94453-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org>
> ---
> Changes in v2:
> No patch changes, but added CC to the ARM kernel mailing list.
> 
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 1992aa9..fbad2cea 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -256,6 +256,7 @@ ste	ST-Ericsson
>  stericsson	ST-Ericsson
>  syna	Synaptics Inc.
>  synology	Synology, Inc.
> +sunchip	Shenzhen Sunchip Technology Co., Ltd
>  SUNW	Sun Microsystems, Inc

These are not in alphabetical order. Maybe someone thought uppercase 
should be separate, but I don't. So please fix the ordering here moving 
SUNW before syna.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
