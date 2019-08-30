From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v2 09/15] arm64: dts: msm8996: thermal: Add interrupt support
Date: Sat, 31 Aug 2019 01:40:10 +0530
Message-ID: <CAP245DX1PfszgyL4JB60zqbFynusXUjATrkUr1_Ps6NG-fRx=g@mail.gmail.com>
References: <cover.1566907161.git.amit.kucheria@linaro.org>
 <1cb5ab682bce53d32f3a73b5b29cc6c3e800bfcc.1566907161.git.amit.kucheria@linaro.org>
 <5d65cc4a.1c69fb81.376b6.2486@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d65cc4a.1c69fb81.376b6.2486@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Brian Masney <masneyb@onstation.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 28, 2019 at 6:05 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Amit Kucheria (2019-08-27 05:14:05)
> > Register upper-lower interrupts for each of the two tsens controllers.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 60 ++++++++++++++-------------
> >  1 file changed, 32 insertions(+), 28 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index 96c0a481f454e..bb763b362c162 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -175,8 +175,8 @@
> >
> >         thermal-zones {
> >                 cpu0-thermal {
> > -                       polling-delay-passive = <250>;
> > -                       polling-delay = <1000>;
> > +                       polling-delay-passive = <0>;
> > +                       polling-delay = <0>;
>
> Is it really necessary to change the configuration here to be 0 instead
> of some number? Why can't we detect that there's an interrupt and then
> ignore these properties?

AFAICT, the thermal core currently depends on the passive and
polling_delay being set to 0 to avoid setting dispatching polling work
to a workqueue. If we leave the values to set, we'll continue to poll
inspite of an interrupt. See
thermal_core.c:thermal_zone_device_set_polling()

But I agree, the core should detect the presence of an interrupt
property and ignore the polling intervals. I'll see if I can fix this
up later.

Regards,
Amit
