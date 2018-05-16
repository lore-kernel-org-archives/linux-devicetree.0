From: Yixun Lan <yixun.lan@amlogic.com>
Subject: Re: [PATCH 0/3] irqchip: meson-gpio: add support for Meson-AXG SoCs
Date: Wed, 16 May 2018 10:50:24 +0800
Message-ID: <0c97c61b-c05b-21cf-c880-80cff04ed6f2@amlogic.com>
References: <20180408145700.23520-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180408145700.23520-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, Kevin Hilman <khilman@baylibre.com>
Cc: yixun.lan@amlogic.com, Carlo Caione <carlo@caione.org>, Jerome Brunet <jbrunet@baylibre.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh@kernel.org>, Xingyu Chen <xingyu.chen@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Marc (or anyone else)

On 04/08/18 22:56, Yixun Lan wrote:
>   This series try to add GPIO interrupt controller support for Meson-AXG SoCs.
>   The first patch is a trivial typo fix, I can fold the first two patches
> together if necessary.
> 
> Yixun Lan (3):
>   dt-bindings: interrupt-controller: fix the double quotes
>   dt-bindings: interrupt-controller: New binding for Meson-AXG SoC
>   irqchip/meson-gpio: add support for Meson-AXG SoCs
> 
>  .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt | 11 ++++++-----
>  drivers/irqchip/irq-meson-gpio.c                              |  5 +++++
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 

please consider this merely a ping..
will you take this series, or is there anything holding this?

thanks

Yixun
