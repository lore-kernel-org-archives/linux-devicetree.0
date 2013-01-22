From: Benoit Cousson <b-cousson@ti.com>
Subject: Re: [PATCH 2/5] ARM: dts: twl6030: Add PWM support
Date: Tue, 22 Jan 2013 11:39:26 +0100
Message-ID: <50FE6C5E.50802@ti.com>
References: <1358519794-13214-1-git-send-email-peter.ujfalusi@ti.com> <1358519794-13214-3-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1358519794-13214-3-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

Just one minor typo here.

On 01/18/2013 03:36 PM, Peter Ujfalusi wrote:
> Enable support for the PWMs and LED as PWM drivers.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  arch/arm/boot/dts/twl6030.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/twl6030.dtsi b/arch/arm/boot/dts/twl6030.dtsi
> index 9996cfc..d9b8b21 100644
> --- a/arch/arm/boot/dts/twl6030.dtsi
> +++ b/arch/arm/boot/dts/twl6030.dtsi
> @@ -91,4 +91,16 @@
>  		compatible = "ti,twl6030-usb";
>  		interrupts = <4>, <10>;
>  	};
> +
> +	twl_pwm: pwm {
> +		/* provides two PWMs (id 0, 1 for PWM1 and PWM2) */
> +		compatible = "ti,twl6030-pwm";
> +		#pwm-cells = <2>;
> +	};
> +
> +	twl_pwmled: pwmled {
> +		/* provides one PWM (id 0 for Charing indicator LED) */

typo: charging.

Regards,
Benoit

> +		compatible = "ti,twl6030-pwmled";
> +		#pwm-cells = <2>;
> +	};
>  };
> 

