From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 5/5] arm64: dts: rockchip: Fix nanopi4 uSD card detect
Date: Tue, 08 Jan 2019 23:42:50 +0100
Message-ID: <6925511.AQqqGbhmY3@phil>
References: <cover.1546981251.git.robin.murphy@arm.com>
 <83098c7ecc471a77dd89564f5f98fcf30c1ed431.1546981251.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <83098c7ecc471a77dd89564f5f98fcf30c1ed431.1546981251.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 8. Januar 2019, 22:57:27 CET schrieb Robin Murphy:
> For whatever reason, the sdmmc_dectn function isn't working properly
> as-is, and microSD insertion and removal goes unnoticed. Flipping the
> pin into GPIO mode, however, does do the job, so let's just handle it
> that way for now until someone feels inclined to figure out what GRF
> voodoo or otherwise is needed for correct 'native' operation.
> 
> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
> index 9c723038d8f8..2a183a6af150 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
> @@ -505,6 +505,10 @@
>  		sdmmc0_pwr_h: sdmmc0-pwr-h {
>  			rockchip,pins = <0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
> +
> +		sdmmc0_det_l: sdmmc0-det-l {

alphabetically by node-name please,
aka sdmmc0-det-* should be above sdmmc0-pwr-*

If you're respinning the whole series this should be fixed,
otherwise I can also do that when applying.


Heiko

> +			rockchip,pins = <0 RK_PA7 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
>  	};
>  
>  	sdio-pwrseq {
> @@ -563,9 +567,10 @@
>  	bus-width = <4>;
>  	cap-sd-highspeed;
>  	cap-mmc-highspeed;
> +	cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
>  	disable-wp;
>  	pinctrl-names = "default";
> -	pinctrl-0 = <&sdmmc_bus4 &sdmmc_cd &sdmmc_clk &sdmmc_cmd>;
> +	pinctrl-0 = <&sdmmc_bus4 &sdmmc0_det_l &sdmmc_clk &sdmmc_cmd>;
>  	sd-uhs-sdr104;
>  	vmmc-supply = <&vcc3v0_sd>;
>  	vqmmc-supply = <&vcc_sdio>;
> 
