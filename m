From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v2 4/6] clk: sunxi-ng: add support for the
 Allwinner H6 CCU
Date: Wed, 07 Feb 2018 17:11:11 +0800
Message-ID: <3AB5A169-5EA5-4A45-95AF-4CA56F13A1CA@aosc.io>
References: <20180203154942.63566-1-icenowy@aosc.io> <20180203154942.63566-5-icenowy@aosc.io> <20180207090210.jlxleeh32tojvzp5@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBOEF5PJQKGQEYNXEQKA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180207090210.jlxleeh32tojvzp5@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B42=E6=9C=887=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=885:0=
2:10, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>Hi,
>
>On Sat, Feb 03, 2018 at 11:49:40PM +0800, Icenowy Zheng wrote:
>> +	/* Force the output divider of video PLLs to 0 */
>> +	for (i =3D 0; i < ARRAY_SIZE(pll_video_regs); i++) {
>> +		val =3D readl(reg + pll_video_regs[i]);
>> +		val &=3D ~BIT(0);
>> +		writel(val, reg + pll_video_regs[i]);
>> +	}
>
>Why?

According to the manual the output divider here is
test only, and for daily use it should be 0.

>
>> +	/* Force OHCI 12M clock sources to 00 (12MHz divided from 48MHz) */
>> +	for (i =3D 0; i < ARRAY_SIZE(usb2_clk_regs); i++) {
>> +		val =3D readl(reg + usb2_clk_regs[i]);
>> +		val &=3D ~GENMASK(25, 24);
>> +		writel (val, reg + usb2_clk_regs[i]);
>> +	}
>
>Why?

Just make them have a sure working parent. Why this
muxs exist is still mysterious.

>
>> +	/*
>> +	 * Force the post-divider of pll-video to 8 and the output divider

oh here's a typo -- it's audio, not video.

>> +	 * of it to 1.
>> +	 */
>> +	val =3D readl(reg + SUN50I_H6_PLL_AUDIO_REG);
>> +	val &=3D ~(GENMASK(21, 16) | BIT(0));
>> +	writel(val | (7 << 16), reg + SUN50I_H6_PLL_AUDIO_REG);
>
>Why?

See the comments about pll-audio in the former sources :-)

