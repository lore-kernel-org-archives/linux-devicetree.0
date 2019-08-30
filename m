From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 0/2] irqchip/meson-gpio: add sm1 support
Date: Fri, 30 Aug 2019 15:01:29 +0100
Message-ID: <b6f1c3d5-9098-03c6-b843-6eb2ddbe35a9@arm.com>
References: <20190829161635.25067-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829161635.25067-1-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 29/08/2019 17:16, Jerome Brunet wrote:
> This patchset adds support for the new sm1 SoC family in the Amlogic gpio
> interrupt controller.
> 
> Jerome Brunet (2):
>   dt-bindings: interrupt-controller: new binding for the meson sm1 SoCs
>   irqchip/meson-gpio: Add support for meson sm1 SoCs
> 
>  .../amlogic,meson-gpio-intc.txt               |  1 +
>  drivers/irqchip/irq-meson-gpio.c              | 52 ++++++++++++++-----
>  2 files changed, 39 insertions(+), 14 deletions(-)
> 

Applied to irqchip-next.

	M.
-- 
Jazz is not dead. It just smells funny...
