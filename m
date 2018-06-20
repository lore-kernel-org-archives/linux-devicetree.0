From: Mars Cheng <mars.cheng@mediatek.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: add mt6765 support
Date: Wed, 20 Jun 2018 08:18:07 +0800
Message-ID: <1529453887.8701.0.camel@mtkswgap22>
References: <1528843243-29782-1-git-send-email-mars.cheng@mediatek.com>
         <1528843243-29782-3-git-send-email-mars.cheng@mediatek.com>
         <80bca2ae-eb08-3d6c-a863-140107286b2d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <80bca2ae-eb08-3d6c-a863-140107286b2d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi Matthias

On Fri, 2018-06-15 at 10:54 +0200, Matthias Brugger wrote:
> 
> On 13/06/18 00:40, Mars Cheng wrote:
> > +
> > +	uart0: serial@11002000 {
> > +		compatible = "mediatek,mt6765-uart",
> > +			     "mediatek,mt6577-uart";
> > +		reg = <0 0x11002000 0 0x400>;
> > +		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks = <&uart_clk>;
> > +		status = "disabled";
> > +	};
> 
> You need "baud" and "bus" clock. Also add clock-names please.

Got it, will add them in V2

> 
> > +
> > +	uart1: serial@11003000 {
> > +		compatible = "mediatek,mt6765-uart",
> > +			     "mediatek,mt6577-uart";
> > +		reg = <0 0x11003000 0 0x400>;
> > +		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks = <&uart_clk>;
> > +		status = "disabled";
> 
> Same here obviously.

Will fixed in V2.

Thanks.
> 
> Regards,
> Matthias
