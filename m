From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add PSCI cpuidle support
Date: Mon, 13 May 2019 10:49:35 +0100
Message-ID: <20190513094935.GA4885@e107155-lin>
References: <20190508145600.GA26843@centauri>
 <CAHLCerN8L4np0WAY4hTjTnPXFtTK6EH0BXWLXzB-NiRaAnvcDA@mail.gmail.com>
 <20190510091158.GA10284@e107155-lin>
 <CAHLCerM83weBBvwurU45d9_M0Wg49WjDFTRJ6KL8vj7cavz03g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHLCerM83weBBvwurU45d9_M0Wg49WjDFTRJ6KL8vj7cavz03g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, Lina Iyer <lina.iyer@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 10, 2019 at 11:58:40PM +0530, Amit Kucheria wrote:
> On Fri, May 10, 2019 at 2:54 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >

[...]

> >
> > Yes entry-method="psci" is required as per DT binding but not checked
> > in code on arm64. We have CPU ops with idle enabled only for "psci", so
> > there's not need to check.
>
> I don't see it being checked on arm32 either.
>

arm_cpuidle_get_ops in arch/arm/kernel/cpuidle.c checks the method, has
to match "psci" for drivers/firmware/psci.c to work on arm32

[...]

> >
> > Why do you want to deprecated just because Linux kernel doesn't want to
> > use it. That's not a valid reason IMO.
>
> Fair enough. Just want to make sure that it isn't some vestigial
> property that was never used. Do you know if another OS is actually
> using it?
>

Not that I am aware of. But Linux uses it on arm32, so it's not entirely
unused.

> > > Do we expect to support PSCI platforms that might have a different
> > > entry-method for idle states?
> >
> > Not on ARM64, but same DT bindings can be used for idle-states on
> > say RISC-V and have some value other than "psci".
>
> Both enable-method and entry-method properties are currently only used
> (and documented) for ARM platforms. Hence this discussion about
> deprecation of one of them.
>

Yes, it's used on arm32 as mentioned above.

> > > Should I whip up a patch removing entry-method? Since we don't check
> > > for it today, it won't break the old DTs either.
> > >
> >
> > Nope, I don't think so. But if it's causing issues, we can look into it.
> > I don't want to restrict the use of the bindings for ARM/ARM64 or psci only.
>
> Only a couple of minor issues:
> 1. There is a trickle of DTs that need fixing up every now and then
> because they don't use entry-method in their idle-states node. Schema
> validation ought to fix that.

I understand, scheme should fix it. This is not just restricted to this,
it's generic DT problem. So let's hope we get schema based validation soon.

> 2. A property that isn't ready by any code is a bit confusing. Perhaps
> we can mention something to the effect in the documentation?
>

Not entirely true. We have quite a lot of bindings that are added just
because downstream drivers use e.g. GPU and even standard ePAPR or DT
specification has lots of bindings which OS like Linux may choose
not to use at all. Same applies to ACPI, so I am not for removing bindings
just because there are no users in Linux.

--
Regards,
Sudeep
