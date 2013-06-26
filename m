From: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] early init and DT platform devices allocation/registration
Date: Wed, 26 Jun 2013 15:20:32 +0900
Message-ID: <CANqRtoTVoLHLvhknpKW4th6wDM1EgY4GTx96OrM-yA42+Sm1aw@mail.gmail.com>
References: <20130624163340.GB26084@e102568-lin.cambridge.arm.com>
 <CACxGe6sPaV-sBz=SF46KdUexjAhWKGrMpG_ty+K26f6ZU5iKdg@mail.gmail.com>
 <51C9AF96.3040107@wwwdotorg.org>
 <20130625170700.GB28654@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130625170700.GB28654-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
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
Cc: "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lorenzo,

On Wed, Jun 26, 2013 at 2:07 AM, Lorenzo Pieralisi
<lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> On Tue, Jun 25, 2013 at 03:56:22PM +0100, Stephen Warren wrote:
>> On 06/25/2013 05:45 AM, Grant Likely wrote:
>> > On Mon, Jun 24, 2013 at 5:33 PM, Lorenzo Pieralisi
>> > <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
>> >> Hi all,
>> >>
>> >> I am dealing with a lingering problem related to init and probing of platform
>> >> devices early (before initcalls) in the kernel boot process. The problem,
>> >> which is nothing new, is related to how platform devices are created in the
>> >> kernel from DT and when they become available. Platform devices are created
>> >> through (assuming any legacy static initialization is removed from the kernel)
>> >>
>> >> of_platform_populate()
>> >>
>> >> at arch_initcall time on ARM. This is a problem for drivers that need to be
>> >> probed and initialized before arch_initcall (ie early_initcall) because
>> >> the corresponding platform_device has not been created yet.
>>
>> What's the use-case here; why does the driver /have/ to be
>> allocated/probed so early? Can't drivers all be allocated from DT in the
>> usual fashion, and any dependencies resolved using deferred probe? In
>> almost all cases, that should work.
>
> The driver must be initialized in order to boot secondary CPUs, so
> very very early, its initialization cannot be deferred.
> Otherwise we would end up with MCPM back-end having to add ad-hoc
> kludges to boot secondary CPUs, and then replace the early function calls
> to the power controller drivers when the power controller has been
> properly initialized. Feasible, but really horrible.

How about moving part of the SMP initialization to later during boot?

In particular I mean the bring up of the secondary cores. Just booting
with a single CPU for a bit longer is certainly doable because it is
today possible to bring secondary CPU cores up from user space via the
hotplug interface. Below is some old prototype code that I hacked up a
while ago - note that I copied the original comment about that this
should be done in user space. =)

I'd like to have secondary CPU cores initialized later so I can use
the regular device model (DT or platform device) to describe one or
more power domain hardware devices. These power domains control the
CPU cores, so there is a dependency on the SMP bring up code...

Cheers,

/ magnus

--- 0001/include/linux/smp.h
+++ work/include/linux/smp.h    2013-05-21 20:08:42.000000000 +0900
@@ -124,6 +124,7 @@ void smp_prepare_boot_cpu(void);
 extern unsigned int setup_max_cpus;
 extern void __init setup_nr_cpu_ids(void);
 extern void __init smp_init(void);
+extern void __init smp_late_init(void);

 #else /* !SMP */

--- 0001/init/main.c
+++ work/init/main.c    2013-05-21 20:09:34.000000000 +0900
@@ -334,6 +334,7 @@ static void __init smp_init(void)

 static inline void setup_nr_cpu_ids(void) { }
 static inline void smp_prepare_cpus(unsigned int maxcpus) { }
+static inline void smp_late_init(void) { }
 #endif

 /*
@@ -879,6 +880,8 @@ static noinline void __init kernel_init_

        do_basic_setup();

+       smp_late_init();
+
        /* Open the /dev/console on the rootfs, this should never fail */
        if (sys_open((const char __user *) "/dev/console", O_RDWR, 0) < 0)
                pr_err("Warning: unable to open an initial console.\n");
--- 0001/kernel/smp.c
+++ work/kernel/smp.c   2013-05-21 20:07:06.000000000 +0900
@@ -549,6 +549,20 @@ void __init smp_init(void)
                if (!cpu_online(cpu))
                        cpu_up(cpu);
        }
+}
+
+/* Called by boot processor late during boot to activate the rest. */
+void __init smp_late_init(void)
+{
+       unsigned int cpu;
+
+       /* FIXME: This should be done in userspace --RR */
+       for_each_present_cpu(cpu) {
+               if (num_online_cpus() >= setup_max_cpus)
+                       break;
+               if (!cpu_online(cpu))
+                       cpu_up(cpu);
+       }

        /* Any cleanup work */
        printk(KERN_INFO "Brought up %ld CPUs\n", (long)num_online_cpus());


Cheers,

/ magnus
