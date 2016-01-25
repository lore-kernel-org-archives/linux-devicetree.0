From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM64: rk3368: add tuning clk for emmc and sdmmc
Date: Mon, 25 Jan 2016 11:32:51 +0100
Message-ID: <8282572.0k5rjtDfQ3@diego>
References: <1453707223-28855-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453707223-28855-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

Am Montag, 25. Januar 2016, 15:33:43 schrieb Shawn Lin:
> Add tuning clk for emmc and sdmmc, otherwise I get
> the following failure while enabling mmc-hs200-1_8v.
> 
> dwmmc_rockchip ff0f0000.dwmmc: Tuning clock (sample_clk) not defined.
> mmc0: tuning execution failed
> mmc0: error -5 whilst initialising MMC card
> 
> With it
> dwmmc_rockchip ff0f0000.dwmmc: Successfully tuned phase to 170
> mmc0: new HS200 MMC card at address 0001
> mmcblk0: mmc0:0001 M8G1GC 7.28 GiB
> 
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

applied to my dts64 branch for 4.6

I've adapted the subject to
	arm64: dts: rockchip: add rk3368 tuning clk for emmc and sdmmc
to follow the format used there (it doesn't seem 100% consistent between socs)


>  		clock-freq-min-max = <400000 150000000>;
>  		clocks = <&cru HCLK_EMMC>, <&cru SCLK_EMMC>;
>  		clock-names = "biu", "ciu";
> +		clocks = <&cru HCLK_EMMC>, <&cru SCLK_EMMC>,
> +			 <&cru SCLK_EMMC_DRV>, <&cru SCLK_EMMC_SAMPLE>;
> +		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
>  		fifo-depth = <0x100>;
>  		interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
>  		status = "disabled";

I've also removed the duplicate clock entry here ;-)


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
