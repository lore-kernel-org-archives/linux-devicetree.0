From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 16/16] arm64: dts: sdm845: enable tsens thermal zones
Date: Thu, 25 Oct 2018 13:37:52 -0700
Message-ID: <20181025203752.GA22824@google.com>
References: <cover.1536744310.git.amit.kucheria@linaro.org>
 <5e2d5fc463a5f5623c4fc1b18ccdf62adc954758.1536744310.git.amit.kucheria@linaro.org>
 <20181025192501.GZ22824@google.com>
 <CAP245DUFi1UWqnVfgxdeZHVHSx9Sn3z3AqVp_x5GGHHAvwAjyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAP245DUFi1UWqnVfgxdeZHVHSx9Sn3z3AqVp_x5GGHHAvwAjyA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, smohanad@codeaurora.org, Andy Gross <andy.gross@linaro.org>, Doug Anderson <dianders@chromium.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 26, 2018 at 01:33:40AM +0530, Amit Kucheria wrote:
> On Fri, Oct 26, 2018 at 12:55 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Hi Amit,
> >
> > vaguely related question, since you are working on SDM845 thermal
> > stuff: Do you have plans to add CPU cooling devices? I raised the
> > point during the review of the CPUfreq HW, however there was no
> > clear answer: https://lore.kernel.org/patchwork/patch/966833/#1164748
> > The driver is still under development/review, but I wonder what the
> > path forward is.
> >
> 
> Hi Matthias,
> 
> I plan to

Great!

> but the OSM driver doesn't work well enough for me to send
> out that patch yet. I responded with my findings on the v9 posting
> where it seems to get stuck at the high OPP. It'd be nice if somebody
> else could confirm (or refute) this behaviour.

Ok, we aren't using the latest version yet, I'll try to repro and
report back.

Cheers

Matthias
