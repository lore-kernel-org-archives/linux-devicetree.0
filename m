From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: blanche: add support for general purpose LEDs
Date: Tue, 23 Aug 2016 09:39:20 +0200
Message-ID: <20160823073920.GI14998@verge.net.au>
References: <5383928.8UnDsUpmkz@wasted.cogentembedded.com>
 <1529754.UBcqZ7GKj7@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1529754.UBcqZ7GKj7@wasted.cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 22, 2016 at 11:39:30PM +0300, Sergei Shtylyov wrote:
> Add support for the general purpose LEDs on the Blanche board.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'renesas-devel-20160822-v4.8-rc3' of Simon Horman's
> 'renesas.git' repo plus the SDHI0/DU patches posted earlier.
> 
>  arch/arm/boot/dts/r8a7792-blanche.dts |   21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> Index: renesas/arch/arm/boot/dts/r8a7792-blanche.dts
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
> +++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
> @@ -159,6 +159,27 @@
>  		};
>  	};
>  
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led17 {
> +			gpios = <&gpio10 10 GPIO_ACTIVE_HIGH>;
> +			label = "LED17";

I am unclear of the motivation for using the label property when
its value is so similar to the name of the node.

The reason I noticed this is that it appears to differ from led nodes
for other Renesas ARM SoCs. I'm not opposed to using the label property
if there is some value to it. But I would prefer to use it consistently.
And I'd prefer not to add it to all the other SoCs unless there is a reason
to.

> +		};
> +		led18 {
> +			gpios = <&gpio10 11 GPIO_ACTIVE_HIGH>;
> +			label = "LED18";
> +		};
> +		led19 {
> +			gpios = <&gpio10 12 GPIO_ACTIVE_HIGH>;
> +			label = "LED19";
> +		};
> +		led20 {
> +			gpios = <&gpio10 23 GPIO_ACTIVE_HIGH>;
> +			label = "LED20";
> +		};
> +	};
> +
>  	vcc_sdhi0: regulator-vcc-sdhi0 {
>  		compatible = "regulator-fixed";
>  
> 
