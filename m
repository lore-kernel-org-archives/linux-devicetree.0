From: Ran Bi <ran.bi@mediatek.com>
Subject: Re: [PATCH v2 1/4] bindings: rtc: add bindings for MT2712 RTC
Date: Fri, 23 Aug 2019 14:35:31 +0800
Message-ID: <1566542131.12318.52.camel@mhfsdcap03>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
         <20190801110122.26834-2-ran.bi@mediatek.com>
         <84bd8752-f437-781f-9f08-cedfca6cc06a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <84bd8752-f437-781f-9f08-cedfca6cc06a@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, YT Shen <yt.shen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Flor
List-Id: devicetree@vger.kernel.org


Hi,

> > +Required properties:
> > +- compatible	    : Should be "mediatek,mt2712-rtc" : for MT2712 SoC
> > +- reg 		    : Specifies base physical address and size of the registers;
> > +- interrupts	    : Should contain the interrupt for RTC alarm;
> 
> No clocks for the RTC? What about CLK_TOP_RTC_SEL from the clk driver?
> 
> Regards,
> Matthias
> 

I suppose that we don't need clock control for mt2712 RTC. RTC clock is directly
come from 32K crystal and there is no control register to switch the clock. In mt2712,
CLK_TOP_RTC_SEL is prepared for other module even it called CLK_TOP_RTC_SEL.

Regards,
Ran

> > +
> > +Example:
> > +
> > +rtc: rtc@10011000 {
> > +	compatible = "mediatek,mt2712-rtc";
> > +	reg = <0 0x10011000 0 0x1000>;
> > +	interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_LOW>;
> > +};
> > 
