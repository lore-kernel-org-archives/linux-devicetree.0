From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v0] arm64: dts: Add poweroff button device node for APM
 X-Gene platform
Date: Thu, 25 Jun 2015 16:09:38 +0100
Message-ID: <20150625150938.GB6844@leverpostej>
References: <1434505312-27977-1-git-send-email-yvo@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1434505312-27977-1-git-send-email-yvo@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Y Vo <yvo@apm.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "arm@kernel.org" <arm@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Phong Vo <pvo@apm.com>, Toan Le <toanle@apm.com>, "patches@apm.com" <patches@apm.com>, Loc Ho <lho@apm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 17, 2015 at 02:41:52AM +0100, Y Vo wrote:
> This patch adds poweroff button device node to support poweroff feature
> on APM X-Gene Mustang platform.
> 
> Signed-off-by: Y Vo <yvo@apm.com>
> ---
>  arch/arm64/boot/dts/apm/apm-mustang.dts |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/apm/apm-mustang.dts b/arch/arm64/boot/dts/apm/apm-mustang.dts
> index 83578e7..67979c8 100644
> --- a/arch/arm64/boot/dts/apm/apm-mustang.dts
> +++ b/arch/arm64/boot/dts/apm/apm-mustang.dts
> @@ -23,6 +23,17 @@
>  		device_type = "memory";
>  		reg = < 0x1 0x00000000 0x0 0x80000000 >; /* Updated by bootloader */
>  	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		apm_ctrl_name = "Power Button";

Huh?

Undocumented, unused, and doesn't follwo the "vendor,property" naming
scheme...

Mark.

> +		btn3 {
> +			label = "EXT_PWR";
> +			linux,code = <116>;
> +			linux,input-type = <0x1>;     /* EV_KEY */
> +			interrupts = <0x0 0x2d 0x1>;
> +		};
> +	};
>  };
>  
>  &pcie0clk {
> -- 
> 1.7.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
