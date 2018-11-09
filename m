From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFC 0/2] Add RISC-V cpu topology
Date: Fri, 9 Nov 2018 12:33:38 +0000
Message-ID: <20181109123338.GA8385@e107155-lin>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
 <20181106141331.GA28458@e107155-lin>
 <969fc2a5198984e0dfe8c3f585dc65f9@mailhost.ics.forth.gr>
 <20181106162051.w7fyweuxrl7ujzuz@lakrids.cambridge.arm.com>
 <abcae019e6ae749b17ecb0c721fd3177@mailhost.ics.forth.gr>
 <20181107122803.GA8433@e107155-lin>
 <d04779705c47b59b94300365e805dbd3@mailhost.ics.forth.gr>
 <20181108164827.GB10953@e107155-lin>
 <b44d94e4a5575e2ce49344b50956bf8e@mailhost.ics.forth.gr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b44d94e4a5575e2ce49344b50956bf8e@mailhost.ics.forth.gr>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Mark Rutland <mark.rutland@arm.com>, Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com, alankao@andestech.com, zong@andestech.com, anup@brainfault.org, palmer@sifive.com, linux-kernel@vger.kernel.org, hch@infradead.org, robh+dt@kernel.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

On Fri, Nov 09, 2018 at 04:36:19AM +0200, Nick Kossifidis wrote:
> Στις 2018-11-08 18:48, Sudeep Holla έγραψε:

[...]

> we can keep it as is and mandate the <thread> nodes only for ARM64 as you
> suggested.
>

Fine by me.

[...]

> > We have reasons why we can't assume information about cache or power
> > domain topology from CPU topology. I have summarised them already and
> > we are not discussing.
>
> But that's what you do on arch/arm/kernel/topology.c, you assume
> information on power domain and cache topology based on the CPU topology
> when you define the scheduling domain topology levels.
>

NO, we don't assume any knowledge about power domain and cache topology
based on the CPU topology. We have updated scheduling domains for ACPI
based systems and plan to do the same for DT. The current code may not
be optimal.

> PowerPC also does the same on arch/powerpc/kernel/smp.c and basically if
> you track the usage of struct sched_domain_topology_level you'll see that
> every arch that uses it to instruct the scheduler about the scheduling
> domains, does it based on its CPU topology, which I think we both agree
> is wrong.
>

Again, that's arch specific, so I can't comment on anything other than ARM.

> > There may not be perfect bindings but there are
> > already supported and nothing is broken here to fix. DT bindings are
> > *not* same as code to fix it with a patch to the bindings themselves.
> > Once agreed and merged, they need to be treated like user ABI.
> >
>
> The only use of the devicetree spec bindings for caches if I'm not
> mistaken are used on your cacheinfo driver for exporting them to userspace
> through sysfs (thank you for cleaning this up btw). Even if we have the
> cache topology  using the generic bindings, we are not doing anything with
> that information but export it to userspace.
>

OK, we may use LLC for sched domains in future, we do for ACPI systems.

> As for the power domain bindings, we have drivers/base/power/domain.c that
> handles the generic bindings and it's being used by some drivers to put
> devices to power domains (something used by the pm code), but from a quick
> search it's not used for cpu nodes and I didn't see this info being used
> for providing hints to the scheduler either. Even with the generic power
> domain bindings in place, for CPU idle states, on ARM we have another
> binding that's basically the same with the addition of "wakeup-latency-us".
>

OK, it's just an extension.

> For having different capacity there is no generic binding but I guess we
> could use ARM's.
>

Better.

> Of the generic bindings that relate to the scheduler's behavior, only the
> numa binding is used as expected and only by ARM64, powerpc and sparc use
> their own stuff.
>

Yes, PPC and SPARC has lots of Open Firmware base which is different from
DT.

> So there may be nothing broken regarding the generic / already existing
> bindings, but their support needs fixing. The way they are now we can't
> use them on RISC-V for configuring the scheduler and supporting SMT and
> MC properly + I'm not in favor of using CPU topology blindly as the
> other archs do.
>

Sure, if you want to improve support for the existing DT bindings that's
fine. Happy to see the patches.

DT bindings can be generic, you can still interpret and manage the sched
domains in the best way for RISC-V.

[...]

> I mentioned the script as a transitioning method, but you are right, it goes
> both ways.
>

Thanks :)

> But I never said that's "the only solution and everything else is broken" !
> I'm just proposing an extension to cpu-map since Mark suggested that it's
> possible. My goal is to try and consolidate cpu-map with what Atish proposed
> for RISC-V (so that we can use the same code) and point out some issues
> on how we use and define the CPU topology.
>

Good, we are in agreement here.

> ACK, thanks a lot for your time and the discussion so far, I really
> appreciate it.
>

No worries, glad if it helps.

--
Regards,
Sudeep
