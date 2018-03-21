From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 0/3] ARM: dts: at91: cleanup pullup on uarts
Date: Wed, 21 Mar 2018 21:50:45 +0100
Message-ID: <20180321205045.GA19753@piout.net>
References: <20180321153552.29213-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180321153552.29213-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 21/03/2018 at 16:35:49 +0100, Peter Rosin wrote:
> Hi!
> 
> I noticed a *LOT* of pointless pullups and missing pullups related
> to uart/usart pins. These patches fixes what I found.
> 
> I separated out the two changes that had pullup on neither rx nor tx,
> since there might exist some reason for that? But a pullup on tx and
> a missing pullup on rx is a sure sign of confusion, so I lumped all
> those fixes in one big patch.
> 
> One or two of the removed comments with duplicate info where wrong
> as well, i.e. the info was supposed to be duplicate but wasn't.
> 
> Cheers,
> Peter
> 
> Peter Rosin (3):
>   ARM: dts: at91: fixes uart pinctrl, set pullup on rx, clear pullup on
>     tx
>   ARM: dts: at91rm9200: pullup rx on uart0
>   ARM: dts: at91sam9260: pullup rx on usart0
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
