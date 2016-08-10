From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 2/4] ARM: dts: da850: Add an aemif node
Date: Wed, 10 Aug 2016 13:18:51 +0530
Message-ID: <57AADC63.90405@ti.com>
References: <20160809171518.22690-1-kbeldan@baylibre.com>
 <20160809171518.22690-3-kbeldan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160809171518.22690-3-kbeldan@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Karl Beldan <kbeldan@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Karl Beldan <karl.beldan+oss@gmail.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 09 August 2016 10:45 PM, Karl Beldan wrote:
> Currently the davinci da8xx boards use the mach-davinci aemif code.
> Instantiating an aemif node into the DT allows to use the ti-aemif
> memory driver and is another step to better DT support.
> Also it will allow to properly pass the emif timings via DT.
> 
> Signed-off-by: Karl Beldan <kbeldan@baylibre.com>
> ---
>  arch/arm/boot/dts/da850.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index bc10e7e..f62928c 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -411,6 +411,16 @@
>  			dma-names = "tx", "rx";
>  		};
>  	};
> +	aemif: aemif@68000000 {
> +		compatible = "ti,da850-aemif";
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +
> +		reg = <0x68000000 0x00008000>;
> +		ranges = <0 0 0x60000000 0x08000000
> +			  1 0 0x68000000 0x00008000>;
> +		status = "disabled";
> +	};
>  	nand_cs3@62000000 {
>  		compatible = "ti,davinci-nand";
>  		reg = <0x62000000 0x807ff

The nand node should be part of aemif node like it is done for keystone
boards.

Regards,
Sekhar
