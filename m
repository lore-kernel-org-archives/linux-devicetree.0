From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v4 09/15] arm64: dts: msm8996: thermal: Add interrupt support
Date: Fri, 20 Sep 2019 15:14:58 -0700
Message-ID: <CAHLCerNqsf1j4vsOPjdav8+UtXtGP55k6_==jjg1QeZ1qCX1RA@mail.gmail.com>
References: <cover.1569015835.git.amit.kucheria@linaro.org>
 <f627e66c455f52b5662bef6526d7c72869808401.1569015835.git.amit.kucheria@linaro.org>
 <5d854c82.1c69fb81.66e1f.96ab@mx.google.com> <CAHLCerPqEK2sSGGtDj85DH+qCzgtWi4ainuQv8BgQ3-Dgi93BQ@mail.gmail.com>
 <5d854e1d.1c69fb81.4f771.9391@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d854e1d.1c69fb81.4f771.9391@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 20, 2019 at 3:09 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Amit Kucheria (2019-09-20 15:07:25)
> > On Fri, Sep 20, 2019 at 3:02 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Amit Kucheria (2019-09-20 14:52:24)
> > > > Register upper-lower interrupts for each of the two tsens controllers.
> > > >
> > > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 60 ++++++++++++++-------------
> > > >  1 file changed, 32 insertions(+), 28 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > > > index 96c0a481f454..bb763b362c16 100644
> > > > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > > > @@ -175,8 +175,8 @@
> > > >
> > > >         thermal-zones {
> > > >                 cpu0-thermal {
> > > > -                       polling-delay-passive = <250>;
> > > > -                       polling-delay = <1000>;
> > > > +                       polling-delay-passive = <0>;
> > > > +                       polling-delay = <0>;
> > >
> > > I thought the plan was to make this unnecessary to change?
> >
> > IMO that change should be part of a different series to the thermal
> > core. I've not actually started working on it yet (traveling for the
> > next 10 days or so) but plan to do it.
> >
>
> Ok so the plan is to change DT and then change it back? That sounds
> quite bad so please fix the thermal core to not care about this before
> applying these changes so that we don't churn DT.

Hi Stephen,

Our emails crossed paths. I think we could just make the property
optional so that we can remove the property completely for drivers
that support interrupts. Comments?

That is a bigger change to the bindings and I don't want to hold the
tsens interrupt support hostage to agreement on this.

Regards,
Amit
