From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: gic: add OF based initialization
Date: Fri, 16 Sep 2011 15:04:11 +0530
Message-ID: <CAJuYYwQ=tSh8k5ZOi2kx6KbMsQ4eVAvgE=T4kdckRSLjdj3dMQ@mail.gmail.com>
References: <1316017900-19918-1-git-send-email-robherring2@gmail.com>
	<1316017900-19918-6-git-send-email-robherring2@gmail.com>
	<CAJuYYwSFu2HC+u2NY41+yw9tEyy85RKa4Dpm3SL+jbwS_OOA0A@mail.gmail.com>
	<4E71F593.2040903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4E71F593.2040903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 15 September 2011 18:24, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 09/15/2011 02:55 AM, Thomas Abraham wrote:
>> Hi Rob,
>>
>> On 14 September 2011 22:01, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>>
>>> This adds gic initialization using device tree data. The initialization
>>> functions are intended to be called by a generic OF interrupt
>>> controller parsing function once the right pieces are in place.
>>>
>>> PPIs are handled using 3rd cell of interrupts properties to specify the=
 cpu
>>> mask the PPI is assigned to.
>>>
>>> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>> =A0Documentation/devicetree/bindings/arm/gic.txt | =A0 53 +++++++++++++=
+++++++++++
>>> =A0arch/arm/common/gic.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 55 +++++++++++++++++++++++--
>>> =A0arch/arm/include/asm/hardware/gic.h =A0 =A0 =A0 =A0 =A0 | =A0 10 +++=
++
>>> =A03 files changed, 114 insertions(+), 4 deletions(-)
>>> =A0create mode 100644 Documentation/devicetree/bindings/arm/gic.txt
>>
>> [...]
>>
>>
>>> diff --git a/arch/arm/common/gic.c b/arch/arm/common/gic.c
>>> index d1ccc72..14de380 100644
>>> --- a/arch/arm/common/gic.c
>>> +++ b/arch/arm/common/gic.c
>>
>> [...]
>>
>>> +void __init gic_of_init(struct device_node *node, struct device_node *=
parent)
>>> +{
>>> + =A0 =A0 =A0 void __iomem *cpu_base;
>>> + =A0 =A0 =A0 void __iomem *dist_base;
>>> + =A0 =A0 =A0 int irq;
>>> + =A0 =A0 =A0 struct irq_domain *domain =3D &gic_data[gic_cnt].domain;
>>> +
>>> + =A0 =A0 =A0 if (WARN_ON(!node))
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>>> +
>>> + =A0 =A0 =A0 dist_base =3D of_iomap(node, 0);
>>> + =A0 =A0 =A0 WARN(!dist_base, "unable to map gic dist registers\n");
>>> +
>>> + =A0 =A0 =A0 cpu_base =3D of_iomap(node, 1);
>>> + =A0 =A0 =A0 WARN(!cpu_base, "unable to map gic cpu registers\n");
>>> +
>>> + =A0 =A0 =A0 domain->nr_irq =3D gic_irq_count(dist_base);
>>> + =A0 =A0 =A0 domain->irq_base =3D irq_alloc_descs(-1, 0, domain->nr_ir=
q, numa_node_id());
>>
>> For exynos4, all the interrupts originating from GIC are statically
>> mapped to start from 32 in the linux virq space (GIC SPI interrupts
>> start from 64). In the above code, since irq_base would be 0 for
>> exynos4, the interrupt mapping is not working correctly. In your
>> previous version of the patch, you have given a option to the platform
>> code to choose the offset. Could that option be added to this series
>> also. Or a provision to use platform specific translate function
>> instead of the irq_domain_simple translator.
>>
>
> So I guess you have the A9 external nIRQ hooked up to another
> controller? Why can't the 0-31 interrupts get mapped to after the gic
> interrupts? Ultimately we want h/w irq numbers completely decoupled from
> linux irq numbers. So you will want to put that controller in devicetree
> and have an DT init function for it as well.

There are chained interrupt handlers mapped in between linux irq
number 0 to 31. So the offset for GIC interrupts was set to 32 (SGI[0]
=3D 32). The interrupt chaining for the interrupts mapped between 0 to
31 seems unnecessary though. I will try removing them and check.

>
> In anycase, there's a simple solution. You just need a call to
> irq_alloc_descs to reserve the first 32 interrupts before calling
> of_irq_init.
>
> Rob
>

Thanks for your comments.

Regards,
Thomas.
