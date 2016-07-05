From: Andi Shyti <andi@etezian.org>
Subject: Re: [PATCH] [media] rc: ir-spi: add support for IR LEDs connected
 with SPI
Date: Wed, 6 Jul 2016 00:08:26 +0900
Message-ID: <20160705150826.GG1257@jack.zhora.eu>
References: <1467362022-12704-1-git-send-email-andi.shyti@samsung.com>
 <20160705142211.GA19930@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160705142211.GA19930@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Andi Shyti <andi.shyti@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi@etezian.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> > The ir-spi is a simple device driver which supports the
> > connection between an IR LED and the MOSI line of an SPI device.
> 
> Please split the binding from the driver.

OK!

> > +Device tree bindings for IR LED connected through SPI bus which is used as
> > +remote controller.
> 
> Do said devices have part numbers? Seems kind of generic and I've never 
> seen such device.

No, it doesn't, this is a simple irled driven by the SPI MOSI
line that works as a remote controller.

It looked strange to me as well when I heard of it the first
time, but it will be present in the upcoming tm2/tm2e patchset 
(i.e. Samsung Note 4 and Note 4 edge).

> > +Optional properties:
> > +	- irled,switch: specifies the gpio switch which enables the irled
> 
> Just "switch-gpios"

OK!

> > +                controller-data {
> 
> This is part of the controller binding? Omit that from the example.

OK!

Thanks,
Andi
