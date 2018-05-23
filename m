From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] arcnet: com20020: bindings for smsc com20020
Date: Wed, 23 May 2018 11:49:31 -0500
Message-ID: <20180523164931.GA3635@rob-hp-laptop>
References: <20180517130628.2770-1-andrea.greco.gapmilano@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180517130628.2770-1-andrea.greco.gapmilano@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Andrea Greco <andrea.greco.gapmilano@gmail.com>
Cc: tobin@apporbit.com, Andrea Greco <a.greco@4sigma.it>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, May 17, 2018 at 03:06:26PM +0200, Andrea Greco wrote:
> From: Andrea Greco <a.greco@4sigma.it>
> 
> Add devicetree bindings for smsc com20020
> 
> Signed-off-by: Andrea Greco <a.greco@4sigma.it>
> ---
>  .../devicetree/bindings/net/smsc-com20020.txt       | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/smsc-com20020.txt

One typo, otherwise:

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/net/smsc-com20020.txt b/Documentation/devicetree/bindings/net/smsc-com20020.txt
> new file mode 100644
> index 000000000000..92360b054873
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/smsc-com20020.txt
> @@ -0,0 +1,21 @@
> +SMSC com20020 Arcnet network controller
> +
> +Required propelty:

property

> +- timeout-ns: Arcnet bus timeout, Idle Time (328000 - 20500)
> +- bus-speed-bps: Arcnet bus speed (10000000 - 156250)
> +- smsc,xtal-mhz: External oscillator frequency
> +- smsc,backplane-enabled: Controller use backplane mode
> +- reset-gpios: Chip reset pin
> +- interrupts: Should contain controller interrupt
> +
> +arcnet@28000000 {
> +    compatible = "smsc,com20020";
> +
> +	timeout-ns = <20500>;
> +	bus-speed-bps = <10000000>;
> +	smsc,xtal-mhz = <20>;
> +	smsc,backplane-enabled;
> +
> +	reset-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
> +	interrupts = <&gpio2 10 GPIO_ACTIVE_LOW>;
> +};
> -- 
> 2.14.3
> 
