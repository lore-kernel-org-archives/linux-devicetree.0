From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 03/11] dt-bindings: memory: atmel-ebi: add sam9x60
 compatible
Date: Wed, 13 Feb 2019 11:53:25 +0100
Message-ID: <20190213105325.GK10129@piout.net>
References: <20190213085930.31578-1-tudor.ambarus@microchip.com>
 <20190213085930.31578-4-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190213085930.31578-4-tudor.ambarus@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tudor.Ambarus@microchip.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com, dwmw2@infradead.org, computersforpeace@gmail.com, bbrezillon@kernel.org, marek.vasut@gmail.com, richard@nod.at, miquel.raynal@bootlin.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 13/02/2019 08:59:52+0000, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Add compatibility string for the sam9x60 EBI.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt b/Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt
> index 9bb5f57e2066..94bf7896a688 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt
> @@ -15,6 +15,7 @@ Required properties:
>  			"atmel,at91sam9g45-ebi"
>  			"atmel,at91sam9x5-ebi"
>  			"atmel,sama5d3-ebi"
> +			"microchip,sam9x60-ebi"
>  
>  - reg:			Contains offset/length value for EBI memory mapping.
>  			This property might contain several entries if the EBI
> -- 
> 2.9.5
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
