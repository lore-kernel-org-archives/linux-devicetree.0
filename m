From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 11/14] ARM: dts: rockchip: add saradc support for rv1108
Date: Tue, 01 Aug 2017 01:11:31 +0200
Message-ID: <15353999.IRu6p5GgJC@phil>
References: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com> <1501496359-22020-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501496359-22020-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Montag, 31. Juli 2017, 18:19:19 CEST schrieb Andy Yan:
> Add saradc device tree node for rv1108
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  arch/arm/boot/dts/rv1108.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
> index 1fc467e..958fecd 100644
> --- a/arch/arm/boot/dts/rv1108.dtsi
> +++ b/arch/arm/boot/dts/rv1108.dtsi
> @@ -275,6 +275,18 @@
>  		status = "disabled";
>  	};
>  
> +	adc: adc@1038c000 {
> +		compatible = "rockchip,rk3399-saradc";

you should amend the binding txt to make this something like
compatible = "rockchip,rv1108-saradc", "rockchip,rk3399-saradc"

See for example the bindings/mmc/rockchip-dw-mshc.txt as inspiration.

Heiko
