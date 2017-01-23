From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 04/18] ARM64: dts: meson-gxbb-p20x: Fix Wifi node name
Date: Mon, 23 Jan 2017 10:50:18 -0600
Message-ID: <20170123165018.w4jkyckyrltfyhz3@rob-hp-laptop>
References: <20170120222118.21476-1-afaerber@suse.de>
 <20170120222118.21476-5-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170120222118.21476-5-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: linux-amlogic@lists.infradead.org, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 20, 2017 at 11:21:04PM +0100, Andreas Färber wrote:
> bcrmf -> brcmf
> 
> Fixes: ab3943fe57a2 ("ARM64: dts: meson-gxbb: Add P20x Wifi SDIO support")
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
> index 4a96e0f6f926..5183c5ce90c6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
> @@ -193,7 +193,7 @@
>  	vmmc-supply = <&vddao_3v3>;
>  	vqmmc-supply = <&vddio_boot>;
>  
> -	brcmf: bcrmf@1 {
> +	brcmf: brcmf@1 {

wifi@1

>  		reg = <1>;
>  		compatible = "brcm,bcm4329-fmac";
>  	};
> -- 
> 2.10.2
> 
