From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] ndings: mediatek: Add bindings for mediatek MT6765 Platform
Date: Tue, 12 Jun 2018 18:51:08 -0600
Message-ID: <CAL_JsqJ3LjA3yG7UvD7FyhCxF60xWuu=c4uXLW1wD7MCLWuOPg@mail.gmail.com>
References: <1528843243-29782-1-git-send-email-mars.cheng@mediatek.com> <1528843243-29782-2-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528843243-29782-2-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 12, 2018 at 4:40 PM, Mars Cheng <mars.cheng@mediatek.com> wrote:
> This adds dt-binding documentation for Mediatek MT6765. Only
> include very basic items, gic, uart timer and cpu.

Check your subject...

>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.txt |    4 ++++
>  .../interrupt-controller/mediatek,sysirq.txt       |    1 +
>  .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
>  3 files changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
> index 7d21ab3..6e42251 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek.txt
> @@ -11,6 +11,7 @@ compatible: Must contain one of
>     "mediatek,mt6589"
>     "mediatek,mt6592"
>     "mediatek,mt6755"
> +   "mediatek,mt6765"
>     "mediatek,mt6795"
>     "mediatek,mt6797"
>     "mediatek,mt7622"
> @@ -41,6 +42,9 @@ Supported boards:
>  - Evaluation phone for MT6755(Helio P10):
>      Required root node properties:
>        - compatible = "mediatek,mt6755-evb", "mediatek,mt6755";
> +- Evaluation board for MT6765:
> +    Required root node properties:
> +      - compatible = "mediatek,mt6765-evb", "mediatek,mt6765";
>  - Evaluation board for MT6795(Helio X10):
>      Required root node properties:
>        - compatible = "mediatek,mt6795-evb", "mediatek,mt6795";
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> index 07bf0b9..c8eda80 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> @@ -11,6 +11,7 @@ Required properties:
>         "mediatek,mt7622-sysirq", "mediatek,mt6577-sysirq": for MT7622
>         "mediatek,mt6795-sysirq", "mediatek,mt6577-sysirq": for MT6795
>         "mediatek,mt6797-sysirq", "mediatek,mt6577-sysirq": for MT6797
> +       "mediatek,mt6765-sysirq", "mediatek,mt6577-sysirq": for MT6765
>         "mediatek,mt6755-sysirq", "mediatek,mt6577-sysirq": for MT6755
>         "mediatek,mt6592-sysirq", "mediatek,mt6577-sysirq": for MT6592
>         "mediatek,mt6589-sysirq", "mediatek,mt6577-sysirq": for MT6589
> diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
> index f73abff..742cb47 100644
> --- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
> +++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
> @@ -8,6 +8,7 @@ Required properties:
>    * "mediatek,mt6582-uart" for MT6582 compatible UARTS
>    * "mediatek,mt6589-uart" for MT6589 compatible UARTS
>    * "mediatek,mt6755-uart" for MT6755 compatible UARTS
> +  * "mediatek,mt6765-uart" for MT6765 compatible UARTS
>    * "mediatek,mt6795-uart" for MT6795 compatible UARTS
>    * "mediatek,mt6797-uart" for MT6797 compatible UARTS
>    * "mediatek,mt7622-uart" for MT7622 compatible UARTS
> --
> 1.7.9.5
>
