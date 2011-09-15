From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: gic: add OF based initialization
Date: Thu, 15 Sep 2011 07:54:43 -0500
Message-ID: <4E71F593.2040903@gmail.com>
References: <1316017900-19918-1-git-send-email-robherring2@gmail.com>
	<1316017900-19918-6-git-send-email-robherring2@gmail.com>
	<CAJuYYwSFu2HC+u2NY41+yw9tEyy85RKa4Dpm3SL+jbwS_OOA0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAJuYYwSFu2HC+u2NY41+yw9tEyy85RKa4Dpm3SL+jbwS_OOA0A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/15/2011 02:55 AM, Thomas Abraham wrote:
> Hi Rob,
> 
> On 14 September 2011 22:01, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>
>> This adds gic initialization using device tree data. The initialization
>> functions are intended to be called by a generic OF interrupt
>> controller parsing function once the right pieces are in place.
>>
>> PPIs are handled using 3rd cell of interrupts properties to specify the cpu
>> mask the PPI is assigned to.
>>
>> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/arm/gic.txt |   53 ++++++++++++++++++++++++
>>  arch/arm/common/gic.c                         |   55 +++++++++++++++++++++++--
>>  arch/arm/include/asm/hardware/gic.h           |   10 +++++
>>  3 files changed, 114 insertions(+), 4 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/arm/gic.txt
> 
> [...]
> 
> 
>> diff --git a/arch/arm/common/gic.c b/arch/arm/common/gic.c
>> index d1ccc72..14de380 100644
>> --- a/arch/arm/common/gic.c
>> +++ b/arch/arm/common/gic.c
> 
> [...]
> 
>> +void __init gic_of_init(struct device_node *node, struct device_node *parent)
>> +{
>> +       void __iomem *cpu_base;
>> +       void __iomem *dist_base;
>> +       int irq;
>> +       struct irq_domain *domain = &gic_data[gic_cnt].domain;
>> +
>> +       if (WARN_ON(!node))
>> +               return;
>> +
>> +       dist_base = of_iomap(node, 0);
>> +       WARN(!dist_base, "unable to map gic dist registers\n");
>> +
>> +       cpu_base = of_iomap(node, 1);
>> +       WARN(!cpu_base, "unable to map gic cpu registers\n");
>> +
>> +       domain->nr_irq = gic_irq_count(dist_base);
>> +       domain->irq_base = irq_alloc_descs(-1, 0, domain->nr_irq, numa_node_id());
> 
> For exynos4, all the interrupts originating from GIC are statically
> mapped to start from 32 in the linux virq space (GIC SPI interrupts
> start from 64). In the above code, since irq_base would be 0 for
> exynos4, the interrupt mapping is not working correctly. In your
> previous version of the patch, you have given a option to the platform
> code to choose the offset. Could that option be added to this series
> also. Or a provision to use platform specific translate function
> instead of the irq_domain_simple translator.
> 

So I guess you have the A9 external nIRQ hooked up to another
controller? Why can't the 0-31 interrupts get mapped to after the gic
interrupts? Ultimately we want h/w irq numbers completely decoupled from
linux irq numbers. So you will want to put that controller in devicetree
and have an DT init function for it as well.

In anycase, there's a simple solution. You just need a call to
irq_alloc_descs to reserve the first 32 interrupts before calling
of_irq_init.

Rob
