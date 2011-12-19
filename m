From: Ryan Mallon <rmallon@gmail.com>
Subject: Re: [PATCH v2] microblaze: Change NO_IRQ to 0
Date: Tue, 20 Dec 2011 10:06:52 +1100
Message-ID: <4EEFC38C.4010201@gmail.com>
References: <1324304394-5655-1-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1324304394-5655-1-git-send-email-monstr@monstr.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On 20/12/11 01:19, Michal Simek wrote:

> As has been discussed many times[1], Using NO_IRQ set to anything other
> than 0 is bug waiting to happen since many drivers follow the pattern
> "if (!irq)" for testing whether or not an irq has been set.
> 
> This patch changes the Microblaze NO_IRQ setting from -1 to 0 to bring
> it in line with most of the rest of the kernel.  It also prepares for
> Microblaze eventually supporting multiple interrupt controllers by
> breaking the assumption that hwirq# == Linux IRQ#.  The Linux IRQ
> number is just a cookie with no guarantee of a direct relationship
> with the hardware irq arrangement.
> 
> At this point, Microblaze interrupt handling only supports only one
> instance of one kind of interrupt controller (xilinx_intc).  This change
> shouldn't affect any architecture code outside of the interrupt
> controller driver and the irq_of mapping.
> 
> Updated to 3.2 and to use irq_data.hwirq by Rob Herring.
> Tested and fixed by Michal Simek.
> 
> [1] http://lkml.org/lkml/2005/11/21/221
> 
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Signed-off-by: Michal Simek <monstr@monstr.eu>

<snip>

>  extern unsigned int nr_irq;
>  
> -#define NO_IRQ (-1)
> +#define NO_IRQ 0

IIUC, NO_IRQ should actually be removed in favour of testing against
zero explictly. On Linus' latest tree there are three appearances of
NO_IRQ in arch/microblaze: this definition and two uses and
arch/microblaze/pci/pci-common.c. The latter should be removed by this
patch. I assume there are still uses of NO_IRQ in drivers used by
microblaze which prevent removal of NO_IRQ completely?

~Ryan
