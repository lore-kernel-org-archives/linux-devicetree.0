From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v1 7/7] arm64: dts: sdm845: wireup the thermal trip points
 to cpufreq
Date: Mon, 14 Jan 2019 13:52:34 +0530
Message-ID: <CAP245DWMz0UfRdD9HHaRF0fvTgYroxLrj5LcTgQMA9DuBm4T8A@mail.gmail.com>
References: <cover.1547078153.git.amit.kucheria@linaro.org>
 <6c5b26e65be18222587724e066fc2e39b9f60397.1547078153.git.amit.kucheria@linaro.org>
 <20190111003014.GB261387@google.com> <CAHLCerP5ZyORkJm9E8kk-+4X6u6f2=vn_0hq7jSewr9O4=RKDw@mail.gmail.com>
 <20190111203605.GG261387@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111203605.GG261387@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Andy Gross <andy.gross@linaro.org>, Taniya Das <tdas@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 12, 2019 at 2:06 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Another concern about adding trip points later could be the node
> name. We currently have:
>
>
> trips {
>   cpu0_alert0: trip0 {
>     ...
>   };
>
>   cpu0_crit: trip1 {
>     ...
>   };
> };
>
> If we keep increasing enumeration with the node name this would become:
>
> trips {
>   cpu0_alert0: trip0 {
>     ...
>   };
>
>   cpu0_alert1: trip1 {
>     ...
>   };
>
>   cpu0_crit: trip2 {
>     ...
>   };
> };
>
> i.e. the node name of the critical trip-point changes, which might be
> a concern for dtsi's that override a value, though they should
> probably use the phandle &cpu0_crit anyway. If this is a concern we
> could change the node names to 'alert0' and 'crit'.
>
> I looked around a bit and actually I kinda like the naming scheme used
> by hisilicon/hi6220.dtsi, mediatek/mt8173.dtsi and rockchip/rk3328.dtsi
> (with minor variations):
>
> trips {
>         threshold: trip-point@0 {
>                 temperature = <68000>;
>                 hysteresis = <2000>;
>                 type = "passive";
>         };
>
>         target: trip-point@1 {
>                 temperature = <85000>;
>                 hysteresis = <2000>;
>                 type = "passive";
>         };
>
>         cpu_crit: cpu_crit@0 {
>                 temperature = <115000>;
>                 hysteresis = <2000>;
>                 type = "critical";
>         };
> };
>
> If we were to use this we'd have to adapt it slightly since we have
> multiple thermal zones. In line with the other scheme this could be
> cpuN_threshold, cpuN_target and cpuN_crit.
>

I like this scheme enough that I adopted it for v2.
