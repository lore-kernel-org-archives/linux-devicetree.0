From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH 1/7] ARM: stih407: Add DT nodes for for
 PWM
Date: Thu, 19 Jun 2014 09:38:35 +0100
Message-ID: <20140619083835.GA2131@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1403103172-19856-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pwm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1403103172-19856-1-git-send-email-lee.jones@linaro.org>
Sender: linux-pwm-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, kernel@stlinux.com, devicetree@vger.kernel.org, srinivas.kandagatla@gmail.com, thierry.reding@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Lee,

> +		/* SBC PWM Module */
> +		pwm1: pwm@9510000 {
> +			compatible	= "st,sti-pwm";
> +			status		= "disabled";
> +			#pwm-cells	= <2>;
> +			reg		= <0x9510000 0x68>;
> +			pinctrl-names	= "default";
> +		        pinctrl-0	= <&pinctrl_pwm1_chan0_default
> +					&pinctrl_pwm1_chan1_default
> +					&pinctrl_pwm1_chan2_default
> +					&pinctrl_pwm1_chan3_default>;

If you're passing pin config for 4 channels, I think you should also be using the 
'st,pwm-num-chan = <4>' property like the doc example in patch 7.

After that: 
Acked-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter. 

