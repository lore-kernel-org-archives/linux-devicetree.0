From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 2/2] ARM: Exynos5250: Enabling USB 3.0 phy for samsung-usbphy
 driver
Date: Wed, 19 Dec 2012 00:32:35 +0100
Message-ID: <50D0FD13.5060508@gmail.com>
References: <1355845182-14104-1-git-send-email-gautam.vivek@samsung.com> <1355845182-14104-3-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1355845182-14104-3-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, thomas.abraham@linaro.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, p.paneri@samsung.com
List-Id: devicetree@vger.kernel.org

On 12/18/2012 04:39 PM, Vivek Gautam wrote:
> Adding base address information required for enabling
> USB 3.0 DRD phy on exynos5250 SOC.
>
> Signed-off-by: Vivek Gautam<gautam.vivek@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5250.dtsi |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index bbdb2c2..07b7477 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -316,7 +316,8 @@
>
>   	usbphy@12130000 {
>   		compatible = "samsung,exynos5250-usbphy";
> -		reg =<0x12130000 0x100>;
> +		reg =<0x12130000 0x100>,
> +		<0x12100000 0x100>;

Doesn't this second memory region mean distinct PHY controller device ?
Why separate usbphy node can't/shouldn't be created for it ?

>   		samsung,usb-phyhandle =<&phy_h0&phy_h1&phy_h2>;
>   		samsung,enable-mask =<1>;
>   	};
