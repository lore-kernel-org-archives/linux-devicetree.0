From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 06/10] arm: dts: mt7623: add subsystem clock controller
 nodes
Date: Thu, 19 Oct 2017 18:31:21 +0200
Message-ID: <a318bdec-e36c-ddd6-93fa-e8646a553b36@gmail.com>
References: <cover.1506908511.git.ryder.lee@mediatek.com>
 <1a6aba8921584fe465bc2138a3aec10c2637f226.1506908511.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1a6aba8921584fe465bc2138a3aec10c2637f226.1506908511.git.ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 10/02/2017 03:54 AM, Ryder Lee wrote:
> This patch adds missing susbsystem clock controllers nodes for MT7623.
> (e.g., mmsys, imgsys, vdecsys and bdpsys)
> 
> Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/mt7623.dtsi | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
> index 0640fb7..a877f9a 100644
> --- a/arch/arm/boot/dts/mt7623.dtsi
> +++ b/arch/arm/boot/dts/mt7623.dtsi
> @@ -661,6 +661,30 @@
>  		status = "disabled";
>  	};
>  
> +	mmsys: syscon@14000000 {
> +		compatible = "mediatek,mt7623-mmsys",
> +			     "mediatek,mt2701-mmsys",
> +			     "syscon";
> +		reg = <0 0x14000000 0 0x1000>;
> +		#clock-cells = <1>;
> +	};

We better wait until we have figured out how to fix the issues we see.
Please resubmit when that's clear.

Same holds for patch 8/10

Thanks,
Matthias

> +
> +	imgsys: syscon@15000000 {
> +		compatible = "mediatek,mt7623-imgsys",
> +			     "mediatek,mt2701-imgsys",
> +			     "syscon";
> +		reg = <0 0x15000000 0 0x1000>;
> +		#clock-cells = <1>;
> +	};
> +
> +	vdecsys: syscon@16000000 {
> +		compatible = "mediatek,mt7623-vdecsys",
> +			     "mediatek,mt2701-vdecsys",
> +			     "syscon";
> +		reg = <0 0x16000000 0 0x1000>;
> +		#clock-cells = <1>;
> +	};
> +
>  	hifsys: syscon@1a000000 {
>  		compatible = "mediatek,mt7623-hifsys",
>  			     "mediatek,mt2701-hifsys",
> @@ -799,4 +823,12 @@
>  		power-domains = <&scpsys MT2701_POWER_DOMAIN_ETH>;
>  		status = "disabled";
>  	};
> +
> +	bdpsys: syscon@1c000000 {
> +		compatible = "mediatek,mt7623-bdpsys",
> +			     "mediatek,mt2701-bdpsys",
> +			     "syscon";
> +		reg = <0 0x1c000000 0 0x1000>;
> +		#clock-cells = <1>;
> +	};
>  };
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
