From: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v2 1/3] mfd: syscon: update Atmel SMC binding doc
Date: Tue, 18 Jul 2017 15:39:27 +0200
Message-ID: <3bf69ada-0bd3-c1db-8a4d-f21c3eb411bf@microchip.com>
References: <20170718132220.25018-1-ludovic.desroches@microchip.com>
 <20170718132220.25018-2-ludovic.desroches@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170718132220.25018-2-ludovic.desroches@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@microchip.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, lee.jones@linaro.org, alexandre.belloni@free-electrons.com, boris.brezillon@free-electrons.com, computersforpeace@gmail.com, romain.izard.pro@gmail.com
List-Id: devicetree@vger.kernel.org

On 18/07/2017 at 15:22, Ludovic Desroches wrote:
> A new compatible string is introduced for SMC on sama5d2 to manage a
> different layout of the registers.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>  Documentation/devicetree/bindings/mfd/atmel-smc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-smc.txt b/Documentation/devicetree/bindings/mfd/atmel-smc.txt
> index 26eeed373934..1103ce2030fb 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-smc.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-smc.txt
> @@ -8,6 +8,7 @@ Required properties:
>  - compatible:		Should be one of the following
>  			"atmel,at91sam9260-smc", "syscon"
>  			"atmel,sama5d3-smc", "syscon"
> +			"atmel,sama5d2-smc", "syscon"
>  - reg:			Contains offset/length value of the SMC memory
>  			region.
>  
> 


-- 
Nicolas Ferre
