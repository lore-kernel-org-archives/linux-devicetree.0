Return-Path: <SRS0=YhsJ=VY=verdurent.com=amit.kucheria@kernel.org>
MIME-Version: 1.0
References: <cover.1564091601.git.amit.kucheria@linaro.org>
 <20190726103605.GB3327@onstation.org> <CAHLCerOs3cMQrWrYk7F_bnxr_nxJ-nsRL8oOGALU63ySqmLaig@mail.gmail.com>
 <20190726112954.GA3984@onstation.org>
In-Reply-To: <20190726112954.GA3984@onstation.org>
From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Sat, 27 Jul 2019 12:58:54 +0530
Message-ID: <CAHLCerNay31+RNQvQZyxMMVyb1mLLfN5BoZbz-M+bMqbmbYwtA@mail.gmail.com>
Subject: Re: [PATCH 00/15] thermal: qcom: tsens: Add interrupt support
Content-Type: text/plain; charset="UTF-8"
To: Brian Masney <masneyb@onstation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Andy Gross <andy.gross@linaro.org>, Andy Gross <agross@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 26, 2019 at 4:59 PM Brian Masney <masneyb@onstation.org> wrote:
>
> Hi Amit,
>
> On Fri, Jul 26, 2019 at 04:40:16PM +0530, Amit Kucheria wrote:
> > > The device tree nodes appear in sysfs:
> > >
> > > / # ls -1 /sys/class/thermal/
> > > cooling_device0
> > > cooling_device1
> > > thermal_zone0
> > > thermal_zone1
> > > thermal_zone2
> > > thermal_zone3
> > > thermal_zone4
> > > thermal_zone5
> > > thermal_zone6
> > > thermal_zone7
> > > thermal_zone8
> > > thermal_zone9
> >
> > Looks good. What are the contents of the files inside the two
> > cooling_device directories? The output of the following command would
> > be nice:
> >
> > $ grep "" cooling_device?/*
>
> /sys/class/thermal # grep "" cooling_device?/*
> cooling_device0/cur_state:100000
> cooling_device0/max_state:2500000
> cooling_device0/type:smbb-usbin
> cooling_device1/cur_state:500000
> cooling_device1/max_state:2500000
> cooling_device1/type:smbb-dcin
>
> > > The various temperatures were in the upper 40s and I threw some work at
> > > all four CPU cores to warm up the phone and watched the various
> > > temperatures rise:
> > >
> > > / # for i in $(seq 0 9) ; do
> > > > TYPE=$(cat /sys/class/thermal/thermal_zone$i/type)
> > > > TEMP=$(cat /sys/class/thermal/thermal_zone$i/temp)
> > > > echo "$TYPE = $TEMP"
> > > > done
> > > cpu-thermal0 = 66000
> > > cpu-thermal1 = 66000
> > > cpu-thermal2 = 66000
> > > cpu-thermal3 = 66000
> > > q6-dsp-thermal = 60000
> > > modemtx-thermal = 57000
> > > video-thermal = 61000
> > > wlan-thermal = 65000
> > > gpu-thermal-top = 61000
> > > gpu-thermal-bottom = 59000
> > >
> > > To test the interrupt support, I lowered all of the temperature trips to
> > > 51C but I'm not sure where to read that notification. I assume one of
> > > the cooling devices or a governor should be started? Sorry but I haven't
> > > done any work in the thermal subsystem yet and I'm short on time this
> > > morning to investigate right now.
> >
> > For now, just checking if the tsens interrupt in /proc/interrupts
> > fires should be fine. I have another patch to add some information to
> > debugs that I'll send at some point.
>
> An interrupt fires as each thermal zone exceeds the trip temperature and
> an interrupt fires again when it goes below that temperature.
> Here's my new test script:
>
> for i in $(seq 0 9) ; do
>         TYPE=$(cat /sys/class/thermal/thermal_zone$i/type)
>         TEMP=$(cat /sys/class/thermal/thermal_zone$i/temp)
>         TRIP=$(cat /sys/class/thermal/thermal_zone$i/trip_point_0_temp)
>         echo "$TYPE = $TEMP. trip = $TRIP"
> done
>
> # Warm the phone up
>
> /sys/class/thermal # /temp.sh
> cpu-thermal0 = 57000. trip = 51000
> cpu-thermal1 = 56000. trip = 51000
> cpu-thermal2 = 57000. trip = 51000
> cpu-thermal3 = 56000. trip = 51000
> q6-dsp-thermal = 51000. trip = 51000
> modemtx-thermal = 49000. trip = 51000
> video-thermal = 53000. trip = 51000
> wlan-thermal = 55000. trip = 51000
> gpu-thermal-top = 53000. trip = 51000
> gpu-thermal-bottom = 52000. trip = 51000
>
> /sys/class/thermal # grep tsens /proc/interrupts
>  27:          8          0          0          0     GIC-0 216 Level     tsens
>
> # Let the phone cool off
>
> /sys/class/thermal # /temp.sh
> cpu-thermal0 = 48000. trip = 51000
> cpu-thermal1 = 48000. trip = 51000
> cpu-thermal2 = 49000. trip = 51000
> cpu-thermal3 = 48000. trip = 51000
> q6-dsp-thermal = 47000. trip = 51000
> modemtx-thermal = 45000. trip = 51000
> video-thermal = 48000. trip = 51000
> wlan-thermal = 48000. trip = 51000
> gpu-thermal-top = 48000. trip = 51000
> gpu-thermal-bottom = 47000. trip = 51000
>
> /sys/class/thermal # grep tsens /proc/interrupts
>  27:         19          0          0          0     GIC-0 216 Level     tsens

OK, seems reasonable. I'll finish up a debugfs patch that'll dump more
state transition information to give more insight.

> > How well does cpufreq work on 8974? I haven't looked at it yet but
> > we'll need it for thermal throttling.
>
> I'm not sure how to tell if the frequency is dynamically changed during
> runtime on arm. x86-64 shows this information in /proc/cpuinfo. Here's
> the /proc/cpuinfo on the Nexus 5:

Nah. /proc/cpuinfo won't show what we need.

Try the following:

$ grep "" /sys/devices/system/cpu/cpufreq/policy?/*

More specifically, the following files have the information you need.
Run watch -n1 on them.

$ grep "" /sys/devices/system/cpu/cpufreq/policy?/scaling_*_freq

Thanks for your help.

Regards,
Amit
