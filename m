From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 0/8] add power management support for SAM9X60
Date: Mon, 25 Feb 2019 11:46:22 +0100
Message-ID: <20190225104622.GA11983@piout.net>
References: <1550159642-26878-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550159642-26878-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu.Beznea@microchip.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com, linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14/02/2019 15:54:26+0000, Claudiu.Beznea@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
> 
> Hi,
> 
> This series add power management support for SAM9X60. The following
> platform specific power management modes were enabled for it:
> Idle, ULP0 and ULP1.
> 
> Thank you,
> Claudiu Beznea
> 
> Claudiu Beznea (8):
>   ARM: at91: pm: introduce at91_soc_pm structure
>   dt-bindings: arm: atmel: add binding for SAM9X60 SoC
>   ARM: at91: pm: initial PM support for SAM9X60
>   ARM: at91: pm: keep at91_pm_backup_init() only for SAMA5D2 SoCs
>   ARM: at91: pm: add support for per SoC wakeup source configuration
>   ARM: at91: pm: add ULP1 support for SAM9X60
>   ARM: at91: pm: disable RC oscillator in ULP0
>   ARM: at91: pm: do not disable/enable PLLA for ULP modes
> 

All applied.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
