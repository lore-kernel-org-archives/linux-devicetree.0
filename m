From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v1 04/12] arm64: dts: msm8996: thermal: Add temperature
 sensors near major peripherals
Date: Wed, 20 Feb 2019 14:48:31 +0530
Message-ID: <CAP245DUv+3rMiFFQWGnAv6xgqDt7jJ2m5ioo3ETyQ8iKRef++g@mail.gmail.com>
References: <cover.1550493113.git.amit.kucheria@linaro.org>
 <51feb49578f6e412eb5e80012dc63eab5532342b.1550493113.git.amit.kucheria@linaro.org>
 <20190220012456.GG2811@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220012456.GG2811@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 20, 2019 at 6:55 AM Eduardo Valentin <edubezval@gmail.com> wrote:
>
> On Mon, Feb 18, 2019 at 06:05:18PM +0530, Amit Kucheria wrote:
> > msm8996 has a total of 21 temperature sensors. Populate DT with
> > information about them.
> >
> > There are 2 sensors on each of the cpus - one on the top, the other
> > below (we only expose one on the top in DT for now). For the GPU, we
> > expose both, the one on the top and the one below.
> >
> > Depending on the version of the silicon, sensor 2 is either placed near
> > the L3 cache or the venus video decoder. It would've been nice to be
> > able to be version-specific but we don't have DTs that differentiate the
> > two versions of silicon yet.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 98 +++++++++++++++++++++++++++
> >  1 file changed, 98 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index ae6e9f0778f0..8e36a39e1386 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -237,6 +237,104 @@
> >                               };
> >                       };
> >               };
> > +
> > +             gpu-thermal-top {
> > +                     polling-delay-passive = <250>;
> > +                     polling-delay = <1000>;
> > +
> > +                     thermal-sensors = <&tsens1 6>;
> > +
> > +                     trips {
> > +                             gpu1_alert0: trip-point@0 {
> > +                                     temperature = <75000>;
> > +                                     hysteresis = <2000>;
> > +                                     type = "passive";
>
> What is the cooling map for this?

I'm working on it. Will send out an update.

> > +                             };
> > +
> > +                             gpu1_crit: gpu_crit {
> > +                                     temperature = <95000>;
> > +                                     hysteresis = <2000>;
> > +                                     type = "critical";
> > +                             };
> > +                     };
> > +             };
> > +
> > +             gpu-thermal-bottom {
> > +                     polling-delay-passive = <250>;
> > +                     polling-delay = <1000>;
> > +
> > +                     thermal-sensors = <&tsens1 7>;
> > +
> > +                     trips {
> > +                             gpu2_alert0: trip-point@0 {
> > +                                     temperature = <75000>;
> > +                                     hysteresis = <2000>;
> > +                                     type = "passive";
> > +                             };
> > +
> > +                             gpu2_crit: gpu_crit {
> > +                                     temperature = <95000>;
> > +                                     hysteresis = <2000>;
> > +                                     type = "critical";
> > +                             };
> > +                     };
> > +             };
> > +
> > +             m4m-thermal {
> > +                     polling-delay-passive = <250>;
> > +                     polling-delay = <1000>;
> > +
> > +                     thermal-sensors = <&tsens0 1>;
> > +             };
> > +
> > +             l3_or_venus-thermal {
> > +                     polling-delay-passive = <250>;
> > +                     polling-delay = <1000>;
> > +
> > +                     thermal-sensors = <&tsens0 2>;
> > +             };
> > +
> > +             cluster0-l2-thermal {
> > +                     polling-delay-passive = <250>;
> > +                     polling-delay = <1000>;
> > +
> > +                     thermal-sensors = <&tsens0 7>;
> > +             };
> > +
> > +             cluster1-l2-thermal {
> > +                     polling-delay-passive = <250>;
> > +                     polling-delay = <1000>;
> > +
> > +                     thermal-sensors = <&tsens0 12>;
> > +             };
> > +
> > +             camera-thermal {
> > +                     polling-delay-passive = <250>;
> > +                     polling-delay = <1000>;
> > +
> > +                     thermal-sensors = <&tsens1 1>;
> > +             };
> > +
> > +             q6-dsp-thermal {
> > +                     polling-delay-passive = <250>;
> > +                     polling-delay = <1000>;
> > +
> > +                     thermal-sensors = <&tsens1 2>;
> > +             };
> > +
> > +             mem-thermal {
> > +                     polling-delay-passive = <250>;
> > +                     polling-delay = <1000>;
> > +
> > +                     thermal-sensors = <&tsens1 3>;
> > +             };
> > +
> > +             modemtx-thermal {
> > +                     polling-delay-passive = <250>;
> > +                     polling-delay = <1000>;
> > +
> > +                     thermal-sensors = <&tsens1 4>;
> > +             };
> >       };
> >
> >       timer {
> > --
> > 2.17.1
> >
