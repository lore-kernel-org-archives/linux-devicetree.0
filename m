From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/6] arcnet: com20020: bindings for smsc com20020
Date: Mon, 11 Jun 2018 12:09:29 -0600
Message-ID: <20180611180929.GA28695@rob-hp-laptop>
References: <20180611142705.20849-1-andrea.greco.gapmilano@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180611142705.20849-1-andrea.greco.gapmilano@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrea Greco <andrea.greco.gapmilano@gmail.com>
Cc: davem@davemloft.net, tobin@apporbit.com, Andrea Greco <a.greco@4sigma.it>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 11, 2018 at 04:27:01PM +0200, Andrea Greco wrote:
> From: Andrea Greco <a.greco@4sigma.it>
> 
> Add devicetree bindings for smsc com20020
> 
> Signed-off-by: Andrea Greco <a.greco@4sigma.it>
> ---
>  .../devicetree/bindings/net/smsc-com20020.txt       | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/smsc-com20020.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/smsc-com20020.txt b/Documentation/devicetree/bindings/net/smsc-com20020.txt
> new file mode 100644
> index 000000000000..660a4a751f29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/smsc-com20020.txt
> @@ -0,0 +1,21 @@
> +SMSC com20020 Arcnet network controller
> +
> +Required property:
> +- timeout-ns: Arcnet bus timeout, Idle Time (328000 - 20500)
> +- bus-speed-bps: Arcnet bus speed (10000000 - 156250)
> +- smsc,xtal-mhz: External oscillator frequency
> +- smsc,backplane-enabled: Controller use backplane mode
> +- reset-gpios: Chip reset pin
> +- interrupts: Should contain controller interrupt
> +
> +arcnet@28000000 {
> +	compatible = "smsc,com20020";
> +
> +	timeout-ns = <20500>;
> +	bus-speed-hz = <10000000>;

You have hz here and bps above.

> +	smsc,xtal-mhz = <20>;
> +	smsc,backplane-enabled;
> +
> +	reset-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
> +	interrupts = <&gpio2 10 GPIO_ACTIVE_LOW>;
> +};
> -- 
> 2.14.4
> 
