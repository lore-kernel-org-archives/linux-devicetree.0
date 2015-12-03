From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 02/11] MIPS: bmips: Add bcm6345-l2-timer interrupt controller
Date: Thu, 03 Dec 2015 17:22:39 +0000
Message-ID: <56607A5F.6090708@arm.com>
References: <565D9A40.60409@simon.arlott.org.uk> <565D9A73.3000500@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <565D9A73.3000500@simon.arlott.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>, Guenter Roeck <linux@roeck-us.net>, Thomas Gleixner <tglx@linutronix.de>
Cc: Florian Fainelli <f.fainelli@gmail.com>, MIPS Mailing List <linux-mips@linux-mips.org>, Jonas Gorski <jogo@openwrt.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Jason Cooper <jason@lakedaemon.net>, Kevin Cernekee <cernekee@gmail.com>, Wim Van Sebroeck <wim@iguana.be>, Maxime Bizon <mbizon@freebox.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-watchdog@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 01/12/15 13:02, Simon Arlott wrote:
> Add the BCM6345/BCM6318 timer as an interrupt controller so that it can be
> used by the watchdog to warn that its timer will expire soon.
> 
> Support for clocksource/clockevents is not implemented as the timer
> interrupt is not per CPU (except on the BCM6318) and the MIPS clock is
> better. This could be added later if required without changing the device
> tree binding.
> 
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
>  drivers/irqchip/Kconfig                |   5 +
>  drivers/irqchip/Makefile               |   1 +
>  drivers/irqchip/irq-bcm6345-l2-timer.c | 386 +++++++++++++++++++++++++++++++++
>  3 files changed, 392 insertions(+)
>  create mode 100644 drivers/irqchip/irq-bcm6345-l2-timer.c

I'm not sure how useful it is to have a bunch of timers that are just
turned off, but from an irqchip PoV:

Acked-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny...
