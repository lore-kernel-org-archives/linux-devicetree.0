From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 5/5] arm64: qcom: add cpu operations
Date: Wed, 15 Apr 2015 15:46:32 +0100
Message-ID: <20150415144630.GA22741@localhost>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org>
 <1428601031-5366-6-git-send-email-galak@codeaurora.org>
 <20150414162953.GL28709@leverpostej>
 <2167031.4Enm47D6vo@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2167031.4Enm47D6vo@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Abhimanyu Kapur <abhimany-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 14, 2015 at 10:51:40PM +0200, Arnd Bergmann wrote:
> On Tuesday 14 April 2015 17:29:53 Mark Rutland wrote:
> > > +static int msm_cpu_boot(unsigned int cpu)
> > > +{
> > > +       int ret = 0;
> > > +
> > > +       if (per_cpu(cold_boot_done, cpu) == false) {
> > > +               ret = msm_unclamp_secondary_arm_cpu(cpu);
> > > +               if (ret)
> > > +                       return ret;
> > > +               per_cpu(cold_boot_done, cpu) = true;
> > > +       }
> > > +       return secondary_pen_release(cpu);
> > > +}
> > 
> > Ah, so cold_boot_done is for pseudo-hotplug. Absolute NAK to that.
> > 
> > The only thing this gives you over spin-table is one-time powering up of
> > the CPUs that can be performed prior to entry to Linux. If you do that,
> > you can trivially share the spin-table code by setting each CPU's
> > enable-method to "spin-table".
> > 
> > That won't give you cpuidle or actual hotplug. For those you'll need
> > PSCI.
> 
> Maybe a way out for the broken firmware is to have a custom boot wrapper
> that gets distributed separately and that uses the normal spin-table
> API. We've done similar things on arch/arm/mach-sunxi for boot loaders
> that are just too different from what we expect.

As a starting point, we actually have one that can do both spin table
and PSCI ;) (three-clause BSD license):

git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git

Its primary goal is to create an ELF file that can be loaded on a
software model but there isn't anything that prevents you from
generating a kernel Image-like header.

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
