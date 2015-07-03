From: Eddie Huang <eddie.huang@mediatek.com>
Subject: Re: [PATCH] dts: mt8173-oak: Add da9211 to i2c1
Date: Fri, 3 Jul 2015 10:00:22 +0800
Message-ID: <1435888822.28171.2.camel@mtksdaap41>
References: <1435886953-11258-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435886953-11258-1-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Henry,

You have wrong mail title. Your patch modify mt8173-evb.dts, so your
title should use mt8173-evb instead mt8173-oak. Also, remember remove
change-id next time.Please resend this patch.

On Fri, 2015-07-03 at 09:29 +0800, Henry Chen wrote:
> Add a DA9211 dual-channel BUCK regulator to i2c1.
> This regulator supplies GPU and DVFS1 voltages.
> 
> Change-Id: I61ecc64b29da4913be856f43e0f6f6fa4e58ea7e
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
> This patch based on https://github.com/mbgg/linux-mediatek.git branch/v4.2-next/arm64
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 30 +++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> index d0ab012..7f583bd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> @@ -34,6 +34,36 @@
>  	chosen { };
>  };
>  
> +&i2c1 {
> +	status = "okay";
> +
> +	buck: da9211@68 {
> +		compatible = "dlg,da9211";
> +		reg = <0x68>;
> +
> +		regulators {
> +			da9211_vcpu_reg: BUCKA {
> +				regulator-name = "VBUCKA";
> +				regulator-min-microvolt = < 700000>;
> +				regulator-max-microvolt = <1310000>;
> +				regulator-min-microamp	= <2000000>;
> +				regulator-max-microamp	= <4400000>;
> +				regulator-ramp-delay = <10000>;
> +				regulator-always-on;
> +			};
> +
> +			da9211_vgpu_reg: BUCKB {
> +				regulator-name = "VBUCKB";
> +				regulator-min-microvolt = < 700000>;
> +				regulator-max-microvolt = <1310000>;
> +				regulator-min-microamp	= <2000000>;
> +				regulator-max-microamp	= <3000000>;
> +				regulator-ramp-delay = <10000>;
> +			};
> +		};
> +	};
> +};
> +
>  &uart0 {
>  	status = "okay";
>  };
