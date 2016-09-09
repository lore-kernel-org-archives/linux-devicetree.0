From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 3/4] arm64: arch_timer: Work around QorIQ Erratum
 A-008585
Date: Fri, 9 Sep 2016 08:06:44 +0100
Message-ID: <20160909080644.5fbc2f68@why.wild-wind.fr.eu.org>
References: <1467877572-10817-1-git-send-email-oss@buserror.net>
        <1467877572-10817-3-git-send-email-oss@buserror.net>
        <20160826134004.7e86e798@arm.com>
        <57D246AE.8040900@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57D246AE.8040900-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 9 Sep 2016 13:20:46 +0800
Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:

Hi Ding,

> > I'm still worried that this series doesn't address Xen or KVM guests
> > that need to be made aware of the broken timers.
> >   
> Hi Marc:
> 
> I think "ARCH_TIMER_REG_READ("cntv_tval_el0", arch_timer_get_vtval)"
> could cover the tval changes in KVM guest, and I fould the guest
> still use the get_cycles() to get the timer cycles, if I miss
> something, please remind me, thanks.

You're missing the point that to tell the guest that the HW has this
erratum, we need the DT to be populated with the right property.

> > At the very least, I'd like a kernel command line option that'd let
> > the user reliably run its VMs. You can do something along the lines
> > of 46fd5c6b, and have a command line argument like
> > "clocksource.arm_arch_timer.fsl-a008585=1", which would enable the
> > workaround.
> >   
> 
> I don't think adding in command line is a good solution for this bug,
> we should not told the OS user how to fix it by adding command line
> option, and need to fix it by dts or ACPI.

Sure. I'm happy to review the patches that will:
- Add a new KVM kernel API describing properties for the timer so that
  we can expose the erratum from the kernel to userspace
- Add a similar API for Xen
- Have all the userspace (QEMU, kvmtool, the Xen tools) to be converted
  to use this new API so that they can emit the correct DT
- Point to a change in the ACPI spec so that we can encode errata there
- Add support for handling this erratum using ACPI in the kernel
- Allow QEMU and the Xen tools to expose this erratum in the guests
  ACPI tables

Unless you're in a position to write all this code (and
specifications), and post the patches *now*, I'll stand by my
recommendation to have a command-line option. Not exposing this issue
to the guest results in unreliable operations. You may not care, but I
do.

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
