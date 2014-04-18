From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH 5/8] ARM: at91: sama5d3: clock for ssc from rk pin
Date: Fri, 18 Apr 2014 22:50:17 +0200
Message-ID: <53519009.8040405@atmel.com>
References: <1395049541-28128-1-git-send-email-voice.shen@atmel.com> <1395049541-28128-6-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395049541-28128-6-git-send-email-voice.shen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bo Shen <voice.shen@atmel.com>, Mark Brown <broonie@kernel.org>
Cc: Andrew Victor <linux@maxim.org.za>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 17/03/2014 10:45, Bo Shen :
> According to hardware design the clock for SSC device is from rk pin.
> 
> Signed-off-by: Bo Shen <voice.shen@atmel.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

> ---
> 
>  arch/arm/boot/dts/sama5d3xmb.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sama5d3xmb.dtsi b/arch/arm/boot/dts/sama5d3xmb.dtsi
> index 0600153..306eef0 100644
> --- a/arch/arm/boot/dts/sama5d3xmb.dtsi
> +++ b/arch/arm/boot/dts/sama5d3xmb.dtsi
> @@ -32,6 +32,10 @@
>  				};
>  			};
>  
> +			ssc0: ssc@f0008000 {
> +				atmel,clk-from-rk-pin;
> +			};
> +
>  			/*
>  			 * i2c0 conflicts with ISI:
>  			 * disable it to allow the use of ISI
> 


-- 
Nicolas Ferre
