From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: enable pwm3 as pwm regulator for rk3066a-rayeager board
Date: Thu, 14 Jan 2016 13:41:05 +0100
Message-ID: <2237362.fjXobafQhV@phil>
References: <1452774780-16493-1-git-send-email-andy.yan@rock-chips.com> <1452774956-16621-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452774956-16621-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: naobsd@gmail.com, robh+dt@kernel.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, galak@codeaurora.org, linux-kernel@vger.kernel.org, ijc+devicetree@hellion.org.uk, linux-rockchip@lists.infradead.org, pawel.moll@arm.com, mark.rutland@arm.com, inux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Donnerstag, 14. Januar 2016, 20:35:56 schrieb Andy Yan:
> Rayeager board use pwm3 modulate the vdd_logic voltage, so enable it.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  arch/arm/boot/dts/rk3066a-rayeager.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3066a-rayeager.dts
> b/arch/arm/boot/dts/rk3066a-rayeager.dts index 3d4c104..d17a5b8 100644
> --- a/arch/arm/boot/dts/rk3066a-rayeager.dts
> +++ b/arch/arm/boot/dts/rk3066a-rayeager.dts
> @@ -78,6 +78,18 @@
>  		};
>  	};
> 
> +	pwm_regulator: pwm-regulator {
> +		compatible = "pwm-regulator";
> +		pwms = <&pwm3 0 1000>;
> +		regulator-name = "vdd_logic";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;

I guess this is to make sure it stays at 1.2V at all times, or is the min-
microvolt settings supposed to be lower?


Thanks
Heiko
