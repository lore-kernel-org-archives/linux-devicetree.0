From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 0/6] Add support for the ICU unit in Marvell Armada 7K/8K
Date: Tue, 30 May 2017 15:15:54 +0100
Message-ID: <cc93efea-84ea-970d-914a-141241b8cace@arm.com>
References: <1496135772-20694-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496135772-20694-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thomas,

On 30/05/17 10:16, Thomas Petazzoni wrote:
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
> 
>  - The first two patches are the Device Tree binding patches
> 
>  - The third patch is a minimal driver for the GICP unit. All it does
>    is clear interrupts that may have been left pending by the
>    firmware.
> 
>  - The fourth patch is the most important done, which adds the driver
>    for the ICU itself.
> 
>  - The fifth patch adjust Kconfig.platforms to select the GICP and ICU
>    drivers.
> 
>  - The last patch adjusts the Device Tree files of the Armada 7K/8K to
>    use the ICU.

For a first drop, this looks quite good, and the few comments I've had
should be pretty easy to address. Looking forward to reviewing v2.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
