From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 07/18] arm64: dts: meson-gxm-nexbox-a1: Drop UART
 comment
Date: Mon, 15 May 2017 10:17:25 +0200
Message-ID: <cee9af76-7d3c-6a56-9a49-7897a20e09eb@baylibre.com>
References: <20170513143337.14278-1-afaerber@suse.de>
 <20170513143337.14278-8-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170513143337.14278-8-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, linux-amlogic@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/13/2017 04:33 PM, Andreas Färber wrote:
> Product pictures show no DB9 connector, so this seems copy&paste.
> 
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  v1 -> v2: Unchanged
>  
>  arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> index 11b0bf46a95c..920fac10de93 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> @@ -113,7 +113,6 @@
>  	};
>  };
>  
> -/* This UART is brought out to the DB9 connector */
>  &uart_AO {
>  	status = "okay";
>  	pinctrl-0 = <&uart_ao_a_pins>;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
