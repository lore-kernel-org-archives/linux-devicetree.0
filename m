From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v7 0/3] ARM: dts: at91: sama5d2: Add nodes for I2S
Date: Mon, 27 Aug 2018 16:40:49 +0200
Message-ID: <20180827144049.GC23428@piout.net>
References: <20180806111948.4522-1-codrin.ciubotariu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180806111948.4522-1-codrin.ciubotariu@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc: nicolas.ferre@microchip.com, Claudiu.Beznea@microchip.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Cristian.Birsan@microchip.com
List-Id: devicetree@vger.kernel.org

On 06/08/2018 14:19:45+0300, Codrin Ciubotariu wrote:
> These are the remaining dts patches from the series:
> [PATCH v5 0/5] ASoC: add driver for Atmel I2S controller
> 
> v6 -> v7
>  - addressed some comments regarding pin conflicts;
> 
> v5 -> v6
>  - removed unnecessary phandles to audio PLL clock from the I2S nodes;
>  - using assigned clocks to set gclk as parent of i2smuxclk;
> 
> Codrin Ciubotariu (1):
>   ARM: dts: at91: sama5d2: add I2S clock muxing nodes
> 
> Cyrille Pitchen (2):
>   ARM: dts: at91: sama5d2: add nodes for I2S controllers
>   ARM: dts: at91: sama5d2 Xplained: add pin muxing for I2S
> 
>  arch/arm/boot/dts/at91-sama5d2_xplained.dts | 30 +++++++++++
>  arch/arm/boot/dts/sama5d2.dtsi              | 56 +++++++++++++++++++++
>  2 files changed, 86 insertions(+)
> 

All applied, thanks!

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
