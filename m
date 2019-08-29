From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v2 07/15] dt: thermal: tsens: Document interrupt support
 in tsens driver
Date: Thu, 29 Aug 2019 22:04:02 +0530
Message-ID: <CAP245DVjgnwGn5rUgbYrkBOi3vtyShz0Qbx_opx80xiOV7uXeA@mail.gmail.com>
References: <cover.1566907161.git.amit.kucheria@linaro.org>
 <66ac3d3707d6296ef85bf1fa321f7f1ee0c02131.1566907161.git.amit.kucheria@linaro.org>
 <5d65cbe9.1c69fb81.1ceb.2374@mx.google.com> <CAP245DWWKsZBHnvSqC40XOH48kGd-hykd+fr-UZfWTmvuG2KaA@mail.gmail.com>
 <5d67e6cf.1c69fb81.5aec9.3b71@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d67e6cf.1c69fb81.5aec9.3b71@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Brian Masney <masneyb@onstation.org>, Linux PM list <linux-pm@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 29, 2019 at 8:23 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Amit Kucheria (2019-08-29 01:48:27)
> > On Wed, Aug 28, 2019 at 6:03 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Amit Kucheria (2019-08-27 05:14:03)
> > > > Define two new required properties to define interrupts and
> > > > interrupt-names for tsens.
> > > >
> > > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/thermal/qcom-tsens.txt | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> > > > index 673cc1831ee9d..686bede72f846 100644
> > > > --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> > > > +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> > > > @@ -22,6 +22,8 @@ Required properties:
> > > >
> > > >  - #thermal-sensor-cells : Should be 1. See ./thermal.txt for a description.
> > > >  - #qcom,sensors: Number of sensors in tsens block
> > > > +- interrupts: Interrupts generated from Always-On subsystem (AOSS)
> > >
> > > Is it always one? interrupt-names makes it sound like it.
> > >
> > > > +- interrupt-names: Must be one of the following: "uplow", "critical"
> >
> > Will fix to "one or more of the following"
> >
>
> Can we get a known quantity of interrupts for a particular compatible
> string instead? Let's be as specific as possible. The index matters too,
> so please list them in the order that is desired.

I *think* we can predict what platforms have uplow and critical
interrupts based on IP version currently[1]. For newer interrupt
types, we might need more fine-grained platform compatibles.

[1] Caveat: this is based only on the list of platforms I've currently
looked at, there might be something internally that breaks these
rules.