>> diff --git a/include/dt-bindings/clock/sun50i-h6-ccu.h
>b/include/dt-bindings/clock/sun50i-h6-ccu.h
>> new file mode 100644
>> index 000000000000..f7ddb241012c
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/sun50i-h6-ccu.h
>> @@ -0,0 +1,125 @@
>> +/*
>> + * Copyright (C) 2017 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> + *
>> + * SPDX-License-Identifier: (GPL-2.0+ or MIT)
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_SUN50I_H6_H_
>> +#define _DT_BINDINGS_CLK_SUN50I_H6_H_
>> +
>> +#define CLK_PLL_PERIPH0		3
>
>Why is that needed?

Parent of AR100 clock in PRCM.

>
>> +
>> +#define CLK_CPUX		21
>> +
>> +#define CLK_APB1		26
>
>Same thing here

As discussed in v1, the APB bus clock is used for PIO.

>
>> +
>> +#define CLK_DE			29
>> +#define CLK_BUS_DE		30
>> +#define CLK_DEINTERLACE		31
>> +#define CLK_BUS_DEINTERLACE	32
>> +#define CLK_GPU			33
>> +#define CLK_BUS_GPU		34
>> +#define CLK_CE			35
>> +#define CLK_BUS_CE		36
>> +#define CLK_VE			37
>> +#define CLK_BUS_VE		38
>> +#define CLK_EMCE		39
>> +#define CLK_BUS_EMCE		40
>> +#define CLK_VP9			41
>> +#define CLK_BUS_VP9		42
>> +#define CLK_BUS_DMA		43
>> +#define CLK_BUS_MSGBOX		44
>> +#define CLK_BUS_SPINLOCK	45
>> +#define CLK_BUS_HSTIMER		46
>> +#define CLK_AVS			47
>> +#define CLK_BUS_DBG		48
>> +#define CLK_BUS_PSI		49
>> +#define CLK_BUS_PWM		50
>> +#define CLK_BUS_IOMMU		51
>> +
>> +#define CLK_MBUS_DMA		53
>> +#define CLK_MBUS_VE		54
>> +#define CLK_MBUS_CE		55
>> +#define CLK_MBUS_TS		56
>> +#define CLK_MBUS_NAND		57
>> +#define CLK_MBUS_CSI		58
>> +#define CLK_MBUS_DEINTERLACE	59
>> +
>> +#define CLK_NAND0		61
>> +#define CLK_NAND1		62
>> +#define CLK_BUS_NAND		63
>> +#define CLK_MMC0		64
>> +#define CLK_MMC1		65
>> +#define CLK_MMC2		66
>> +#define CLK_BUS_MMC0		67
>> +#define CLK_BUS_MMC1		68
>> +#define CLK_BUS_MMC2		69
>> +#define CLK_BUS_UART0		70
>> +#define CLK_BUS_UART1		71
>> +#define CLK_BUS_UART2		72
>> +#define CLK_BUS_UART3		73
>> +#define CLK_BUS_I2C0		74
>> +#define CLK_BUS_I2C1		75
>> +#define CLK_BUS_I2C2		76
>> +#define CLK_BUS_I2C3		77
>> +#define CLK_BUS_SCR0		78
>> +#define CLK_BUS_SCR1		79
>> +#define CLK_SPI0		80
>> +#define CLK_SPI1		81
>> +#define CLK_BUS_SPI0		82
>> +#define CLK_BUS_SPI1		83
>> +#define CLK_BUS_EMAC		84
>> +#define CLK_TS			85
>> +#define CLK_BUS_TS		86
>> +#define CLK_IR_TX		87
>> +#define CLK_BUS_IR_TX		88
>> +#define CLK_BUS_THS		89
>> +#define CLK_I2S3		90
>> +#define CLK_I2S0		91
>> +#define CLK_I2S1		92
>> +#define CLK_I2S2		93
>> +#define CLK_BUS_I2S0		94
>> +#define CLK_BUS_I2S1		95
>> +#define CLK_BUS_I2S2		96
>> +#define CLK_BUS_I2S3		97
>> +#define CLK_SPDIF		98
>> +#define CLK_BUS_SPDIF		99
>> +#define CLK_DMIC		100
>> +#define CLK_BUS_DMIC		101
>> +#define CLK_AUDIO_HUB		102
>> +#define CLK_BUS_AUDIO_HUB	103
>> +#define CLK_USB_OHCI0		104
>> +#define CLK_USB_PHY0		105
>> +#define CLK_USB_PHY1		106
>> +#define CLK_USB_OHCI3		107
>> +#define CLK_USB_PHY3		108
>> +#define CLK_USB_HSIC_12M	109
>> +#define CLK_USB_HSIC		110
>> +#define CLK_BUS_OHCI0		111
>> +#define CLK_BUS_OHCI3		112
>> +#define CLK_BUS_EHCI0		113
>> +#define CLK_BUS_XHCI		114
>> +#define CLK_BUS_EHCI3		115
>> +#define CLK_BUS_OTG		116
>> +#define CLK_PCIE_REF_100M	117
>> +#define CLK_PCIE_REF		118
>> +#define CLK_PCIE_REF_OUT	119
>> +#define CLK_PCIE_MAXI		120
>> +#define CLK_PCIE_AUX		121
>
>Dito.

I think AUX clock is used in PCIe code.

BTW the REF_100M clock is intermediate, and
does't need to be exported. Will fix it in the next version.

>
>> +#define CLK_BUS_PCIE		122
>> +#define CLK_HDMI		123
>> +#define CLK_HDMI_CEC		124
>> +#define CLK_BUS_HDMI		125
>> +#define CLK_BUS_TCON_TOP	126
>
>Ditto.

TCON_TOP is not a clock parent -- it's a dedicated hw
part which controlls the connection between
DE2/3 mixers and TCONs.

>
>Remember, you should only expose here the clocks that devices are
>going to use, and remove as much intermediate clocks as possible.
>
>If you're unsure, keep them out of the dt-binding include, we can
>always move one to the dt-binding header, while the other way isn't
>possible.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
