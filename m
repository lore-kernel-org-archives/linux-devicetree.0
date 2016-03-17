From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 04/18] dt-bindings: irq: arm,versatile-fpga: add
 arm,rps-irq compatible string
Date: Thu, 17 Mar 2016 12:15:07 -0500
Message-ID: <20160317171507.GA31679@rob-hp-laptop>
References: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
 <1457519060-6038-1-git-send-email-narmstrong@baylibre.com>
 <1457519060-6038-5-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457519060-6038-5-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 09, 2016 at 11:24:06AM +0100, Neil Armstrong wrote:
> Under the OX810SE, this same controller is used as "Reference Peripheral
> Specification" Interrupt Controller, so add new compatible string.
> 
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
> index c9cf605..2fe78d5 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
> @@ -6,7 +6,7 @@ controllers are OR:ed together and fed to the CPU tile's IRQ input. Each
>  instance can handle up to 32 interrupts.
>  
>  Required properties:
> -- compatible: "arm,versatile-fpga-irq"
> +- compatible: "arm,versatile-fpga-irq" or "arm,rps-irq"

Use a compatible string that reflects the actual implementation not a 
spec. The current string is a bad example as it already refers to 
multiple implementations.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
