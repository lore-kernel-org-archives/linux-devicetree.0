From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 5/5] arm64: qcom: add cpu operations
Date: Tue, 14 Apr 2015 22:51:40 +0200
Message-ID: <2167031.4Enm47D6vo@wuerfel>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org> <1428601031-5366-6-git-send-email-galak@codeaurora.org> <20150414162953.GL28709@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20150414162953.GL28709@leverpostej>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Abhimanyu Kapur <abhimany@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 14 April 2015 17:29:53 Mark Rutland wrote:
> 
> > +static int msm_cpu_boot(unsigned int cpu)
> > +{
> > +       int ret = 0;
> > +
> > +       if (per_cpu(cold_boot_done, cpu) == false) {
> > +               ret = msm_unclamp_secondary_arm_cpu(cpu);
> > +               if (ret)
> > +                       return ret;
> > +               per_cpu(cold_boot_done, cpu) = true;
> > +       }
> > +       return secondary_pen_release(cpu);
> > +}
> 
> Ah, so cold_boot_done is for pseudo-hotplug. Absolute NAK to that.
> 
> The only thing this gives you over spin-table is one-time powering up of
> the CPUs that can be performed prior to entry to Linux. If you do that,
> you can trivially share the spin-table code by setting each CPU's
> enable-method to "spin-table".
> 
> That won't give you cpuidle or actual hotplug. For those you'll need
> PSCI.

Maybe a way out for the broken firmware is to have a custom boot wrapper
that gets distributed separately and that uses the normal spin-table
API. We've done similar things on arch/arm/mach-sunxi for boot loaders
that are just too different from what we expect.

Once someone implements a proper loader, they could skip that extra
wrapper.

	Arnd
