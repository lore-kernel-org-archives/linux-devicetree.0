From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] drivers/misc: atmel-ssc: document clock properties
Date: Thu, 19 Dec 2013 16:53:47 +0100
Message-ID: <52B3168B.10004@atmel.com>
References: <1387292507-6606-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1387292507-6606-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris BREZILLON <b.brezillon@overkiz.com>, Rob Landley <rob@landley.net>, Mark Brown <broonie@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 17/12/2013 16:01, Boris BREZILLON :
> Document the clock properties required by the atmel-ssc driver.
> 
> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

> ---
>  .../devicetree/bindings/misc/atmel-ssc.txt         |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/atmel-ssc.txt b/Documentation/devicetree/bindings/misc/atmel-ssc.txt
> index a45ae08..60960b2 100644
> --- a/Documentation/devicetree/bindings/misc/atmel-ssc.txt
> +++ b/Documentation/devicetree/bindings/misc/atmel-ssc.txt
> @@ -6,6 +6,9 @@ Required properties:
>  	- atmel,at91sam9g45-ssc: support dma transfer
>  - reg: Should contain SSC registers location and length
>  - interrupts: Should contain SSC interrupt
> +- clock-names: tuple listing input clock names.
> +	Required elements: "pclk"
> +- clocks: phandles to input clocks.
>  
>  
>  Required properties for devices compatible with "atmel,at91sam9g45-ssc":
> @@ -20,6 +23,8 @@ ssc0: ssc@fffbc000 {
>  	compatible = "atmel,at91rm9200-ssc";
>  	reg = <0xfffbc000 0x4000>;
>  	interrupts = <14 4 5>;
> +	clocks = <&ssc0_clk>;
> +	clock-names = "pclk";
>  };
>  
>  - DMA transfer:
> 


-- 
Nicolas Ferre
