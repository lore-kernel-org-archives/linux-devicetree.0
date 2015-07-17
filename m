From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 0/2] Add mt6580 basic chip support
Date: Sat, 18 Jul 2015 00:01:01 +0200
Message-ID: <1668730.VCkj7kaOSH@ubix>
References: <1436854029-16599-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436854029-16599-1-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Choui <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Scott Shu <scott.shu@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday, July 14, 2015 02:07:07 PM Mars Cheng wrote:
> Changes in v4:
> 1. Remove clocks node
> 2. Remove bootargs
> 3. Refine stdout-path setting
> 
> Changes in v3:
> 1. Remove useless Change-Id
> 2. Add complete device tree binding in Documentation
> 
> Changes in v2:
> 1. Use stdout-path in device tree to indicate console
> 2. Remove board-specific bootargs
> 
> Mars Cheng (2):
>   Document: DT: Add bindings for mediatek MT6580 SoC Platform
>   ARM: dts: mediatek: add mt6580 basic support
> 
>  Documentation/devicetree/bindings/arm/mediatek.txt |   4 +
>  .../bindings/arm/mediatek/mediatek,sysirq.txt      |   1 +
>  .../devicetree/bindings/serial/mtk-uart.txt        |   3 +-
>  .../bindings/timer/mediatek,mtk-timer.txt          |   6 +-
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/mt6580-evbp1.dts                 |  39 +++++++
>  arch/arm/boot/dts/mt6580.dtsi                      | 116
> +++++++++++++++++++++ 7 files changed, 168 insertions(+), 2 deletions(-)

Whole series applied to v4.2-next/dts

Thanks a lot.
