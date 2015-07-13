From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: vf-colibri: define stdout-path property
Date: Mon, 13 Jul 2015 23:10:04 +0800
Message-ID: <20150713151004.GA26642@tiger>
References: <1435910799-11706-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1435910799-11706-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: shawn.guo@linaro.org, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 03, 2015 at 10:06:39AM +0200, Stefan Agner wrote:
> Define Vybrid's UART0, connected to the Colibri pinout UART_A, as
> standard output.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  arch/arm/boot/dts/vf-colibri-eval-v3.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
> index 2cbe663..cb199ae 100644
> --- a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
> +++ b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
> @@ -10,6 +10,7 @@
>  / {
>  	chosen {
>  		bootargs = "console=ttyLP0,115200";
> +		stdout-path = "serial0:115200n8";

With this change, can bootargs just be dropped?

Shawn

>  	};
>  
>  	clk16m: clk16m {
> -- 
> 2.4.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
