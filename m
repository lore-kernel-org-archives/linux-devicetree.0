From: James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 1/2] MIPS: DTS: add base device tree for Pistachio SoC
Date: Fri, 18 Nov 2016 11:27:26 +0000
Message-ID: <72BC0C8BD7BB6F45988A99382E5FBAE5889FEB5E@HHMAIL01.hh.imgtec.org>
References: <1476424555-22629-1-git-send-email-rahul.bedarkar@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476424555-22629-1-git-send-email-rahul.bedarkar-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rahul Bedarkar <Rahul.Bedarkar-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rahul, 

> -----Original Message-----
> From: Rahul Bedarkar
> Sent: 14 October 2016 06:56
> To: Ralf Baechle; Rob Herring; Mark Rutland; James Hartley
> Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Rahul Bedarkar
> Subject: [PATCH v2 1/2] MIPS: DTS: add base device tree for Pistachio SoC
> 
> Add support for the base Device Tree for Imagination Technologies'
> Pistachio SoC.
> 
> This commit supports the following peripherals:
> 
>  * Clocks
>  * Pinctrl and GPIO
>  * UART
>  * SPI
>  * I2C
>  * PWM
>  * ADC
>  * Watchdog
>  * Ethernet
>  * MMC
>  * DMA engine
>  * Crypto
>  * I2S
>  * SPDIF
>  * Internal DAC
>  * Timer
>  * USB
>  * IR
>  * Interrupt Controller
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
>   - No change
> ---
>  MAINTAINERS                           |   2 +-
>  arch/mips/boot/dts/img/pistachio.dtsi | 924
> ++++++++++++++++++++++++++++++++++
>  2 files changed, 925 insertions(+), 1 deletion(-)  create mode 100644
> arch/mips/boot/dts/img/pistachio.dtsi

Thanks for putting this together Rahul.

Acked-by: James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
