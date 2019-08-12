From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 01/10] dt-bindings: add powercontroller
Date: Mon, 12 Aug 2019 11:20:35 +0100
Message-ID: <20190812102035.GH26727@dell>
References: <20190729174154.4335-1-frank-w@public-files.de>
 <20190729174154.4335-2-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190729174154.4335-2-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Allison Randal <allison@lohutok.net>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Kate Stewart <kstewart@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Richard Fontana <rfontana@redhat.com>, Rob Herring <robh+dt@k>
List-Id: devicetree@vger.kernel.org

On Mon, 29 Jul 2019, Frank Wunderlich wrote:

> From: Josef Friedl <josef.friedl@speed.at>
> 
> add mt6323-rtc and mt6323-pwrc to mt6397 mfd DT bindings
> an example is shown in mt6323-poweroff.txt
> 
> changes since v2: separated rtc-mt6397.txt to part 2
> 
> Suggested-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Josef Friedl <josef.friedl@speed.at>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../devicetree/bindings/mfd/mt6397.txt        | 10 +++++++++-
>  .../bindings/power/reset/mt6323-poweroff.txt  | 20 +++++++++++++++++++
>  2 files changed, 29 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index 0ebd08af777d..44acb9827716 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -8,6 +8,7 @@ MT6397/MT6323 is a multifunction device with the following sub modules:
>  - Clock
>  - LED
>  - Keys
> +- Power controller
> 
>  It is interfaced to host controller using SPI interface by a proprietary hardware
>  called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
> @@ -22,8 +23,10 @@ compatible: "mediatek,mt6397" or "mediatek,mt6323"
>  Optional subnodes:
> 
>  - rtc
> -	Required properties:
> +	Required properties: Should be one of follows
> +		- compatible: "mediatek,mt6323-rtc"
>  		- compatible: "mediatek,mt6397-rtc"
> +	For details, see Documentation/devicetree/bindings/rtc/rtc-mt6397.txt

Please use relative paths.

E.g: ../bindings/rtc/rtc-mt6397.txt

Apart from that, the MFD parts look okay to me.

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
