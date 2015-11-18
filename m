From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 1/5] ARM: dts: rockchip: rk3288-veyron: rename pinctrl
 node reboot to reset
Date: Wed, 18 Nov 2015 17:18:33 +0300
Message-ID: <564C88B9.3060109@cogentembedded.com>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
 <1447840246-19744-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447840246-19744-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>, heiko@sntech.de, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@linaro.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, benchan@google.com, sjg@chromium.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, galak@codeaurora.org, treding@nvidia.com, linux-arm-kernel@lists.infradead.org, wxt@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hello.

On 11/18/2015 12:50 PM, Andy Yan wrote:

> rename pinctrl node reboot to reset to match it's lable name

    Label? BTW, I'm not seeing it on this node...

> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>
> ---
>
> Changes in v3:
>   - rename a pinctrl node in rk3288-veyron, the original name will be
>     used in the incoming reboot notifier driver
>
> Changes in v2: None
>
>   arch/arm/boot/dts/rk3288-veyron.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
> index 2fa7a0d..292aaaf 100644
> --- a/arch/arm/boot/dts/rk3288-veyron.dtsi
> +++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
> @@ -495,7 +495,7 @@
>   		};
>   	};
>
> -	reboot {
> +	reset {
>   		ap_warm_reset_h: ap-warm-reset-h {
>   			rockchip,pins = <RK_GPIO0 13 RK_FUNC_GPIO &pcfg_pull_none>;
>   		};

MBR, Sergei
