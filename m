From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] DT: arm64: msm8916: add all SPI DT nodes
Date: Wed, 18 Mar 2015 12:26:43 +0000
Message-ID: <55096F03.9060101@linaro.org>
References: <1426609532-11996-1-git-send-email-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426609532-11996-1-git-send-email-stanimir.varbanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Kumar Gala <galak@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 17/03/15 16:25, Stanimir Varbanov wrote:
> +
> +			spi4_sleep: spi4_sleep {
> +				pinmux {
> +					function = "gpio";
> +					pins = "gpio12", "gpio13", "gpio14", "gpio15";
> +	
....

> +
> +			spi5_sleep: spi4_sleep {
Will result in Duplicate node name error for "spi4_sleep"

> +				pinmux {
> +					function = "gpio";
> +					pins = "gpio16", "gpio17", "gpio18", "gpio19";
> +				};
> +				pinconf {
> +					pins = "gpio16", "gpio17", "gpio18", "gpio19";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
