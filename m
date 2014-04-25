From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH v5 3/9] dt: exynos5250: Enable support for generic USB
 DRD phy
Date: Fri, 25 Apr 2014 12:01:01 +0530
Message-ID: <535A0125.9020207@linaro.org>
References: <1398263451-18023-1-git-send-email-gautam.vivek@samsung.com> <1398263451-18023-4-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1398263451-18023-4-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, gregkh@linuxfoundation.org, t.figa@samsung.com, jg1.han@samsung.com, linux-kernel@vger.kernel.org, balbi@ti.com, robh+dt@kernel.org, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 04/23/2014 08:00 PM, Vivek Gautam wrote:
> Add device tree node for new usbdrd-phy driver, which
> is based on generic phy framework.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |   10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 3742331..d4254c0 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -551,6 +551,16 @@
>  		};
>  	};
>  
> +	usbdrd_phy: phy@12100000 {
> +		compatible = "samsung,exynos5250-usbdrd-phy";
> +		reg = <0x12100000 0x100>;
> +		clocks = <&clock CLK_USB3>, <&clock CLK_FIN_PLL>;
> +		clock-names = "phy", "ref";
> +		samsung,pmu-syscon = <&pmu_system_controller>;

Replace samsung,pmu-syscon by samsung,syscon-phandle ?

> +		samsung,pmu-offset = <0x704>;
> +		#phy-cells = <1>;
> +	};
> +
>  	usb@12110000 {
>  		compatible = "samsung,exynos4210-ehci";
>  		reg = <0x12110000 0x100>;
> 


-- 
Tushar Behera
