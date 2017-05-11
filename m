From: Mason <slash.tmp-GANU6spQydw@public.gmane.org>
Subject: Supporting "software interrupts" in an irqchip driver
Date: Thu, 11 May 2017 18:04:38 +0200
Message-ID: <6a3bc1b5-0df9-c5f8-6102-60427d4cf616@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Thomas, Marc, Mark, (and the funky bunch)

The interrupt controller on my SoC supports so-called "software"
interrupts, meaning that the HW exposes a 32-bit register in which
SW can write some value.

If the value written is non-zero, then interrupt 0 is raised.

How is such a contraption defined in a device tree?

Are there good drivers to read as examples?
drivers/irqchip/irq-mips-cpu.c mentions "software interrupts"
in the context of "which we don't really use or support."

Regards.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
