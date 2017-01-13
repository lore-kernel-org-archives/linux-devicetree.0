From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] arm: dts: mt2701: add nor flash node
Date: Fri, 13 Jan 2017 13:49:07 +0100
Message-ID: <967e01c2-ebb2-882e-9342-873f19d59cb9@gmail.com>
References: <1484291609-20195-1-git-send-email-guochun.mao@mediatek.com>
 <1484291609-20195-3-git-send-email-guochun.mao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1484291609-20195-3-git-send-email-guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/13/2017 08:13 AM, Guochun Mao wrote:
> Add Mediatek nor flash node.
> 
> Signed-off-by: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/mt2701-evb.dts |   25 +++++++++++++++++++++++++
>  arch/arm/boot/dts/mt2701.dtsi    |   12 ++++++++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/mt2701-evb.dts b/arch/arm/boot/dts/mt2701-evb.dts
> index 082ca88..85e5ae8 100644
> --- a/arch/arm/boot/dts/mt2701-evb.dts
> +++ b/arch/arm/boot/dts/mt2701-evb.dts
> @@ -24,6 +24,31 @@
>  	};
>  };
>  
> +&nor_flash {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&nor_pins_default>;
> +	status = "okay";
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +	};
> +};
> +
> +&pio {
> +	nor_pins_default: nor {
> +		pins1 {
> +			pinmux = <MT2701_PIN_240_EXT_XCS__FUNC_EXT_XCS>,
> +				 <MT2701_PIN_241_EXT_SCK__FUNC_EXT_SCK>,
> +				 <MT2701_PIN_239_EXT_SDIO0__FUNC_EXT_SDIO0>,
> +				 <MT2701_PIN_238_EXT_SDIO1__FUNC_EXT_SDIO1>,
> +				 <MT2701_PIN_237_EXT_SDIO2__FUNC_EXT_SDIO2>,
> +				 <MT2701_PIN_236_EXT_SDIO3__FUNC_EXT_SDIO3>;
> +			drive-strength = <MTK_DRIVE_4mA>;
> +			bias-pull-up;
> +		};
> +	};
> +};
> +
>  &uart0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
> index bdf8954..1eefce4 100644
> --- a/arch/arm/boot/dts/mt2701.dtsi
> +++ b/arch/arm/boot/dts/mt2701.dtsi
> @@ -227,6 +227,18 @@
>  		status = "disabled";
>  	};
>  
> +	nor_flash: spi@11014000 {
> +		compatible = "mediatek,mt2701-nor",
> +			     "mediatek,mt8173-nor";



Reviewed-by: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

-- 
Best regards,
Marek Vasut
