From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] spi/atmel: document clock properties
Date: Thu, 19 Dec 2013 16:53:03 +0100
Message-ID: <52B3165F.8090206@atmel.com>
References: <1387278095-5118-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1387278095-5118-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris BREZILLON <b.brezillon@overkiz.com>, Rob Landley <rob@landley.net>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Mark Brown <broonie@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 17/12/2013 12:01, Boris BREZILLON :
> Document the clock properties required by the spi-atmel driver.
> 
> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

> ---
>  .../devicetree/bindings/spi/spi_atmel.txt          |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi_atmel.txt b/Documentation/devicetree/bindings/spi/spi_atmel.txt
> index 07e04cd..4f8184d 100644
> --- a/Documentation/devicetree/bindings/spi/spi_atmel.txt
> +++ b/Documentation/devicetree/bindings/spi/spi_atmel.txt
> @@ -5,6 +5,9 @@ Required properties:
>  - reg: Address and length of the register set for the device
>  - interrupts: Should contain spi interrupt
>  - cs-gpios: chipselects
> +- clock-names: tuple listing input clock names.
> +	Required elements: "spi_clk"
> +- clocks: phandles to input clocks.
>  
>  Example:
>  
> @@ -14,6 +17,8 @@ spi1: spi@fffcc000 {
>  	interrupts = <13 4 5>;
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> +	clocks = <&spi1_clk>;
> +	clock-names = "spi_clk";
>  	cs-gpios = <&pioB 3 0>;
>  	status = "okay";
>  
> 


-- 
Nicolas Ferre
