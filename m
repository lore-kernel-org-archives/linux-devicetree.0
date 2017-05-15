From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 06/18] arm64: dts: meson-gxl-s905x-khadas-vim: Fix Wifi
 node name
Date: Mon, 15 May 2017 10:17:27 +0200
Message-ID: <71fcfdf4-6311-feba-0d65-13ac251d69e8@baylibre.com>
References: <20170513143337.14278-1-afaerber@suse.de>
 <20170513143337.14278-7-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170513143337.14278-7-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, linux-amlogic@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/13/2017 04:33 PM, Andreas Färber wrote:
> bcrmf -> brcmf -> wifi
> 
> Fixes: e15d2774b8c0 ("ARM64: dts: meson-gxl: add support for the Khadas VIM board")
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  v2: New
>  
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> index 3c8b0b51ef27..6a81f0168da5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> @@ -95,7 +95,7 @@
>  };
>  
>  &sd_emmc_a {
> -	brcmf: bcrmf@1 {
> +	brcmf: wifi@1 {
>  		reg = <1>;
>  		compatible = "brcm,bcm4329-fmac";
>  	};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
