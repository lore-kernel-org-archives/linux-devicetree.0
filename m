From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v3 05/10] ARM: dts: dove: Rename "sa-sram" node to "sram"
Date: Tue, 08 Oct 2019 11:44:58 +0200
Message-ID: <87imoztvtx.fsf@FE-laptop>
References: <20191002164316.14905-1-krzk@kernel.org> <20191002164316.14905-5-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002164316.14905-5-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>Krzysztof Kozlowski <krzk@kernel.org>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Santosh Shilimkar <ssantosh@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-kernel
List-Id: devicetree@vger.kernel.org

Hi Krzysztof Kozlowski,

> The device node name should reflect generic class of a device so rename
> the "sa-sram" node to "sram".  This will be also in sync with upcoming DT
> schema.  No functional change.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied on mvebu/dt

Thanks,

Gregory

> ---
>  arch/arm/boot/dts/dove.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
> index 2e8a3977219f..3081b04e8c08 100644
> --- a/arch/arm/boot/dts/dove.dtsi
> +++ b/arch/arm/boot/dts/dove.dtsi
> @@ -784,7 +784,7 @@
>  				status = "disabled";
>  			};
>  
> -			crypto_sram: sa-sram@ffffe000 {
> +			crypto_sram: sram@ffffe000 {
>  				compatible = "mmio-sram";
>  				reg = <0xffffe000 0x800>;
>  				clocks = <&gate_clk 15>;
> -- 
> 2.17.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
