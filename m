From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: gic: add OF based initialization
Date: Mon, 19 Sep 2011 18:29:58 +0530
Message-ID: <CAJuYYwSZkPCyJ0PrLV4ScyOnK1X-49jPFiXU3ioy_cY0Os3-HQ@mail.gmail.com>
References: <1316017900-19918-1-git-send-email-robherring2@gmail.com>
	<1316017900-19918-6-git-send-email-robherring2@gmail.com>
	<CAJuYYwSFu2HC+u2NY41+yw9tEyy85RKa4Dpm3SL+jbwS_OOA0A@mail.gmail.com>
	<4E71F593.2040903@gmail.com>
	<CAJuYYwQ=tSh8k5ZOi2kx6KbMsQ4eVAvgE=T4kdckRSLjdj3dMQ@mail.gmail.com>
	<20110918061024.GD3523@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110918061024.GD3523-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On 18 September 2011 11:40, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Fri, Sep 16, 2011 at 03:04:11PM +0530, Thomas Abraham wrote:
>> Hi Rob,
>>
>> On 15 September 2011 18:24, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > On 09/15/2011 02:55 AM, Thomas Abraham wrote:
>> >>> +void __init gic_of_init(struct device_node *node, struct device_nod=
e *parent)
>> >>> +{
>> >>> + =A0 =A0 =A0 void __iomem *cpu_base;
>> >>> + =A0 =A0 =A0 void __iomem *dist_base;
>> >>> + =A0 =A0 =A0 int irq;
>> >>> + =A0 =A0 =A0 struct irq_domain *domain =3D &gic_data[gic_cnt].domai=
n;
>> >>> +
>> >>> + =A0 =A0 =A0 if (WARN_ON(!node))
>> >>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>> >>> +
>> >>> + =A0 =A0 =A0 dist_base =3D of_iomap(node, 0);
>> >>> + =A0 =A0 =A0 WARN(!dist_base, "unable to map gic dist registers\n");
>> >>> +
>> >>> + =A0 =A0 =A0 cpu_base =3D of_iomap(node, 1);
>> >>> + =A0 =A0 =A0 WARN(!cpu_base, "unable to map gic cpu registers\n");
>> >>> +
>> >>> + =A0 =A0 =A0 domain->nr_irq =3D gic_irq_count(dist_base);
>> >>> + =A0 =A0 =A0 domain->irq_base =3D irq_alloc_descs(-1, 0, domain->nr=
_irq, numa_node_id());
>> >>
>> >> For exynos4, all the interrupts originating from GIC are statically
>> >> mapped to start from 32 in the linux virq space (GIC SPI interrupts
>> >> start from 64). In the above code, since irq_base would be 0 for
>> >> exynos4, the interrupt mapping is not working correctly. In your
>> >> previous version of the patch, you have given a option to the platform
>> >> code to choose the offset. Could that option be added to this series
>> >> also. Or a provision to use platform specific translate function
>> >> instead of the irq_domain_simple translator.
>> >>
>> >
>> > So I guess you have the A9 external nIRQ hooked up to another
>> > controller? Why can't the 0-31 interrupts get mapped to after the gic
>> > interrupts? Ultimately we want h/w irq numbers completely decoupled fr=
om
>> > linux irq numbers. So you will want to put that controller in devicetr=
ee
>> > and have an DT init function for it as well.
>>
>> There are chained interrupt handlers mapped in between linux irq
>> number 0 to 31. So the offset for GIC interrupts was set to 32 (SGI[0]
>> =3D 32). The interrupt chaining for the interrupts mapped between 0 to
>> 31 seems unnecessary though. I will try removing them and check.
>
> Please note; when using the DT, the linux virq number should be
> dynamically assigned and therefore will not matter. =A0Historically
> Exynos may have started from irq 32, but it doesn't really have any
> relevance when all IRQ references are via DT irq specifiers.

Ok. But the exynos4 modules that have dt support depend on other
modules that are yet to get dt support. Those modules still use static
linux interrupt numbers and so until all the modules get dt support,
interrupt number specified in dt would have to follow the static
numbering that the rest of the system uses.

So to use Rob's patches for exynos4 dt, the interrupts mapped in the
range 1 to 31 will have to be reworked or moved to some other irq
numbers.

>
> Plus, for dynamically allocated irq_descs, I really want to make sure
> that irq 0 never gets assigned. =A0We're not supposed to be using it,
> and that becomes an easy rule to enforce when interrupt numbers are no
> longer assigned with #defines.
>
> g.
>

Thanks,
Thomas.
