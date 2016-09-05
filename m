From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v5 1/4] arm64: dts: h3ulcb: enable GPIO leds
Date: Mon, 5 Sep 2016 14:26:56 +0200
Message-ID: <20160905122656.GH24256@verge.net.au>
References: <1472833419-26139-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472833488-26184-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1472833488-26184-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 02, 2016 at 07:24:48PM +0300, Vladimir Barinov wrote:
> This supports GPIO leds on H3ULCB board
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes in version 3:
> - initially added
> Changes in version 4:
> - removed led4 in favor of gpio-keys
> - added label
> Changes in version 5:
> - nothing
> 
>  arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> index fb694b8..3329f78 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> @@ -31,6 +31,19 @@
>  		/* first 128MB is reserved for secure area. */
>  		reg = <0x0 0x48000000 0x0 0x38000000>;
>  	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led5 {
> +			label = "LED5";
> +			gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
> +		};
> +		led6 {
> +			label = "LED6";
> +			gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
>  };

Please remove the label properties.
