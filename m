From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v3 1/1] arm64: dts: sdm845: wireup the thermal trip points
 to cpufreq
Date: Wed, 6 Feb 2019 16:05:41 +0530
Message-ID: <CAP245DUy5pe9KQrEX_5iiHg9RtLPHyZcygy6fkrLgsJQYak-_g@mail.gmail.com>
References: <cover.1548093127.git.amit.kucheria@linaro.org>
 <6a21a9ee7663e1b32d8ea81ac5e51d187aed25fb.1548093127.git.amit.kucheria@linaro.org>
 <20190123021251.GJ261387@google.com> <20190124233528.GA81583@google.com> <20190125222051.GF81583@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125222051.GF81583@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Andy Gross <andy.gross@linaro.org>, Taniya Das <tdas@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Doug Anderson <dianders@chromium.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 26, 2019 at 3:50 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > >                   trips {
> > > > -                         cpu_alert0: trip0 {
> > > > +                         cpu0_alert1: trip-point@0 {
> > > >                                   temperature =3D <75000>;
> > >
> > > In my observations a 'switch on/threshold' temperature of 75 degrees
> > > leads to aggressive throttling with IPA when the temperature is above
> > > this threshold:
> > >
> > > [  716.760804] cpu_cooling_ratelimit: 31 callbacks suppressed
> > > [  716.760836] cpu cpu4: Cooling state set to 10. New max freq =3D 19=
20000
> > > [  716.773390] power_allocator_ratelimit: 15 callbacks suppressed
> > > [  716.773405] thermal thermal_zone5: Controlling power: control_temp=
=3D95000 last_temp=3D73500, curr_temp=3D75200 total_requested_power=3D39025=
 total_granted_power=3D18654
> > > [  749.609336] cpu_cooling_ratelimit: 45 callbacks suppressed
> > > [  749.609371] cpu cpu4: Cooling state set to 11. New max freq =3D 18=
43200
> > > [  749.624300] power_allocator_ratelimit: 24 callbacks suppressed
> > > [  749.624323] thermal thermal_zone5: Controlling power: control_temp=
=3D95000 last_temp=3D70800, curr_temp=3D77200 total_requested_power=3D40136=
 total_granted_power=3D17402
> > > [  780.152633] cpu_cooling_ratelimit: 41 callbacks suppressed
> > > [  780.152666] cpu cpu4: Cooling state set to 11. New max freq =3D 18=
43200
> > > [  780.165247] power_allocator_ratelimit: 21 callbacks suppressed
> > > [  780.165261] thermal thermal_zone5: Controlling power: control_temp=
=3D95000 last_temp=3D64800, curr_temp=3D76900 total_requested_power=3D39719=
 total_granted_power=3D1759
> > >
> > > (the logs come from a local patch in our tree:
> > > https://chromium.googlesource.com/chromiumos/third_party/kernel/+/ec1=
c501a8093fed44a6697a5913ef2765f518e1f)
> > >
> > > At this point I don't have a clear idea what would be a reasonable
> > > value for the 'switch on/threshold' temperature, but probably it
> > > should to be higher than 75 degrees, at least with IPA. If there is
> > > no reasonable common configuration for different thermal governors I
> > > guess we'll have to target a commonly used governor and systems
> > > using other 'incompatible' governors need to override the config in
> > > their <board>.dtsi.
> >

Thanks for the elaborate testing and for sharing the numbers. This is
very useful information.

> > On my system I don't see a significant delta in core temperatures for
> > 'threshold' temperatures of 80, 85 or 90=C2=B0C. However Dhrystone
> > performance goes up by ~8% when changing the trip point from 80 to
> > 85=C2=B0C. For a switch from 85 to 90=C2=B0C I see a ~2% performance de=
lta. For
> > all trip points the average core temperatures are ~80=C2=B0C (silver) a=
nd
> > ~85=C2=B0C (gold). Interestingly I observed the highest average
> > temperatures with the trip point at 80=C2=B0C (repeated measurements we=
re
> > taken for different temperatures).
> >
> > Supposedly LMH throttling is disabled in the firmware I used for
> > these tests, however data suggests that it is still active
> > (temperature doesn't rise beyond 95=C2=B0C, even without throttling in
> > Linux; Dhrystone performance drops when raising the temperature beyond
> > 95=C2=B0C with a heat gun. I will do some more testing when I get my ha=
nds
> > on a FW that effectively disables LMH (or raises the threshold to
> > something like 105=C2=B0C).
> >
> > From the data collected so far I'd suggest a 'threshold' temperature
> > of 90=C2=B0C or if that seems to high 85=C2=B0C. Behavior might be diff=
erent
> > with other thermal governors or without LMH throttling..
>
> Some more data from measurements with different trips points, for the
> IPA and the Fair Share governors, LMH throttling was enabled:
>
>                         IPA
>         Dhrystone       Temp Silver     Temp Gold
> 75      6M              78.4            84.9
> 80      6.21M           81.4            89.8
> 85      6.74M           81.7            88.2
> 90      6.88M           79.4            84.6
>
>                         Fair Share
>         Dhrystone       Temp Silver     Temp Gold
> 75      6.63M           80.1            88.5
> 80      6.71M           80.1            88.5
> 85      6.77M           81.1            87.8
> 90      7.12M           81.2            87.8

Interesting that you get more MIPs out of fair share governor when
compared to IPA across the board. What devices were providing energy
cost information (dynamic-power-coefficient) to the IPA engine? Just
CPU and GPU? Can you point me to those patches in gerrit?

> Within this range the 'threshold' temperature doesn't seem to have a
> large impact on the average CPU temperature. There is a bit of
> fluctuation between individual measurements, I wouldn't be surprised
> if the outliers of Temp Gold for 75 and 90=C2=B0C converged more with the
> other values with some more measurements.
>
> I learned how to effectively disable LMH throttling, however with that
> it was fairly easy to have the CPUs overheat, even with throttling in
> Linux. If it is feasible at all to run with LMH disabled some more
> actions will be needed (e.g. attaching a heatsink or interrupt support
> for thermal sensors instead of polling, ...).

Given that LMH kicks in at 95 and IPA manages to maintain temperatures
in the ballpark of 80-90 regardless of the trip point value, I agree
that we should move the 1st trip point to 90. This will give maximum
performance. So in "threshold" and "target" terms 90 becomes the
threshold. And since LMH kicks in at 95, I've left it as the target
trip.

These should be sane defaults for upstream and any device can override
those numbers in their board file.

Thanks again for your thorough review.

Regards,
Amit
