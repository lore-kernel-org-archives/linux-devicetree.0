From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] Documentation: devicetree: arm: Add Realtek RTD1295
 bindings
Date: Wed, 22 Feb 2017 10:56:38 -0600
Message-ID: <20170222165638.u5uemzsbldzoytvv@rob-hp-laptop>
References: <20170214033440.18667-1-afaerber@suse.de>
 <20170214033440.18667-3-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170214033440.18667-3-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, service-qoVzM6YEWSw@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 14, 2017 at 04:34:37AM +0100, Andreas Färber wrote:
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>

Commit message?

Also, preferred subject prefix is "dt-bindings: arm: ".

> ---
>  Documentation/devicetree/bindings/arm/realtek.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/realtek.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/realtek.txt b/Documentation/devicetree/bindings/arm/realtek.txt
> new file mode 100644
> index 0000000..cfbee58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/realtek.txt
> @@ -0,0 +1,15 @@
> +Realtek platforms device tree bindings
> +--------------------------------------
> +
> +
> +RTD1295 SoC
> +===========
> +
> +Required root node properties:
> +
> + - compatible :  "realtek,rtd1295"
> +
> +
> +Board compatible strings:
> +
> + - Zidoo X9S: "zidoo,x9s"
> -- 
> 2.10.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
