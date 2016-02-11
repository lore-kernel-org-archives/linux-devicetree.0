From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: enable GPIO-a for Broadcom NSP
Date: Thu, 11 Feb 2016 12:01:53 -0800
Message-ID: <56BCE8B1.2060900@gmail.com>
References: <1449249162-16850-1-git-send-email-yrdreddy@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449249162-16850-1-git-send-email-yrdreddy@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/12/15 09:12, Yendapally Reddy Dhananjaya Reddy wrote:
> This enables the GPIO-a support for Broadcom NSP SoC
> 
> Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>

Finally applied to devicetree/next, since there was a bit of
restructuring with the addition of the ranges, please verify the results
look correct here:

https://github.com/Broadcom/stblinux/commit/018e4feb7584971b3dbda6daa6a8fef310cafbcb

> ---
>  arch/arm/boot/dts/bcm-nsp.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
> index 58aca27..148d79e 100644
> --- a/arch/arm/boot/dts/bcm-nsp.dtsi
> +++ b/arch/arm/boot/dts/bcm-nsp.dtsi
> @@ -116,4 +116,16 @@
>  			status = "disabled";
>  		};
>  	};
> +
> +	gpioa: gpio@18000020 {
> +		compatible = "brcm,nsp-gpio-a";
> +		reg = <0x18000020 0x70>,
> +		      <0x1803f1c4 0x1c>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		ngpios = <32>;
> +		interrupt-controller;
> +		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +		gpio-ranges = <&pinctrl 0 0 32>;
> +	};
>  };
> 


-- 
Florian
