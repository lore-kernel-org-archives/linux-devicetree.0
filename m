From: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 2/2] reset: qcom-pon: Add support for gen2 pon
Date: Fri, 31 May 2019 17:05:30 -0700
Message-ID: <CALAqxLXAdu63roX0WgXHqOwrr2dyJV+Oh06SSu8D+LqUOE3gng@mail.gmail.com>
References: <20190531234734.102842-1-john.stultz@linaro.org>
 <20190531234734.102842-2-john.stultz@linaro.org> <20190531235302.GD25597@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531235302.GD25597@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Amit Pundir <amit.pundir@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 31, 2019 at 4:53 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 31 May 16:47 PDT 2019, John Stultz wrote:
>
> > Add support for gen2 pon register so "reboot bootloader" can
> > work on pixel3 and db845.
> >
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: David Brown <david.brown@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Amit Pundir <amit.pundir@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Sebastian Reichel <sre@kernel.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/pm8998.dtsi |  2 +-
> >  drivers/power/reset/qcom-pon.c       | 15 ++++++++++++---
> >  2 files changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> > index d3ca35a940fb..051a52df80f9 100644
> > --- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> > @@ -39,7 +39,7 @@
> >               #size-cells = <0>;
> >
> >               pm8998_pon: pon@800 {
> > -                     compatible = "qcom,pm8916-pon";
> > +                     compatible = "qcom,pm8998-pon";
> >
> >                       reg = <0x800>;
> >                       mode-bootloader = <0x2>;
>
> We want to take this through arm-soc and the rest through Sebastian's
> tree, so please provide the dts update in a separate commit.

Sure. I wasn't sure if tracking the change in a separate patch was
worth it for such a trivial oneliner, but that's fine, I'll split it
out.

thanks for the review!
-john
