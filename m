From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: add mt6765 support
Date: Fri, 15 Jun 2018 10:54:18 +0200
Message-ID: <80bca2ae-eb08-3d6c-a863-140107286b2d@gmail.com>
References: <1528843243-29782-1-git-send-email-mars.cheng@mediatek.com>
 <1528843243-29782-3-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528843243-29782-3-git-send-email-mars.cheng@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org



On 13/06/18 00:40, Mars Cheng wrote:
> +
> +	uart0: serial@11002000 {
> +		compatible = "mediatek,mt6765-uart",
> +			     "mediatek,mt6577-uart";
> +		reg = <0 0x11002000 0 0x400>;
> +		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&uart_clk>;
> +		status = "disabled";
> +	};

You need "baud" and "bus" clock. Also add clock-names please.

> +
> +	uart1: serial@11003000 {
> +		compatible = "mediatek,mt6765-uart",
> +			     "mediatek,mt6577-uart";
> +		reg = <0 0x11003000 0 0x400>;
> +		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&uart_clk>;
> +		status = "disabled";

Same here obviously.

Regards,
Matthias
