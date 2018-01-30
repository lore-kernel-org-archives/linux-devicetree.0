From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: at91: sama5d4: fix pinctrl compatible string
Date: Tue, 30 Jan 2018 23:21:45 +0100
Message-ID: <20180130222145.GO2809@piout.net>
References: <20180118143847.15309-1-ludovic.desroches@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180118143847.15309-1-ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Santiago Esteban <Santiago.Esteban-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18/01/2018 at 15:38:47 +0100, Ludovic Desroches wrote:
> From: Santiago Esteban <Santiago.Esteban-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> 
> The compatible string is incorrect. Add atmel,sama5d3-pinctrl since
> it's the appropriate compatible string. Remove the
> atmel,at91rm9200-pinctrl compatible string, this fallback is
> useless, there are too many changes.
> 
> Signed-off-by: Santiago Esteban <Santiago.Esteban-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Signed-off-by: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org #v3.18
> ---
>  arch/arm/boot/dts/sama5d4.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
