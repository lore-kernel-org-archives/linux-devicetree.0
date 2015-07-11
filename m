From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/6] mfd: devicetree: bindings: 88pm800: Add DT property
 for 32KHz output enable
Date: Sat, 11 Jul 2015 16:11:52 +0900
Message-ID: <55A0C1B8.4030402@samsung.com>
References: <1436442431-3471-1-git-send-email-vaibhav.hiremath@linaro.org> <1436442431-3471-4-git-send-email-vaibhav.hiremath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436442431-3471-4-git-send-email-vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

W dniu 09.07.2015 o 20:47, Vaibhav Hiremath pisze:
> 88PM800 family of device supports output of 32KHz clock (low jitter)
> on CLK32K2/3 pin which can be supplied to other peripherals on the board.
> 
> This patch adds the devicetree binding to enable this feature.
> 
> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/88pm800.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/88pm800.txt b/Documentation/devicetree/bindings/mfd/88pm800.txt
> index dec842f..ae1311c 100644
> --- a/Documentation/devicetree/bindings/mfd/88pm800.txt
> +++ b/Documentation/devicetree/bindings/mfd/88pm800.txt
> @@ -9,6 +9,12 @@ Required parent device properties:
>  - #interrupt-cells 	: should be 1.
>  			  The cell is the 88pm80x local IRQ number
>  
> +Optional properties :
> + - marvell,88pm800-32khz-xolj-out-en	: If set, driver will enable low jitter
> +   version of 32Khz clock output on

I am not sure if I understand it correctly. The hardware always has such
clocks and you only want to enable/disable it in DT? Any reasons why
these should not be enabled always?

Enabling it in DT does not look like a job for DT. Maybe you there
should be just a clock driver (clock provider)?

Best regards,
Krzysztof

> +      CLK32K3 - for 88pm800
> +      CLK32K2 - for 88pm860
> +
>  88pm80x family of devices consists of varied group of sub-devices:
>  
>  Device		 	Supply Names	 Description
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
