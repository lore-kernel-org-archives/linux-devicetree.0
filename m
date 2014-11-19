From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH 5/6] ARM: at91/dt: add trng node
Date: Wed, 19 Nov 2014 16:57:56 +0100
Message-ID: <546CBE04.1000705@atmel.com>
References: <1412093987-30241-1-git-send-email-boris.brezillon@free-electrons.com> <1412093987-30241-6-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412093987-30241-6-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Peter Korsgaard <jacmet@sunsite.dk>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 30/09/2014 18:19, Boris Brezillon :
> Add a DT node for the TRNG (True Random Number Generator) block.
> 
> Keep this block enabled as it does not depend on any external connection,
> and thus should be available on all boards.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

For patches 2 to 5, you can add my:
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

while re-sending a series. Maybe add linux-crypto and the "HARDWARE
RANDOM NUMBER GENERATOR CORE" guys to the CC list.

Bye,

> ---
>  arch/arm/boot/dts/at91sam9g45.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/at91sam9g45.dtsi b/arch/arm/boot/dts/at91sam9g45.dtsi
> index 932a669..790c890 100644
> --- a/arch/arm/boot/dts/at91sam9g45.dtsi
> +++ b/arch/arm/boot/dts/at91sam9g45.dtsi
> @@ -934,6 +934,13 @@
>  				status = "disabled";
>  			};
>  
> +			trng@fffcc000 {
> +				compatible = "atmel,at91sam9g45-trng";
> +				reg = <0xfffcc000 0x4000>;
> +				interrupts = <6 IRQ_TYPE_LEVEL_HIGH 0>;
> +				clocks = <&trng_clk>;
> +			};
> +
>  			i2c0: i2c@fff84000 {
>  				compatible = "atmel,at91sam9g10-i2c";
>  				reg = <0xfff84000 0x100>;
> 


-- 
Nicolas Ferre
