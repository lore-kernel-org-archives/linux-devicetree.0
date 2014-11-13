From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: at91: Add Special Function Registers binding
 documentation
Date: Thu, 13 Nov 2014 10:48:03 +0100
Message-ID: <20141113104803.179a7529@bbrezillon>
References: <1415632471-14672-1-git-send-email-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415632471-14672-1-git-send-email-alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 10 Nov 2014 16:14:29 +0100
Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> The special function registers gather some registers that allow to tweak
> features provided by IPs controlled through another register range.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Once you've fixed your dtsi you can add my

Acked-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

on the whole series.

> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.txt b/Documentation/devicetree/bindings/arm/atmel-at91.txt
> index 562cda9d86d9..a6427de45785 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-at91.txt
> +++ b/Documentation/devicetree/bindings/arm/atmel-at91.txt
> @@ -136,3 +136,20 @@ Example:
>  		compatible = "atmel,at91sam9260-rstc";
>  		reg = <0xfffffd00 0x10>;
>  	};
> +
> +Special Function Registers (SFR)
> +
> +Special Function Registers (SFR) manage specific aspects of the integrated
> +memory, bridge implementations, processor and other functionality not controlled
> +elsewhere.
> +
> +required properties:
> +- compatible: Should be "atmel,<chip>-sfr", "syscon".
> +  <chip> can be "at91sam9260", "at91sam9rl" or "at91sam9x5".
> +- reg: Should contain registers location and length
> +
> +	sfr@f0038000 {
> +		compatible = "atmel,sama5d3-sfr", "syscon";
> +		reg = <0xf0038000 0x4000>;
> +	};
> +



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
