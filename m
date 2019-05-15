From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add PSCI cpuidle support
Date: Wed, 15 May 2019 11:30:46 +0100
Message-ID: <20190515103026.GA26759@e107155-lin>
References: <20190508145600.GA26843@centauri>
 <CAHLCerN8L4np0WAY4hTjTnPXFtTK6EH0BXWLXzB-NiRaAnvcDA@mail.gmail.com>
 <20190510091158.GA10284@e107155-lin>
 <CAHLCerM83weBBvwurU45d9_M0Wg49WjDFTRJ6KL8vj7cavz03g@mail.gmail.com>
 <20190513094935.GA4885@e107155-lin>
 <CAHLCerM6SVCx5vdrodh+O5nQ0uDwr7zpvOMxVYtreT9EFk22eg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHLCerM6SVCx5vdrodh+O5nQ0uDwr7zpvOMxVYtreT9EFk22eg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, Lina Iyer <lina.iyer@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 15, 2019 at 03:26:14PM +0530, Amit Kucheria wrote:
> On Mon, May 13, 2019 at 3:19 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > On Fri, May 10, 2019 at 11:58:40PM +0530, Amit Kucheria wrote:
> > > On Fri, May 10, 2019 at 2:54 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > > >
> >
> > [...]
> >
> > > >
> > > > Yes entry-method="psci" is required as per DT binding but not checked
> > > > in code on arm64. We have CPU ops with idle enabled only for "psci", so
> > > > there's not need to check.
> > >
> > > I don't see it being checked on arm32 either.
> > >
> >
> > arm_cpuidle_get_ops in arch/arm/kernel/cpuidle.c checks the method, has
> > to match "psci" for drivers/firmware/psci.c to work on arm32
>
> That is a check for the enable-method, not entry-method.
>
> We don't check for entry-method anywhere, AFAICT.
>

Ah, you right. My eyes can't distinguish between entry-method and enable-method
anymore :(

--
Regards,
Sudeep
