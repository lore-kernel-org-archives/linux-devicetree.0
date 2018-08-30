From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v1] arm64: dts: sdm845: enable tsens thermal zones
Date: Thu, 30 Aug 2018 10:55:17 +0530
Message-ID: <CAP245DX7tBdOBfB-gZ8+MvdF3bsnNVWys4bjaDf0zObWJV38+Q@mail.gmail.com>
References: <cover.1531899325.git.amit.kucheria@linaro.org>
 <b3c25cedfa3a9b8a4b481e714992afe62b84ca3b.1531899325.git.amit.kucheria@linaro.org>
 <f416d38c-b91f-f58e-8cde-d4ad09a0a726@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f416d38c-b91f-f58e-8cde-d4ad09a0a726@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Doug Anderson <dianders@chromium.org>, mka@chromium.org, Eduardo Valentin <edubezval@gmail.com>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Lists LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 29, 2018 at 3:09 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 18/07/2018 09:49, Amit Kucheria wrote:
> > One thermal zone per cpu is defined
>
> The thermal zones are very close, especially when the CPUs belong to the
> same 'cluster'. Very likely the temperature will propagate from one core
> to another core, so when one core reaches the trip0, there is good
> chance the other cores will be close and cross the trip0 threshold too.

Agreed. Once we have all the thermal and cpufreq bits in place, I'd
like to examine optimisations such as a virtual sensor, using the
coefficients to add weights, etc.

> Having multiple thermal zones, one per CPU, may trigger an interrupts
> storm with the passive polling timer delay.

I'm working on irq support for tsens that should alleviate that.

> Does this board have a cooling device per CPU also ?

As Matthias mentioned, DVFS is per cluster (4 cpus to a cluster).
