From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 05/12] MIPS: GIC: Add device-tree support
Date: Sat, 30 Aug 2014 09:54:40 +0200
Message-ID: <15153439.zUXECAnL7k@wuerfel>
References: <1409350479-19108-1-git-send-email-abrestic@chromium.org> <1409350479-19108-6-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409350479-19108-6-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jeffrey Deans <jeffrey.deans-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 29 August 2014 15:14:32 Andrew Bresticker wrote:
> Add device-tree support for the MIPS GIC.  With DT, no per-platform
> static device interrupt mapping is supplied and instead all device
> interrupts are specified through the DT.  The GIC-to-CPU interrupts
> must also be specified in the DT.
> 
> Platforms using DT-based probing of the GIC need only supply the
> GIC_NUM_INTRS and, if necessary, MIPS_GIC_IRQ_BASE values and
> call of_irq_init() with an of_device_id table including the GIC.
> 
> Currenlty only legacy and vecotred interrupt modes are supported.
> 
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  arch/mips/include/asm/gic.h |  15 ++++++
>  arch/mips/kernel/irq-gic.c  | 122 +++++++++++++++++++++++++++++++++++++++++++-
> 


Can you move this to drivers/irqchip and use the IRQCHIP_DECLARE()
macro to define the entry point?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
