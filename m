From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 1/4] bindings: rtc: add bindings for MT2712 RTC
Date: Thu, 22 Aug 2019 11:17:53 +0200
Message-ID: <84bd8752-f437-781f-9f08-cedfca6cc06a@gmail.com>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
 <20190801110122.26834-2-ran.bi@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190801110122.26834-2-ran.bi@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ran Bi <ran.bi@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, YT Shen <yt.shen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Flora Fu <flora.fu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org



On 01/08/2019 13:01, Ran Bi wrote:
> Document the binding for MT2712 RTC implemented by rtc-mt2712.
> 
> Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/rtc/rtc-mt2712.txt         | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt b/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
> new file mode 100644
> index 000000000000..c33d87e5e753
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
> @@ -0,0 +1,14 @@
> +Device-Tree bindings for MediaTek SoC based RTC
> +
> +Required properties:
> +- compatible	    : Should be "mediatek,mt2712-rtc" : for MT2712 SoC
> +- reg 		    : Specifies base physical address and size of the registers;
> +- interrupts	    : Should contain the interrupt for RTC alarm;

No clocks for the RTC? What about CLK_TOP_RTC_SEL from the clk driver?

Regards,
Matthias

> +
> +Example:
> +
> +rtc: rtc@10011000 {
> +	compatible = "mediatek,mt2712-rtc";
> +	reg = <0 0x10011000 0 0x1000>;
> +	interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_LOW>;
> +};
> 
