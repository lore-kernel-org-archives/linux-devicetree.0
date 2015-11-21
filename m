From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 01/14] DEVICETREE: Add bindings for PIC32 interrupt controller
Date: Sat, 21 Nov 2015 21:47:14 +0100
Message-ID: <7036408.cJ9oZKCcQe@wuerfel>
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com> <1448065205-15762-2-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448065205-15762-2-git-send-email-joshua.henderson@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joshua Henderson <joshua.henderson@microchip.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Cristian Birsan <cristian.birsan@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 20 November 2015 17:17:13 Joshua Henderson wrote:

> +Example
> +-------
> +
> +evic: interrupt-controller@1f810000 {
> +        compatible = "microchip,evic-v2";
> +        interrupt-controller;
> +        #interrupt-cells = <3>;
> +        reg = <0x1f810000 0x1000>;
> +        device_type="evic-v2";
> +};

This is not a correct use of device_type. Just drop that property.

> diff --git a/include/dt-bindings/interrupt-controller/microchip,pic32mz-evic.h b/include/dt-bindings/interrupt-controller/microchip,pic32mz-evic.h
> new file mode 100644
> index 0000000..2c466b8
> --- /dev/null
> +++ b/include/dt-bindings/interrupt-controller/microchip,pic32mz-evic.h
> @@ -0,0 +1,238 @@
> +/*
> + * This header provides constants for the MICROCHIP PIC32 EVIC.
> + */
> +
> +#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_MICROCHIP_EVIC_H
> +#define _DT_BINDINGS_INTERRUPT_CONTROLLER_MICROCHIP_EVIC_H
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/* Hardware interrupt number */
> +#define CORE_TIMER_INTERRUPT 0
> +#define CORE_SOFTWARE_INTERRUPT_0 1
> +#define CORE_SOFTWARE_INTERRUPT_1 2
> +#define EXTERNAL_INTERRUPT_0 3
> +#define TIMER1 4

A header file like this is just going to make everyone's life
miserable. Try to remove as much as possible here: normally
you can just use the numbers from the data sheet that match
the actual hardware registers, and put them into the dts file.

> +/* Interrupt priority bits */
> +#define PRI_0	0	/* Note:This priority disables the interrupt! */
> +#define PRI_1	1
> +#define PRI_2	2
> +#define PRI_3	3
> +#define PRI_4	4
> +#define PRI_5	5
> +#define PRI_6	6
> +#define PRI_7	7

> +/* Interrupt subpriority bits */
> +#define SUB_PRI_0	0
> +#define SUB_PRI_1	1
> +#define SUB_PRI_2	2
> +#define SUB_PRI_3	3

These are obviously silly and should be removed/

> +#define PRI_MASK	0x7	/* 3 bit priority mask */
> +#define SUBPRI_MASK	0x3	/* 2 bit subpriority mask */
> +#define INT_MASK	0x1F	/* 5 bit pri and subpri mask */
> +#define NR_EXT_IRQS	5	/* 5 external interrupts sources */
> +
> +#define MICROCHIP_EVIC_MIN_PRIORITY 0
> +#define MICROCHIP_EVIC_MAX_PRIORITY INT_MASK
> +
> +#define INT_PRI(pri, subpri)	\
> +	(((pri & PRI_MASK) << 2) | (subpri & SUBPRI_MASK))
> +
> +#define DEFINE_INT(irq, pri) { irq, pri }
> +
> +#define DEFAULT_INT_PRI INT_PRI(2, 0)

Is it required to have a specific priority configured for each line?
If these are software selectable, it's probably better to not put
them into DT in the first place.

If you absolutely need them, I would suggest using two separate cells
for pri and subpri so you can avoid the macro.

	Arnd
