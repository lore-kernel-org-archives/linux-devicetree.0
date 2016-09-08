From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 1/4] Document: DT: Add bindings for mediatek MT6797 SoC
 Platform
Date: Thu, 8 Sep 2016 13:37:00 +0100
Message-ID: <57D15B6C.6080305@arm.com>
References: <1473331794-27542-1-git-send-email-mars.cheng@mediatek.com>
 <1473331794-27542-2-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473331794-27542-2-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Erin Lo <erin.lo@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>
Cc: linux-clk@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>, Loda Choui <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Scott Shu <scott.shu@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On 08/09/16 11:49, Mars Cheng wrote:
> This adds DT binding documentation for Mediatek MT6797.
> 
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.txt |    4 ++++
>  .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |    1 +
>  .../bindings/arm/mediatek/mediatek,imgsys.txt      |    1 +
>  .../bindings/arm/mediatek/mediatek,infracfg.txt    |    1 +
>  .../bindings/arm/mediatek/mediatek,mmsys.txt       |    1 +
>  .../bindings/arm/mediatek/mediatek,topckgen.txt    |    1 +
>  .../bindings/arm/mediatek/mediatek,vdecsys.txt     |    1 +
>  .../bindings/arm/mediatek/mediatek,vencsys.txt     |    3 ++-
>  .../interrupt-controller/mediatek,sysirq.txt       |    4 +++-
>  .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
>  10 files changed, 16 insertions(+), 2 deletions(-)

[...]

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> index 9d1d72c..3d97eb4 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> @@ -8,6 +8,7 @@ Required properties:
>  	"mediatek,mt8173-sysirq"
>  	"mediatek,mt8135-sysirq"
>  	"mediatek,mt8127-sysirq"
> +	"mediatek,mt6797-sysirq"
>  	"mediatek,mt6795-sysirq"
>  	"mediatek,mt6755-sysirq"
>  	"mediatek,mt6592-sysirq"
> @@ -21,7 +22,8 @@ Required properties:
>  - interrupt-parent: phandle of irq parent for sysirq. The parent must
>    use the same interrupt-cells format as GIC.
>  - reg: Physical base address of the intpol registers and length of memory
> -  mapped region.
> +  mapped region. Could be up to 2 registers here at max. Ex: 6797 needs 2 reg,
> +  others need 1.

Two things:

- Please make this a separate patch that can be reviewed independently
of the rest of the changes, which are just adding new compatible
identifiers.

- Why can't you simply expose it as a separate controller? Looking at
the way you're changing the corresponding driver, it looks like you're
simply adding an extra base/size. If you simply had a base for the
corresponding GIC interrupts, you could handle as many region as you
want, and have a more generic driver.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
