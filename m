From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 01/10] dt-bindings: add powercontroller
Date: Tue, 13 Aug 2019 09:25:47 -0600
Message-ID: <CAL_Jsq+fW=x8MoL3GMj6+ZKC3fd6F6+8Rtx=j5R9vEuL9UHCuQ@mail.gmail.com>
References: <20190812121511.4169-1-frank-w@public-files.de>
 <20190812121511.4169-2-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190812121511.4169-2-frank-w@public-files.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Lee Jones <lee.jones@linaro.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, Allison Randal <allison@lohutok.net>, devicetree@vger.kernel.org, "open list:THERMAL" <linux-pm@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>, "Tianping . Fang" <tianping.fang@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, moderated list:ARM/FREESCALE IMX / M
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 6:24 AM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> From: Josef Friedl <josef.friedl@speed.at>
>
> add mt6323-rtc and mt6323-pwrc to mt6397 mfd DT bindings
> an example is shown in mt6323-poweroff.txt

How does this get to v5 with such a terrible subject? At least give
some indication this is for some Mediatek chip.

The recipient list needs some work too. Don't Cc git committers that
get_maintainers.pl lists.

>
> Suggested-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Josef Friedl <josef.friedl@speed.at>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
> changes since v4: use relative path
> changes since v3: none
> changes since v2: separated rtc-mt6397.txt to part 2
> ---
>  .../devicetree/bindings/mfd/mt6397.txt        | 20 +++++++++++++------
>  .../bindings/power/reset/mt6323-poweroff.txt  | 20 +++++++++++++++++++
>  2 files changed, 34 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
>
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index 0ebd08af777d..063f5fe1cace 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -8,11 +8,12 @@ MT6397/MT6323 is a multifunction device with the following sub modules:
>  - Clock
>  - LED
>  - Keys
> +- Power controller
>
>  It is interfaced to host controller using SPI interface by a proprietary hardware
>  called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
>  See the following for pwarp node definitions:
> -Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> +../../bindings/soc/mediatek/pwrap.txt

Unrelated change to what the subject says. Clean-ups and new things in
separate patches please.

>
>  This document describes the binding for MFD device and its sub module.
>
> @@ -22,14 +23,16 @@ compatible: "mediatek,mt6397" or "mediatek,mt6323"
>  Optional subnodes:
>
>  - rtc
> -       Required properties:
> +       Required properties: Should be one of follows
> +               - compatible: "mediatek,mt6323-rtc"

How is this related to 'powercontroller'?

>                 - compatible: "mediatek,mt6397-rtc"
> +       For details, see ../../bindings/rtc/rtc-mt6397.txt
>  - regulators
>         Required properties:
>                 - compatible: "mediatek,mt6397-regulator"
> -       see Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
> +       see ../../bindings/regulator/mt6397-regulator.txt
>                 - compatible: "mediatek,mt6323-regulator"
> -       see Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
> +       see ../../bindings/regulator/mt6323-regulator.txt
>  - codec
>         Required properties:
>                 - compatible: "mediatek,mt6397-codec"
> @@ -39,12 +42,17 @@ Optional subnodes:
>  - led
>         Required properties:
>                 - compatible: "mediatek,mt6323-led"
> -       see Documentation/devicetree/bindings/leds/leds-mt6323.txt
> +       see ../../bindings/leds/leds-mt6323.txt
>
>  - keys
>         Required properties:
>                 - compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
> -       see Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
> +       see ../../bindings/input/mtk-pmic-keys.txt
> +
> +- power-controller
> +       Required properties:
> +               - compatible: "mediatek,mt6323-pwrc"
> +       For details, see ../../bindings/power/reset/mt6323-poweroff.txt
>
>  Example:
>         pwrap: pwrap@1000f000 {
> diff --git a/Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt b/Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
> new file mode 100644
> index 000000000000..933f0c48e887
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
> @@ -0,0 +1,20 @@
> +Device Tree Bindings for Power Controller on MediaTek PMIC
> +
> +The power controller which could be found on PMIC is responsible for externally
> +powering off or on the remote MediaTek SoC through the circuit BBPU.
> +
> +Required properties:
> +- compatible: Should be one of follows
> +       "mediatek,mt6323-pwrc": for MT6323 PMIC
> +
> +Example:
> +
> +       pmic {
> +               compatible = "mediatek,mt6323";
> +
> +               ...
> +
> +               power-controller {
> +                       compatible = "mediatek,mt6323-pwrc";
> +               };
> +       }
> --
> 2.17.1
>
