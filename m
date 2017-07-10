From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/6] irqchip: brcmstb-l2: Add support for the BCM7271 L2
 controller
Date: Mon, 10 Jul 2017 10:53:15 -0500
Message-ID: <20170710155315.2sa6k3auolxpo2ns@rob-hp-laptop>
References: <20170707192016.13001-1-opendmb@gmail.com>
 <20170707192016.13001-7-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170707192016.13001-7-opendmb@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Berger <opendmb@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:IRQCHIP DRIVERS" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 07, 2017 at 12:20:16PM -0700, Doug Berger wrote:
> Add the initialization of the generic irq chip for the BCM7271 L2
> interrupt controller.  This controller only supports level
> interrupts and uses the "brcm,bcm7271-l2-intc" compatibility
> string.
> 
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> ---
>  .../bindings/interrupt-controller/brcm,l2-intc.txt |  3 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/irqchip/irq-brcmstb-l2.c                   | 86 ++++++++++++++++------
>  2 files changed, 66 insertions(+), 23 deletions(-)
