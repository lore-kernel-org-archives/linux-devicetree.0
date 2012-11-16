From: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/5] ARM: kernel: smp_setup_processor_id() updates
Date: Fri, 16 Nov 2012 11:17:23 +0100
Message-ID: <CAKfTPtBT9Hnv0Bop-RAg69zp=AcgTy4rvCbiXScdnU8QkoEBSQ@mail.gmail.com>
References: <1352983614-22924-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1352983614-22924-2-git-send-email-lorenzo.pieralisi@arm.com>
 <20121115134951.GF5570@mudshark.cambridge.arm.com>
 <20121115141808.GA23513@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121115141808.GA23513-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 15 November 2012 15:18, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> [CC'ed Vincent following MPIDR mask query]
>
> On Thu, Nov 15, 2012 at 01:49:51PM +0000, Will Deacon wrote:
>> On Thu, Nov 15, 2012 at 12:46:50PM +0000, Lorenzo Pieralisi wrote:
>> > This patch applies some basic changes to the smp_setup_processor_id()
>> > ARM implementation to make the code that builds cpu_logical_map more
>> > uniform across the kernel.
>> >
>> > The function now prints the full extent of the boot CPU MPIDR[23:0] and
>> > initializes the cpu_logical_map for CPUs up to nr_cpu_ids.
>> >
>> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
>> > ---
>> >  arch/arm/kernel/setup.c | 7 ++++---
>> >  1 file changed, 4 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
>> > index da1d1aa..d0df6c8 100644
>> > --- a/arch/arm/kernel/setup.c
>> > +++ b/arch/arm/kernel/setup.c
>> > @@ -426,13 +426,14 @@ int __cpu_logical_map[NR_CPUS];
>> >  void __init smp_setup_processor_id(void)
>> >  {
>> >     int i;
>> > -   u32 cpu = is_smp() ? read_cpuid_mpidr() & 0xff : 0;
>> > +   u32 mpidr = is_smp() ? read_cpuid_mpidr() & 0xffffff : 0;
>> > +   u32 cpu = mpidr & 0xff;
>>
>> Can we move the #defines out of topology.c and use those instead of magic
>> masks please? You could use MPIDR_HWID_BITMASK, although the LEVEL mask
>> definitions over there don't look right to me (MPIDR_LEVEL0_MASK is 0x3?)
>
> Yes, I should have done that, you are right. LEVEL0 and LEVEL1 masks look
> wrong to me.
>
> #define MPIDR_LEVEL0_MASK 0x3
> #define MPIDR_LEVEL1_MASK 0xF
>
> Vincent, why are they defined with those values ? They should all be
> defined as 0xFF.

IIRC, These field are defined to 8bits width by default in the ARM ARM
but the Cortex A-9 implementation reduced the usage to 2 bits for CPU
ID and 4 bits for cluster ID. I had choose this implementation because
it was the only one available at the moment.
Now we might come back to the full width range

Vincent

>
> I will fix them and move them to a header file.
>
> Thanks,
> Lorenzo
>
