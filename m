From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH 2/2] arm64: dts: marvell: armada-37xx: Enable emmc on espressobin
Date: Fri, 30 Nov 2018 18:58:38 +0100
Message-ID: <874lbymoq9.fsf@bootlin.com>
References: <20181026115028.193203-1-miyatsu@qq.com>
        <20181026115028.193203-2-miyatsu@qq.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181026115028.193203-2-miyatsu@qq.com> (Ding Tao's message of
        "Fri, 26 Oct 2018 11:50:28 +0000")
Sender: linux-kernel-owner@vger.kernel.org
To: Ding Tao <miyatsu@qq.com>
Cc: jason@lakedaemon.net, andrew@lunn.ch, sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ding,
 
 On ven., oct. 26 2018, Ding Tao <miyatsu@qq.com> wrote:

> The ESPRESSObin board has a emmc interface available on U11, let's
> enable it.


Applied on mvebu/dt64 for now, but what happen if U11 is not populated?

Thanks,

Gregory

>
> Signed-off-by: Ding Tao <miyatsu@qq.com>
> ---
>  .../dts/marvell/armada-3720-espressobin.dts    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
> index 3ab25ad402b9..ee05aabbba88 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
> @@ -60,6 +60,24 @@
>  	cd-gpios = <&gpionb 3 GPIO_ACTIVE_LOW>;
>  	marvell,pad-type = "sd";
>  	vqmmc-supply = <&vcc_sd_reg1>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdio_pins>;
> +	status = "okay";
> +};
> +
> +/* U11 */
> +&sdhci0 {
> +	non-removable;
> +	bus-width = <8>;
> +	mmc-ddr-1_8v;
> +	mmc-hs400-1_8v;
> +	marvell,xenon-emmc;
> +	marvell,xenon-tun-count = <9>;
> +	marvell,pad-type = "fixed-1-8v";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc_pins>;
>  	status = "okay";
>  };
>  
> -- 
> 2.17.1
>
>
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
