From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 0/6] Add support for the ICU unit in Marvell Armada
 7K/8K
Date: Wed, 21 Jun 2017 16:14:21 +0100
Message-ID: <e87dc80c-f85c-1b20-c2e8-cd03922dacd9@arm.com>
References: <20170621132917.14187-1-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170621132917.14187-1-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21/06/17 14:29, Thomas Petazzoni wrote:
> Hello,
> 
> The Marvell Armada 7K/8K SoCs are composed of two parts: the AP (which
> contains the CPU cores) and the CP (which contains most
> peripherals). The 7K SoCs have one CP, while the 8K SoCs have two CPs,
> doubling the number of available peripherals.
> 
> In terms of interrupt handling, all devices in the CPs are connected
> through wired interrupt to a unit called ICU located in each CP. This
> unit converts the wired interrupts from the devices into memory
> transactions.
> 
> Inside the AP, there is a GIC extension called GICP, which allows a
> memory write transaction to trigger a GIC SPI interrupt. The ICUs in
> each CP are therefore configured to trigger a memory write into the
> appropriate GICP register so that a wired interrupt from a CP device
> is converted into a memory write, itself converted into a regular GIC
> SPI interrupt.
> 
> Until now, the configuration of the ICU was done statically by the
> firmware, and therefore the Device Tree files in Linux were specifying
> directly GIC interrupts for the interrupts of CP devices. However,
> with the growing number of devices in the CP, a static allocation
> scheme doesn't work for the long term.
> 
> This patch series therefore makes Linux aware of the ICU: GIC SPI
> interrupts are dynamically allocated, and the ICU is configured
> accordingly to route a CP wired interrupt to the allocated GIC SPI
> interrupt.
> 
> In detail:

[...]

> Thomas Petazzoni (6):
>   dt-bindings: interrupt-controller: add DT binding for the Marvell GICP
>   dt-bindings: interrupt-controller: add DT binding for the Marvell ICU
>   irqchip: irq-mvebu-gicp: new driver for Marvell GICP
>   irqchip: irq-mvebu-icu: new driver for Marvell ICU
>   arm64: marvell: enable ICU and GICP drivers
>   arm64: dts: marvell: enable GICP and ICU on Armada 7K/8K
> 
>  .../bindings/interrupt-controller/marvell,gicp.txt |  27 ++
>  .../bindings/interrupt-controller/marvell,icu.txt  |  51 ++++
>  arch/arm64/Kconfig.platforms                       |   2 +
>  arch/arm64/boot/dts/marvell/armada-ap806.dtsi      |   7 +
>  .../boot/dts/marvell/armada-cp110-master.dtsi      |  59 +++--
>  .../arm64/boot/dts/marvell/armada-cp110-slave.dtsi |  55 ++--
>  drivers/irqchip/Kconfig                            |   6 +
>  drivers/irqchip/Makefile                           |   2 +
>  drivers/irqchip/irq-mvebu-gicp.c                   | 279 ++++++++++++++++++++
>  drivers/irqchip/irq-mvebu-gicp.h                   |  12 +
>  drivers/irqchip/irq-mvebu-icu.c                    | 289 +++++++++++++++++++++
>  .../dt-bindings/interrupt-controller/mvebu-icu.h   |  15 ++
>  12 files changed, 756 insertions(+), 48 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt
>  create mode 100644 drivers/irqchip/irq-mvebu-gicp.c
>  create mode 100644 drivers/irqchip/irq-mvebu-gicp.h
>  create mode 100644 drivers/irqchip/irq-mvebu-icu.c
>  create mode 100644 include/dt-bindings/interrupt-controller/mvebu-icu.h
> 

It all looks good to me. How do we merge this? I take the first five
patches and Gregory takes the last one?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
