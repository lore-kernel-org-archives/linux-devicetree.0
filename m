From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v2] microblaze: Change NO_IRQ to 0
Date: Tue, 20 Dec 2011 10:52:08 +0100
Message-ID: <4EF05AC8.8040707@monstr.eu>
References: <1324304394-5655-1-git-send-email-monstr@monstr.eu> <4EEFC38C.4010201@gmail.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4EEFC38C.4010201@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryan Mallon <rmallon@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

>> As has been discussed many times[1], Using NO_IRQ set to anything other
>> than 0 is bug waiting to happen since many drivers follow the pattern
>> "if (!irq)" for testing whether or not an irq has been set.
>>
>> This patch changes the Microblaze NO_IRQ setting from -1 to 0 to bring
>> it in line with most of the rest of the kernel.  It also prepares for
>> Microblaze eventually supporting multiple interrupt controllers by
>> breaking the assumption that hwirq# == Linux IRQ#.  The Linux IRQ
>> number is just a cookie with no guarantee of a direct relationship
>> with the hardware irq arrangement.
>>
>> At this point, Microblaze interrupt handling only supports only one
>> instance of one kind of interrupt controller (xilinx_intc).  This change
>> shouldn't affect any architecture code outside of the interrupt
>> controller driver and the irq_of mapping.
>>
>> Updated to 3.2 and to use irq_data.hwirq by Rob Herring.
>> Tested and fixed by Michal Simek.
>>
>> [1] http://lkml.org/lkml/2005/11/21/221
>>
>> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
>> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
>> Signed-off-by: Michal Simek <monstr@monstr.eu>
> 
> <snip>
> 
>>  extern unsigned int nr_irq;
>>  
>> -#define NO_IRQ (-1)
>> +#define NO_IRQ 0
> 
> IIUC, NO_IRQ should actually be removed in favour of testing against
> zero explictly. On Linus' latest tree there are three appearances of
> NO_IRQ in arch/microblaze: this definition and two uses and
> arch/microblaze/pci/pci-common.c. The latter should be removed by this
> patch. I assume there are still uses of NO_IRQ in drivers used by
> microblaze which prevent removal of NO_IRQ completely?

yeah, there are some drivers which we share with ppc.
I will look at/fix them and then remove NO_IRQ from arch.

drivers/net/ethernet/xilinx/xilinx_emaclite.c:1132:     if (rc == NO_IRQ) {
drivers/net/ethernet/xilinx/ll_temac_main.c:1080:       if ((lp->rx_irq == NO_IRQ) || (lp->tx_irq == NO_IRQ)) {
drivers/input/serio/xilinx_ps2.c:256:   if (of_irq_to_resource(ofdev->dev.of_node, 0, &r_irq) == NO_IRQ) {
drivers/block/xsysace.c:459:    if (ace->irq == NO_IRQ)
drivers/block/xsysace.c:1037:   if (ace->irq != NO_IRQ) {
drivers/block/xsysace.c:1042:                   ace->irq = NO_IRQ;
drivers/block/xsysace.c:1089:   if (ace->irq != NO_IRQ)
drivers/block/xsysace.c:1159:   int irq = NO_IRQ;

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
