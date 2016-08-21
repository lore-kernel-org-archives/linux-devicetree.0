From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 1/3] dt-bindings: auxadc: Add binding document for
 Mediatek auxadc.
Date: Sun, 21 Aug 2016 19:54:00 +0100
Message-ID: <eb2d9448-5b6e-9ff7-5287-de35fb73d338@kernel.org>
References: <1471504297-26947-1-git-send-email-zhiyong.tao@mediatek.com>
 <1471504297-26947-2-git-send-email-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471504297-26947-2-git-send-email-zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, liguo.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, dawei.chien-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 18/08/16 08:11, Zhiyong Tao wrote:
> The commit adds the device tree binding documentation for the mediatek
> auxadc found on Mediatek MT2701.
> Thermal gets auxadc sample data by iio device.
> So the commit changes auxadc device tree binding documentation from
> /soc/mediatek/auxadc.txt to /iio/adc/mt6577_auxadc.txt.
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Applied to the togreg branch of iio.git.

Thanks,

Jonathan
> ---
>  .../auxadc.txt => iio/adc/mt6577_auxadc.txt}       |   18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>  rename Documentation/devicetree/bindings/{soc/mediatek/auxadc.txt => iio/adc/mt6577_auxadc.txt} (46%)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/auxadc.txt b/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> similarity index 46%
> rename from Documentation/devicetree/bindings/soc/mediatek/auxadc.txt
> rename to Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> index bdb7829..68c45cb 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/auxadc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> @@ -1,4 +1,4 @@
> -MediaTek AUXADC
> +* Mediatek AUXADC - Analog to Digital Converter on Mediatek mobile soc (mt65xx/mt81xx/mt27xx)
>  ===============
>  
>  The Auxiliary Analog/Digital Converter (AUXADC) is an ADC found
> @@ -10,12 +10,20 @@ Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
>  for the Thermal Controller which holds a phandle to the AUXADC.
>  
>  Required properties:
> -- compatible: Must be "mediatek,mt8173-auxadc"
> -- reg: Address range of the AUXADC unit
> +  - compatible: Should be one of:
> +    - "mediatek,mt2701-auxadc": For MT2701 family of SoCs
> +    - "mediatek,mt8173-auxadc": For MT8173 family of SoCs
> +  - reg: Address range of the AUXADC unit.
> +  - clocks: Should contain a clock specifier for each entry in clock-names
> +  - clock-names: Should contain "main".
> +  - #io-channel-cells: Should be 1, see ../iio-bindings.txt
>  
>  Example:
>  
> -auxadc: auxadc@11001000 {
> -	compatible = "mediatek,mt8173-auxadc";
> +auxadc: adc@11001000 {
> +	compatible = "mediatek,mt2701-auxadc";
>  	reg = <0 0x11001000 0 0x1000>;
> +	clocks = <&pericfg CLK_PERI_AUXADC>;
> +	clock-names = "main";
> +	#io-channel-cells = <1>;
>  };
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
