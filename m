From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1 6/7] arm64: dts: sdm845: Increase alert trip point to
 95 degrees
Date: Thu, 10 Jan 2019 09:14:20 -0800
Message-ID: <CAD=FV=V8WM68Rrsc6adnV6Q9c1N8hoH2TzNLWUsuWg33d7ZpOg@mail.gmail.com>
References: <cover.1547078153.git.amit.kucheria@linaro.org>
 <041258d65883df964890249a24d2a4788c419304.1547078153.git.amit.kucheria@linaro.org>
 <154708018331.15366.11574628155253134835@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154708018331.15366.11574628155253134835@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Amit Kucheria <amit.kucheria@linaro.org>, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Andy Gross <andy.gross@linaro.org>, Taniya Das <tdas@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jan 9, 2019 at 4:29 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Amit Kucheria (2019-01-09 16:00:55)
> > 75 degrees is too aggressive for throttling the CPU. After speaking to
> > Qualcomm engineers, increase it to 95 degrees.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 16 ++++++++--------
>
> Is the plan that these are some defaults that would be adjusted by board
> variants? Just curious why we have anything in here and don't punt it
> all to each board dts file.

My preference would be that the SoC device tree file should contain
thermal numbers that are important to pay attention to for the safety
/ proper operation of the SoC.  ...then individual boards could (if
they needed to) override with lower values to control, for instance,
skin temperature.

>From experience with previous boards, if you've got enough an off-SoC
thermistors then those are the ones you'd want to monitor to control
skin temperature.  It's OK if the SoC spikes up quite high as long as
that heat has somewhere to go (like a heat pipe).  The sensors that
are part of Amit's patch are on-chip.

...if you've got a board without external thermistors and are using
the SoC's on-chip sensors as a proxy for the heat in the overall
system then you might want to lower your values in the board device
tree file.  You won't be able to have as many short term spikes, but
that's what you gotta do without the extra sensors.


Sound sane?

-Doug
