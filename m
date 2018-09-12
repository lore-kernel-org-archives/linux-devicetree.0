From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] ARM: dts: at91: sama5d2_ptc_ek: fix nand pinctrl
Date: Wed, 12 Sep 2018 12:38:56 +0200
Message-ID: <20180912103856.GA2760@piout.net>
References: <20180907081851.15911-1-ludovic.desroches@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180907081851.15911-1-ludovic.desroches@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, nicolas.ferre@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/09/2018 10:18:51+0200, Ludovic Desroches wrote:
> The drive strength has to be set to medium otherwise some data
> corruption may happen.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> ---
> 
> Hi,
> 
> This fix depends on the support of the drive-strength for the atmel pio4
> pinctroller. It has been added in v4.19 but I omitted to send it at the
> same time.
> 
> Ludovic
> 
>  arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
