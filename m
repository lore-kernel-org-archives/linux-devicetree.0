From: m18063 <Claudiu.Beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH 00/14] at91 fixes and enhancements
Date: Tue, 10 Oct 2017 12:30:06 +0300
Message-ID: <45089013-3ffa-010f-ef4b-0be693abc2e3@microchip.com>
References: <1507565377-1545-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507565377-1545-1-git-send-email-claudiu.beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Please ignore this series since I did some mistakes.
I will send version 2.

Thank you,
Claudiu

On 09.10.2017 19:09, Claudiu Beznea wrote:
> Hi,
> 
> This series contains fixes and enhancements for Atmel/Microchip boards,
> mainly for SoM1-EK board, SAMA5D2 Xplained board and SAM9x5 boards.
> Please accept them for 4.15.
> 
> Thank you,
> Claudiu Beznea
> 
> Claudiu Beznea (14):
>   ARM: dts: at91: sama5d27_som1_ek: add disabled/okay status
>   ARM: dts: at91: sama5d27_som1_ek: update serial aliases
>   ARM: dts: at91: sama5d27_som1_ek: set USER button as a wakeup source
>   ARM: dts: at91: sama5d27_som1_ek: add aliases for i2c
>   ARM: dts: at91: sama5d27_som1_ek: add pinmuxing for pwm0
>   ARM: dts: at91: sama5d27_som1_ek: remove not connected CAN0
>   ARM: dts: at91: sama5d27_som1_ek: remove pull-up on SD/MMC lines
>   ARM: dts: at91: sama5d2_xplained: Add charger node of pmic.
>   ARM: dts: at91: sama5d2_xplained: set PB_USER as wakeup source
>   ARM: dts: at91: sama5d2_xplained: add pinmuxing for pwm0
>   ARM: dts: at91: sama5d2_xplained: remove pull-up on SD/MMC lines
>   ARM: dts: at91: at91sam9x25ek: add CAN1 interface
>   ARM: dts: at91: at91sam9x25ek: add pwm0
>   ARM: dts: at91: at91sam9x5ek: use DMA for USART0
> 
>  arch/arm/boot/dts/at91-sama5d27_som1_ek.dts | 46 ++++++++++++++---------------
>  arch/arm/boot/dts/at91-sama5d2_xplained.dts | 39 ++++++++++++++++--------
>  arch/arm/boot/dts/at91sam9x25ek.dts         | 10 +++++++
>  arch/arm/boot/dts/at91sam9x5ek.dtsi         |  2 ++
>  4 files changed, 62 insertions(+), 35 deletions(-)
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
