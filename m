From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v2 02/10] irqchip: add irqchip driver for nuc900
Date: Thu, 21 Jul 2016 18:45:34 +0000
Message-ID: <20160721184534.GI5814@io.lakedaemon.net>
References: <1468135649-19980-1-git-send-email-vw@iommu.org>
 <16178876.fFBuoBSjbd@wuerfel>
 <CAKT61h8EkOOkDHou65Uc7NNomJ6Nowvw8o6JnWxNyc0S_=x_JA@mail.gmail.com>
 <1885052.EkH2ZADWZS@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1885052.EkH2ZADWZS@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Wan ZongShun <mcuos.com@gmail.com>, Wan Zongshun <vw@iommu.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, p.zabel@pengutronix.de
List-Id: devicetree@vger.kernel.org

Wan ZongShun,

On Fri, Jul 15, 2016 at 12:02:55PM +0200, Arnd Bergmann wrote:
> On Friday, July 15, 2016 5:44:50 PM CEST Wan ZongShun wrote:
> > 2016-07-15 15:00 GMT+08:00 Arnd Bergmann <arnd@arndb.de>:
> > > On Friday, July 15, 2016 1:15:58 PM CEST Wan Zongshun wrote:
...
> > > That assumes that REG_AIC_IPER contains a 32-bit value with one single
> > > bit set to indicate which IRQ was triggered.
> > >
> > > If the difference is only in performance, you could try measuring which
> > > of the two ends up being faster.
> > 
> > It seems hard to measure. I think Do IO operation should be slower
> > than shift 2. 
> 
> It depends on how fast that particular I/O path is. A lot of readl()
> operations are awfully slow, but the hardware design for the interrupt
> controller may in fact have optimized this to be reasonably fast.
> 
> Another option would be to avoid the shift and just use the raw value
> of the REG_AIC_IPER register as the hwirq, with a custom map()
> callback that turns shifts the number read from the DT two bits
> so it matches the register value.

Good idea.  Are the two lsb bits constant or do they need to be masked?

thx,

Jason.
