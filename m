From: Scott Branden <scott.branden@broadcom.com>
Subject: Re: [PATCH 2/2] ARM: dts: Add the PWM node to Cygnus
Date: Thu, 31 Aug 2017 13:10:18 -0700
Message-ID: <d0f4b326-9efb-5dd2-d7fb-5ccd84f713ba@broadcom.com>
References: <20170831185416.8181-1-eric@anholt.net>
 <20170831185416.8181-2-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170831185416.8181-2-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

pwm node is correct.


On 17-08-31 11:54 AM, Eric Anholt wrote:
> This is connected up to the backlight on 911360_entphn, which we'll
> need for a panel driver.  For now, leave the node disabled in the
> shared dtsi.
>
> Signed-off-by: Eric Anholt <eric@anholt.net>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   arch/arm/boot/dts/bcm-cygnus.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
> index 74f73ff24aec..b9a654d733ae 100644
> --- a/arch/arm/boot/dts/bcm-cygnus.dtsi
> +++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
> @@ -585,6 +585,14 @@
>   			status = "disabled";
>   		};
>   
> +		pwm: pwm@180aa500 {
> +			compatible = "brcm,kona-pwm";
> +			reg = <0x180aa500 0xc4>;
> +			#pwm-cells = <3>;
> +			clocks = <&asiu_clks BCM_CYGNUS_ASIU_PWM_CLK>;
> +			status = "disabled";
> +		};
> +
>   		keypad: keypad@180ac000 {
>   			compatible = "brcm,bcm-keypad";
>   			reg = <0x180ac000 0x14c>;
