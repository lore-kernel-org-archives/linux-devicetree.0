From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 3/4] irqchip: Add BCM2835 AUX interrupt controller
Date: Mon, 19 Jun 2017 14:13:52 -0700
Message-ID: <f68eed56-35b8-737e-008d-a8e993c7f6f1@gmail.com>
References: <4ceb6c92-f752-180e-6a6e-a94dcd120737@raspberrypi.org>
 <1497457750-35585-1-git-send-email-phil@raspberrypi.org>
 <1497457750-35585-4-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1497457750-35585-4-git-send-email-phil@raspberrypi.org>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Phil Elwell <phil@raspberrypi.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/14/2017 09:29 AM, Phil Elwell wrote:
> Devices in the BCM2835 AUX block share a common interrupt line, with a
> register indicating which devices have active IRQs. Expose this as a
> nested interrupt controller to avoid IRQ sharing problems (easily
> observed if UART1 and SPI1/2 are enabled simultaneously).
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> ---

> +/*
> + * The irq_mask and irq_unmask function pointers are used without
> + * validity checks, so they must not be NULL. Create a dummy function
> + * with the expected type for use as a no-op.
> + */
> +static void bcm2835_aux_irq_dummy(struct irq_data *data)
> +{
> +}
> +
> +static struct irq_chip bcm2835_aux_irq_chip = {
> +	.name = "bcm2835-aux_irq",
> +	.irq_mask = bcm2835_aux_irq_dummy,
> +	.irq_unmask = bcm2835_aux_irq_dummy,
> +};

So how are the interrupt enabled/disabled if this interrupt controller
just returns their pending state?
-- 
Florian
