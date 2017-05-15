From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 05/18] arm64: dts: meson-gx-p23x-q20x: Fix Wifi node
 name
Date: Mon, 15 May 2017 10:17:29 +0200
Message-ID: <7398fa63-6aad-8924-4658-0e2444de2bd8@baylibre.com>
References: <20170513143337.14278-1-afaerber@suse.de>
 <20170513143337.14278-6-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170513143337.14278-6-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, linux-amlogic@lists.infradead.org
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/13/2017 04:33 PM, Andreas Färber wrote:
> bcrmf -> brcmf -> wifi
> 
> Fixes: bb51b5350d2f ("ARM64: dts: Add support for Meson GXM")
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  v1 -> v2:
>  * Renamed node brmcf -> wifi (Rob)
>  
>  arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
> index a84e27622639..25eed18a7439 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
> @@ -154,7 +154,7 @@
>  	vmmc-supply = <&vddao_3v3>;
>  	vqmmc-supply = <&vddio_boot>;
>  
> -	brcmf: bcrmf@1 {
> +	brcmf: wifi@1 {
>  		reg = <1>;
>  		compatible = "brcm,bcm4329-fmac";
>  	};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
