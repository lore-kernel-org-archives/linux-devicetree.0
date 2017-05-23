From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 8/8] ARM: ux500: Add vendor prefix to tps61052 node
Date: Tue, 23 May 2017 16:41:53 +0100
Message-ID: <20170523154153.kaa5uo2jb5dbmx6f@dell>
References: <20170504052107.18995-1-javier@dowhile0.org>
 <20170504052107.18995-9-javier@dowhile0.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170504052107.18995-9-javier@dowhile0.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, Aaro Koskinen <aaro.koskinen@iki.fi>
List-Id: devicetree@vger.kernel.org

On Thu, 04 May 2017, Javier Martinez Canillas wrote:

> The tps61052 device node doesn't have a vendor prefix
> in its compatible string, fix it by adding one.
> 
> Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Tony Lindgren <tony@atomide.com>

This requires LinusW's Ack.

> ---
> 
> Changes in v6: None
> Changes in v5:
> - Add Rob Herring's Acked-by tag.
> - Add Acked-by: Tony Lindgren <tony@atomide.com>'s Acked-by tag.
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  arch/arm/boot/dts/ste-hrefprev60.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/ste-hrefprev60.dtsi b/arch/arm/boot/dts/ste-hrefprev60.dtsi
> index 5882a2606ac3..3f14b4df69b4 100644
> --- a/arch/arm/boot/dts/ste-hrefprev60.dtsi
> +++ b/arch/arm/boot/dts/ste-hrefprev60.dtsi
> @@ -30,7 +30,7 @@
>  
>  		i2c@80004000 {
>  			tps61052@33 {
> -				compatible = "tps61052";
> +				compatible = "ti,tps61052";
>  				reg = <0x33>;
>  			};
>  

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
