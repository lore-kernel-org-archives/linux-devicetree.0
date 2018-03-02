From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH RESEND] arm64: dts: hi6220: enable watchdog
Date: Fri, 2 Mar 2018 16:07:02 +0000
Message-ID: <5A9976A6.2070108@hisilicon.com>
References: <1519906727-11135-1-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519906727-11135-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Dmitry Shmidt <dimitrysh@google.com>
List-Id: devicetree@vger.kernel.org

Hi Leo, Dmitry,

On 2018/3/1 12:18, Leo Yan wrote:
> From: Dmitry Shmidt <dimitrysh@google.com>
> 
> This patch is to add watchdog binding for Hi6220 on Hikey board.
> 
> Signed-off-by: Dmitry Shmidt <dimitrysh@google.com>
> ---

Applied into hisilicon dt tree.
Thanks!

BR,
Wei

>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> index 6a180d1..e9d5bb6 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> @@ -817,6 +817,14 @@
>  			pinctrl-1 = <&sdio_pmx_idle &sdio_clk_cfg_idle &sdio_cfg_idle>;
>  		};
>  
> +		watchdog0: watchdog@f8005000 {
> +			compatible = "arm,sp805-wdt", "arm,primecell";
> +			reg = <0x0 0xf8005000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ao_ctrl HI6220_WDT0_PCLK>;
> +			clock-names = "apb_pclk";
> +		};
> +
>  		tsensor: tsensor@0,f7030700 {
>  			compatible = "hisilicon,tsensor";
>  			reg = <0x0 0xf7030700 0x0 0x1000>;
> 
