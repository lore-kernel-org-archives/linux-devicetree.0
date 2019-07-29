From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH 00/15] thermal: qcom: tsens: Add interrupt support
Date: Mon, 29 Jul 2019 05:07:35 -0400
Message-ID: <20190729090735.GA897@onstation.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
 <20190726103605.GB3327@onstation.org>
 <CAHLCerOs3cMQrWrYk7F_bnxr_nxJ-nsRL8oOGALU63ySqmLaig@mail.gmail.com>
 <20190726112954.GA3984@onstation.org>
 <CAHLCerNay31+RNQvQZyxMMVyb1mLLfN5BoZbz-M+bMqbmbYwtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHLCerNay31+RNQvQZyxMMVyb1mLLfN5BoZbz-M+bMqbmbYwtA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Andy Gross <andy.gross@linaro.org>, Andy Gross <agross@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 27, 2019 at 12:58:54PM +0530, Amit Kucheria wrote:
> On Fri, Jul 26, 2019 at 4:59 PM Brian Masney <masneyb@onstation.org> wrote:
> > On Fri, Jul 26, 2019 at 04:40:16PM +0530, Amit Kucheria wrote:
> > > How well does cpufreq work on 8974? I haven't looked at it yet but
> > > we'll need it for thermal throttling.
> >
> > I'm not sure how to tell if the frequency is dynamically changed during
> > runtime on arm. x86-64 shows this information in /proc/cpuinfo. Here's
> > the /proc/cpuinfo on the Nexus 5:
> 
> Nah. /proc/cpuinfo won't show what we need.
> 
> Try the following:
> 
> $ grep "" /sys/devices/system/cpu/cpufreq/policy?/*
> 
> More specifically, the following files have the information you need.
> Run watch -n1 on them.
> 
> $ grep "" /sys/devices/system/cpu/cpufreq/policy?/scaling_*_freq

There's no cpufreq directory on msm8974:

    # ls -1 /sys/devices/system/cpu/
    cpu0
    cpu1
    cpu2
    cpu3
    cpuidle
    hotplug
    isolated
    kernel_max
    modalias
    offline
    online
    possible
    power
    present
    smt
    uevent

I'm using qcom_defconfig.

Brian
