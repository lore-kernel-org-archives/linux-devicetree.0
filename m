From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 08/18] arm64: dts: meson-gxl-s905x: Comment typo fix
Date: Mon, 15 May 2017 10:17:22 +0200
Message-ID: <5d794cea-1a4e-f5d1-db5f-928cb081e0a2@baylibre.com>
References: <20170513143337.14278-1-afaerber@suse.de>
 <20170513143337.14278-9-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170513143337.14278-9-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, linux-amlogic@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/13/2017 04:33 PM, Andreas Färber wrote:
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  v1 -> v2: Unchanged
>  
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x.dtsi
> index 0f78d836edaf..3314a0b3dad9 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x.dtsi
> @@ -48,7 +48,7 @@
>  	compatible = "amlogic,s905x", "amlogic,meson-gxl";
>  };
>  
> -/* S905X Only has access to its internal PHY */
> +/* S905X only has access to its internal PHY */
>  &ethmac {
>  	phy-mode = "rmii";
>  	phy-handle = <&internal_phy>;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
