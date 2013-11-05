From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv9][ 5/6] ARM: dts: imx25.dtsi: Add some pinmux pins.
Date: Tue, 5 Nov 2013 10:00:13 +0800
Message-ID: <20131105020010.GB19770@S2101-09.ap.freescale.net>
References: <1383210928-18906-1-git-send-email-denis@eukrea.com>
 <1383210928-18906-5-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383210928-18906-5-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: Eric =?iso-8859-1?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Denis,

On Thu, Oct 31, 2013 at 10:15:27AM +0100, Denis Carikli wrote:
> @@ -174,9 +174,111 @@
>  				status = "disabled";
>  			};
>  
> -			iomuxc@43fac000{
> +			iomuxc: iomuxc@43fac000 {
>  				compatible = "fsl,imx25-iomuxc";
>  				reg = <0x43fac000 0x4000>;
> +
> +				audmux {
> +					pinctrl_audmux_1: audmuxgrp-1 {
> +						fsl,pins = <
> +							MX25_PAD_KPP_COL3__AUD5_TXFS 0xe0
> +							MX25_PAD_KPP_COL2__AUD5_TXC  0xe0
> +							MX25_PAD_KPP_COL1__AUD5_RXD  0xe0
> +							MX25_PAD_KPP_COL0__AUD5_TXD  0xe0
> +						>;
> +					};
> +				};

To solve the problem that device tree gets bloated by so many pinctrl
nodes, I sent a series [1] to make the nodes be board specific.  Can
you please do the same for imx25 based on the branch below?

  git://git.linaro.org/people/shawnguo/linux-2.6.git for-next

Shawn

[1] http://thread.gmane.org/gmane.linux.ports.arm.kernel/277649

> +
> +				esdhc1 {
> +					pinctrl_esdhc1_1: esdhc1grp-1 {
> +						fsl,pins = <
> +							MX25_PAD_SD1_CMD__SD1_CMD      0x400000c0
> +							MX25_PAD_SD1_CLK__SD1_CLK      0x400000c0
> +							MX25_PAD_SD1_DATA0__SD1_DATA0  0x400000c0
> +							MX25_PAD_SD1_DATA1__SD1_DATA1  0x400000c0
> +							MX25_PAD_SD1_DATA2__SD1_DATA2  0x400000c0
> +							MX25_PAD_SD1_DATA3__SD1_DATA3  0x400000c0
> +						>;
> +					};
> +				};
> +
> +				fec {
> +					pinctrl_fec_1: fecgrp-1 {
> +						fsl,pins = <
> +							MX25_PAD_FEC_MDC__FEC_MDC       0x80000000
> +							MX25_PAD_FEC_MDIO__FEC_MDIO     0x400001e0
> +							MX25_PAD_FEC_TDATA0__FEC_TDATA0 0x80000000
> +							MX25_PAD_FEC_TDATA1__FEC_TDATA1 0x80000000
> +							MX25_PAD_FEC_TX_EN__FEC_TX_EN   0x80000000
> +							MX25_PAD_FEC_RDATA0__FEC_RDATA0 0x80000000
> +							MX25_PAD_FEC_RDATA1__FEC_RDATA1 0x80000000
> +							MX25_PAD_FEC_RX_DV__FEC_RX_DV   0x80000000
> +							MX25_PAD_FEC_TX_CLK__FEC_TX_CLK 0x1c0
> +						>;
> +					};
> +				};
> +
> +				i2c1 {
> +					pinctrl_i2c1_1: i2c1grp-1 {
> +						fsl,pins = <
> +							MX25_PAD_I2C1_CLK__I2C1_CLK 0x80000000
> +							MX25_PAD_I2C1_DAT__I2C1_DAT 0x80000000
> +						>;
> +					};
> +				};
> +
> +				lcdc {
> +					pinctrl_lcdc_1: lcdcgrp-1 {
> +						fsl,pins = <
> +							MX25_PAD_LD0__LD0           0x1
> +							MX25_PAD_LD1__LD1           0x1
> +							MX25_PAD_LD2__LD2           0x1
> +							MX25_PAD_LD3__LD3           0x1
> +							MX25_PAD_LD4__LD4           0x1
> +							MX25_PAD_LD5__LD5           0x1
> +							MX25_PAD_LD6__LD6           0x1
> +							MX25_PAD_LD7__LD7           0x1
> +							MX25_PAD_LD8__LD8           0x1
> +							MX25_PAD_LD9__LD9           0x1
> +							MX25_PAD_LD10__LD10         0x1
> +							MX25_PAD_LD11__LD11         0x1
> +							MX25_PAD_LD12__LD12         0x1
> +							MX25_PAD_LD13__LD13         0x1
> +							MX25_PAD_LD14__LD14         0x1
> +							MX25_PAD_LD15__LD15         0x1
> +							MX25_PAD_GPIO_E__LD16       0x1
> +							MX25_PAD_GPIO_F__LD17       0x1
> +
> +							MX25_PAD_HSYNC__HSYNC       0x80000000
> +							MX25_PAD_VSYNC__VSYNC       0x80000000
> +							MX25_PAD_LSCLK__LSCLK       0x80000000
> +							MX25_PAD_OE_ACD__OE_ACD     0x80000000
> +							MX25_PAD_CONTRAST__CONTRAST 0x80000000
> +						>;
> +					};
> +				};
> +
> +				uart1 {
> +					pinctrl_uart1_1: uart1grp-1 {
> +						fsl,pins = <
> +							MX25_PAD_UART1_RTS__UART1_RTS 0xe0
> +							MX25_PAD_UART1_CTS__UART1_CTS 0xe0
> +							MX25_PAD_UART1_TXD__UART1_TXD 0x80000000
> +							MX25_PAD_UART1_RXD__UART1_RXD 0xc0
> +						>;
> +					};
> +				};
> +
> +				uart2 {
> +					pinctrl_uart2_1: uart2grp-1 {
> +						fsl,pins = <
> +							MX25_PAD_UART2_RXD__UART2_RXD 0x80000000
> +							MX25_PAD_UART2_TXD__UART2_TXD 0x80000000
> +							MX25_PAD_UART2_RTS__UART2_RTS 0x80000000
> +							MX25_PAD_UART2_CTS__UART2_CTS 0x80000000
> +						>;
> +					};
> +				};
>  			};
>  
>  			audmux: audmux@43fb0000 {
> -- 
> 1.7.9.5
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
