From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] irqchip/atmel-aic5: add support for sam9x60 irqchip
Date: Fri, 13 Sep 2019 15:36:20 +0100
Message-ID: <5d7ba965.1c69fb81.ad771.5fc1@mx.google.com>
References: <1568026835-6646-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568026835-6646-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sandeep Sheriker Mallikarjun <sandeepsheriker.mallikarjun@microchip.com>
List-Id: devicetree@vger.kernel.org

On Mon, 9 Sep 2019 14:00:35 +0300, Claudiu Beznea wrote:
> From: Sandeep Sheriker Mallikarjun <sandeepsheriker.mallikarjun@microchip.com>
> 
> Add support for SAM9X60 irqchip.
> 
> Signed-off-by: Sandeep Sheriker Mallikarjun <sandeepsheriker.mallikarjun@microchip.com>
> [claudiu.beznea@microchip.com: update aic5_irq_fixups[], update
>  documentation]
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  .../devicetree/bindings/interrupt-controller/atmel,aic.txt     |  7 +++++--
>  drivers/irqchip/irq-atmel-aic5.c                               | 10 ++++++++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
