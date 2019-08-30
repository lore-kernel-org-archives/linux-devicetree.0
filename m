From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v2 07/15] dt: thermal: tsens: Document interrupt support
 in tsens driver
Date: Fri, 30 Aug 2019 22:10:24 +0530
Message-ID: <CAHLCerNJpOEevZBvN6s4FiaD5C=1C4xNRHYjVNM=0HpGCuf9RQ@mail.gmail.com>
References: <cover.1566907161.git.amit.kucheria@linaro.org>
 <66ac3d3707d6296ef85bf1fa321f7f1ee0c02131.1566907161.git.amit.kucheria@linaro.org>
 <5d65cbe9.1c69fb81.1ceb.2374@mx.google.com> <CAP245DWWKsZBHnvSqC40XOH48kGd-hykd+fr-UZfWTmvuG2KaA@mail.gmail.com>
 <5d67e6cf.1c69fb81.5aec9.3b71@mx.google.com> <CAP245DVjgnwGn5rUgbYrkBOi3vtyShz0Qbx_opx80xiOV7uXeA@mail.gmail.com>
 <CAHLCerMmBmS-59eywxkUJ+5-zSccx8Twx2=NELgBgShYhM7TOw@mail.gmail.com> <5d6946fa.1c69fb81.44ab7.8d72@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d6946fa.1c69fb81.44ab7.8d72@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Brian Masney <masneyb@onstation.org>, Linux PM list <linux-pm@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2019 at 9:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Amit Kucheria (2019-08-30 04:32:54)
> > On Thu, Aug 29, 2019 at 10:04 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
> > >
> > > On Thu, Aug 29, 2019 at 8:23 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > Can we get a known quantity of interrupts for a particular compatible
> > > > string instead? Let's be as specific as possible. The index matters too,
> > > > so please list them in the order that is desired.
> > >
> > > I *think* we can predict what platforms have uplow and critical
> > > interrupts based on IP version currently[1]. For newer interrupt
> > > types, we might need more fine-grained platform compatibles.
> > >
> > > [1] Caveat: this is based only on the list of platforms I've currently
> > > looked at, there might be something internally that breaks these
> > > rules.
> >
> > What do you think if we changed the wording to something like the following,
> >
> > - interrupt-names: Must be one of the following depending on IP version:
> >    For compatibles qcom,msm8916-tsens, qcom,msm8974-tsens,
> > qcom,qcs404-tsens, qcom,tsens-v1, use
> >               interrupt-names = "uplow";
> >    For compatibles qcom,msm8996-tsens, qcom,msm8998-tsens,
> > qcom,sdm845-tsens, qcom,tsens-v2, use
> >               interrupt-names = "uplow", "critical";
>
> Ok. I would still prefer YAML/JSON schema for this binding so that it's
> much more explicit about numbers and the order of interrupts, etc.

OK, I'll look around for some examples.
