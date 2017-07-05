From: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH v2 0/5] Add SoM1 support
Date: Wed, 5 Jul 2017 08:17:21 +0200
Message-ID: <20170705061721.achgce3jw7fy3aly@rfolt0960.corp.atmel.com>
References: <1499086572-6083-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1499086572-6083-1-git-send-email-claudiu.beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Claudiu Beznea <claudiu.beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, sza-4N5lU0Zj96A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cristian.birsan-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 03, 2017 at 03:56:07PM +0300, Claudiu Beznea wrote:
> Hi all,
> 
> This series adds support for sama5d2 SoM1 devices.
> 
> The at91-sama5d27_som1.dtsi add specific bindings for SoM1 board.
> The at91-sama5d27_som1_ek.dts add specific bindings for SoM1 EK board.
> 
> The sama5d27_som1_ek uses a EEPROM binding, "start-offset", which is
> introduced in patch series: "[RFC PATCH 0/3] Add at24 functionality to
> read form different EEPROM offsets".
> 
> Thank you,
> Claudiu
> 

For the whole set of patches:
Acked-by: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>

> Changes in v2:
> o in at91-sama5d27_som1.dtsi:
> - increase bootloader and kernel size in flash map (with bootloader
> flash offset the dtb and kernel flash offsets were changed)
> - use right pin for ethernet-phy interrupt
> 
> o in at91-sama5d27_som1_ek.dts:
> - removed memory tag and rely on bootloader to fill the right value
> - use pin macros (from arch/arm/boot/dts/sama5d2-pinfunc.h) wherever
> posible instead of pin numbers
> - remove pinctrl_sensor_power and pinctrl_sensor_reset pin muxing
> since they are not of intereset for this board
> - use "pb4" label for user button instead of "bp1"
> 
> Claudiu Beznea (2):
>   ARM: dts: at91: at91-sama5d27_som1: add sama5d27 SoM1 support
>   ARM: dts: sama5d27_som1_ek: Add sama5d27 SoM1 EK support
> 
> Cristian Birsan (1):
>   drivers: soc: atmel: Add basic support for new sama5d2 SiPs
> 
> Cyrille Pitchen (1):
>   ARM: dts: at91: sama5d2: add QSPI nodes
> 
> Songjun Wu (1):
>   ARM: dts: at91: sama5d2: add isc node
> 
>  arch/arm/boot/dts/Makefile                  |   1 +
>  arch/arm/boot/dts/at91-sama5d27_som1.dtsi   | 178 +++++++++
>  arch/arm/boot/dts/at91-sama5d27_som1_ek.dts | 551 ++++++++++++++++++++++++++++
>  arch/arm/boot/dts/sama5d2.dtsi              |  38 ++
>  drivers/soc/atmel/soc.c                     |   8 +
>  drivers/soc/atmel/soc.h                     |   4 +
>  6 files changed, 780 insertions(+)
>  create mode 100644 arch/arm/boot/dts/at91-sama5d27_som1.dtsi
>  create mode 100644 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
> 
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
