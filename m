From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v1 7/7] arm64: dts: sdm845: wireup the thermal trip points
 to cpufreq
Date: Thu, 10 Jan 2019 17:58:47 +0530
Message-ID: <CAHLCerNQgOrud7OkhJ3Vy431B=kQuXZU5pSMXc24cU1ZUeR1Xw@mail.gmail.com>
References: <cover.1547078153.git.amit.kucheria@linaro.org>
 <6c5b26e65be18222587724e066fc2e39b9f60397.1547078153.git.amit.kucheria@linaro.org>
 <154708009884.15366.3039982038291126570@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154708009884.15366.3039982038291126570@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Andy Gross <andy.gross@linaro.org>, Taniya Das <tdas@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 10, 2019 at 5:58 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Amit Kucheria (2019-01-09 16:00:56)
> > Since the big and little cpus are in the same frequency domain, use all
>
> Oh? I thought the big and little cpus were in different frequency
> domains and voltage domains. Maybe that's what you're saying here but
> I'm misunderstanding. So change the wording a bit to be more clear?

Yeah, forgive my English - it is my second language. ;-)

That should've been "since all the cpus in the big and little clusters
are in the same frequency domain". Will fix.

> > of them for mitigation in the cooling-map. At the lower trip points we
> > restrict ourselves to throttling only a few OPPs. At higher trip
> > temperatures, allow ourselves to be throttled to any extent.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
>
