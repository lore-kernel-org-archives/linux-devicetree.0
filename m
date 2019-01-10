From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v1 6/7] arm64: dts: sdm845: Increase alert trip point to
 95 degrees
Date: Fri, 11 Jan 2019 01:36:20 +0530
Message-ID: <CAHLCerOVyOUvvXHRQFpn29=ycy4VZHocsNdHbcR4ZK4RfGq49A@mail.gmail.com>
References: <cover.1547078153.git.amit.kucheria@linaro.org>
 <041258d65883df964890249a24d2a4788c419304.1547078153.git.amit.kucheria@linaro.org>
 <154708018331.15366.11574628155253134835@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154708018331.15366.11574628155253134835@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Andy Gross <andy.gross@linaro.org>, Taniya Das <tdas@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 10, 2019 at 5:59 AM Stephen Boyd <swboyd@chromium.org> wrote:
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

These values are meant to be safe values for silicon operation as
characterised[1] by the HW team. So I'd consider them a more than just
default values. It also gives future boards a safe starting point.

IMHO it would be better to have the characterized values merged
upstream and if really required, those values can be tweaked in the
board-specific DTS.

[1] Caveat: The characterisation probably focused on mobile devices
and might change depending on form-factor, active cooling and heat
dissipation design but those differences should only impact the skin
temperature, not the operation of the SoC itself.
