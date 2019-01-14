From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v2] arm64/hisilicon: fix SDcard detection
Date: Mon, 14 Jan 2019 16:36:38 +0800
Message-ID: <20190114083638.GA12459@leoy-ThinkPad-X240s>
References: <1547454274-1674-1-git-send-email-vincent.guittot@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547454274-1674-1-git-send-email-vincent.guittot@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: xuwei5@hisilicon.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Vincent,

On Mon, Jan 14, 2019 at 09:24:34AM +0100, Vincent Guittot wrote:
> The SDcard detection of hikey960 is active low so cd-inverted is wrong.
> Instead of adding cd-inverted, we should better set correctly cd-gpios
> to use GPIO_ACTIVE_LOW.

Just remind, usually ARM maintainer has requirement for subject as:
'arm64: dts: hikey960: xxxx'.

> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
> 
> SD card detection was not working on v5.0-rc1 but patch
> https://marc.info/?l=linux-mmc&m=154637189021211&w=2 makes it work.
> Nevertheles, latest changes in of_mmc_detection makes possible to have 
> a correct DT config.
> 
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> index 71bfe41..dc314e7 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> @@ -665,8 +665,7 @@
>  	sd-uhs-sdr50;
>  	sd-uhs-sdr104;
>  	disable-wp;
> -	cd-inverted;
> -	cd-gpios = <&gpio25 3 0>;
> +	cd-gpios = <&gpio25 3 GPIO_ACTIVE_LOW>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&sd_pmx_func
>  		     &sd_clk_cfg_func
> -- 
> 2.7.4
> 
