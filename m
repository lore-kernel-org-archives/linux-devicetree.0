From: Igor Grinberg <grinberg@compulab.co.il>
Subject: Re: [PATCH 10/14] ARM: dts: qs600: Add missing pinctrl property for
 gsbi7 uart
Date: Mon, 21 Sep 2015 09:26:09 +0300
Message-ID: <55FFA301.80201@compulab.co.il>
References: <1442579371-19822-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1442579513-20356-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1442579513-20356-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 09/18/15 15:31, Srinivas Kandagatla wrote:
> This patch adds missing 2pin uart pinctrl property to gsbi7 uart on
> CM-QS600.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Acked-by: Igor Grinberg <grinberg@compulab.co.il>

> ---
>  arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> index bdea747..8aac3be 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> @@ -101,6 +101,8 @@
>  			qcom,mode = <GSBI_PROT_I2C_UART>;
>  			serial@16640000 {
>  				status = "ok";
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&gsbi7_uart_2pins>;
>  			};
>  		};
>  
> 

-- 
Regards,
Igor.
