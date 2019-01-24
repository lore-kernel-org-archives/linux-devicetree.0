From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 1/1] arm64: dts: sdm845: wireup the thermal trip
 points to cpufreq
Date: Thu, 24 Jan 2019 15:35:28 -0800
Message-ID: <20190124233528.GA81583@google.com>
References: <cover.1548093127.git.amit.kucheria@linaro.org>
 <6a21a9ee7663e1b32d8ea81ac5e51d187aed25fb.1548093127.git.amit.kucheria@linaro.org>
 <20190123021251.GJ261387@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190123021251.GJ261387@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, tdas@codeaurora.org, swboyd@chromium.org, dianders@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 22, 2019 at 06:12:51PM -0800, Matthias Kaehlcke wrote:
> Hi Amit,
> 
> On Mon, Jan 21, 2019 at 11:38:34PM +0530, Amit Kucheria wrote:
> > Since all cpus in the big and little clusters, respectively, are in the
> > same frequency domain, use all of them for mitigation in the
> > cooling-map. We end up with two cooling devices - one each for the big
> > and little clusters.
> > 
> > We throttle lightly at the first trip point, just removing the boost
> > frequency. At the next trip point we allow ourselves to be throttled to
> > any extent.
> > 
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 225 +++++++++++++++++++++++++--
> >  1 file changed, 209 insertions(+), 16 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index c27cbd3bcb0a..878f661d16eb 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -13,6 +13,7 @@
> >  #include <dt-bindings/reset/qcom,sdm845-aoss.h>
> >  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> >  #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> > +#include <dt-bindings/thermal/thermal.h>
> >  
> >  / {
> >  	interrupt-parent = <&intc>;
> > @@ -99,6 +100,7 @@
> >  			compatible = "qcom,kryo385";
> >  			reg = <0x0 0x0>;
> >  			enable-method = "psci";
> > +			#cooling-cells = <2>;
> >  			next-level-cache = <&L2_0>;
> >  			L2_0: l2-cache {
> >  				compatible = "cache";
> > @@ -114,6 +116,7 @@
> >  			compatible = "qcom,kryo385";
> >  			reg = <0x0 0x100>;
> >  			enable-method = "psci";
> > +			#cooling-cells = <2>;
> >  			next-level-cache = <&L2_100>;
> >  			L2_100: l2-cache {
> >  				compatible = "cache";
> > @@ -126,6 +129,7 @@
> >  			compatible = "qcom,kryo385";
> >  			reg = <0x0 0x200>;
> >  			enable-method = "psci";
> > +			#cooling-cells = <2>;
> >  			next-level-cache = <&L2_200>;
> >  			L2_200: l2-cache {
> >  				compatible = "cache";
> > @@ -138,6 +142,7 @@
> >  			compatible = "qcom,kryo385";
> >  			reg = <0x0 0x300>;
> >  			enable-method = "psci";
> > +			#cooling-cells = <2>;
> >  			next-level-cache = <&L2_300>;
> >  			L2_300: l2-cache {
> >  				compatible = "cache";
> > @@ -150,6 +155,7 @@
> >  			compatible = "qcom,kryo385";
> >  			reg = <0x0 0x400>;
> >  			enable-method = "psci";
> > +			#cooling-cells = <2>;
> >  			next-level-cache = <&L2_400>;
> >  			L2_400: l2-cache {
> >  				compatible = "cache";
> > @@ -162,6 +168,7 @@
> >  			compatible = "qcom,kryo385";
> >  			reg = <0x0 0x500>;
> >  			enable-method = "psci";
> > +			#cooling-cells = <2>;
> >  			next-level-cache = <&L2_500>;
> >  			L2_500: l2-cache {
> >  				compatible = "cache";
> > @@ -174,6 +181,7 @@
> >  			compatible = "qcom,kryo385";
> >  			reg = <0x0 0x600>;
> >  			enable-method = "psci";
> > +			#cooling-cells = <2>;
> >  			next-level-cache = <&L2_600>;
> >  			L2_600: l2-cache {
> >  				compatible = "cache";
> > @@ -186,6 +194,7 @@
> >  			compatible = "qcom,kryo385";
> >  			reg = <0x0 0x700>;
> >  			enable-method = "psci";
> > +			#cooling-cells = <2>;
> >  			next-level-cache = <&L2_700>;
> >  			L2_700: l2-cache {
> >  				compatible = "cache";
> > @@ -1691,18 +1700,41 @@
> >  			thermal-sensors = <&tsens0 1>;
> >  
> >  			trips {
> > -				cpu_alert0: trip0 {
> > +				cpu0_alert1: trip-point@0 {
> >  					temperature = <75000>;
> 
> In my observations a 'switch on/threshold' temperature of 75 degrees
> leads to aggressive throttling with IPA when the temperature is above
> this threshold:
> 
> [  716.760804] cpu_cooling_ratelimit: 31 callbacks suppressed
> [  716.760836] cpu cpu4: Cooling state set to 10. New max freq = 1920000
> [  716.773390] power_allocator_ratelimit: 15 callbacks suppressed
> [  716.773405] thermal thermal_zone5: Controlling power: control_temp=95000 last_temp=73500, curr_temp=75200 total_requested_power=39025 total_granted_power=18654
> [  749.609336] cpu_cooling_ratelimit: 45 callbacks suppressed
> [  749.609371] cpu cpu4: Cooling state set to 11. New max freq = 1843200
> [  749.624300] power_allocator_ratelimit: 24 callbacks suppressed
> [  749.624323] thermal thermal_zone5: Controlling power: control_temp=95000 last_temp=70800, curr_temp=77200 total_requested_power=40136 total_granted_power=17402
> [  780.152633] cpu_cooling_ratelimit: 41 callbacks suppressed
> [  780.152666] cpu cpu4: Cooling state set to 11. New max freq = 1843200
> [  780.165247] power_allocator_ratelimit: 21 callbacks suppressed
> [  780.165261] thermal thermal_zone5: Controlling power: control_temp=95000 last_temp=64800, curr_temp=76900 total_requested_power=39719 total_granted_power=1759
> 
> (the logs come from a local patch in our tree:
> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/ec1c501a8093fed44a6697a5913ef2765f518e1f)
> 
> At this point I don't have a clear idea what would be a reasonable
> value for the 'switch on/threshold' temperature, but probably it
> should to be higher than 75 degrees, at least with IPA. If there is
> no reasonable common configuration for different thermal governors I
> guess we'll have to target a commonly used governor and systems
> using other 'incompatible' governors need to override the config in
> their <board>.dtsi.

On my system I don't see a significant delta in core temperatures for
'threshold' temperatures of 80, 85 or 90°C. However Dhrystone
performance goes up by ~8% when changing the trip point from 80 to
85°C. For a switch from 85 to 90°C I see a ~2% performance delta. For
all trip points the average core temperatures are ~80°C (silver) and
~85°C (gold). Interestingly I observed the highest average
temperatures with the trip point at 80°C (repeated measurements were
taken for different temperatures).

Supposedly LMH throttling is disabled in the firmware I used for
these tests, however data suggests that it is still active
(temperature doesn't rise beyond 95°C, even without throttling in
Linux; Dhrystone performance drops when raising the temperature beyond
95°C with a heat gun. I will do some more testing when I get my hands
on a FW that effectively disables LMH (or raises the threshold to
something like 105°C).

>From the data collected so far I'd suggest a 'threshold' temperature
of 90°C or if that seems to high 85°C. Behavior might be different
with other thermal governors or without LMH throttling..

> I should also say that the system I'm testing on isn't a
> representative environment (if such a thing exists at all...). It
> isn't running an upstream kernel (it's a recent version though,
> 4.19). We try to stay as close to upstream as possible, however our
> tree includes EAS related patches that affect thermal throttling which
> haven't landed upstream yet. Also we currently use a guesstimated
> value for 'dynamic-power-coefficient', which impacts IPA. And our
> device doesn't have it's final thermal envelope yet, possible future
> hardware changes (e.g. heatsink) may alter the behavior.
> 
> >  					hysteresis = <2000>;
> >  					type = "passive";
> >  				};
> >  
> > -				cpu_crit0: trip1 {
> > +				cpu0_alert0: trip-point@1 {
> 
> The labels of the two trip points (cpu0_alert0 and cpu0_alert1) are
> inverted.
> 
> > +					temperature = <95000>;
> > +					hysteresis = <2000>;
> > +					type = "passive";
> > +				};
> > +
> > +				cpu0_crit: cpu_crit {
> >  					temperature = <110000>;
> >  					hysteresis = <1000>;
> >  					type = "critical";
> >  				};
> >  			};
> > +
> > +			cooling-maps {
> > +				map0 {
> > +					trip = <&cpu0_alert0>;
> > +					cooling-device = <&CPU0 THERMAL_NO_LIMIT 1>,
> > +							 <&CPU1 THERMAL_NO_LIMIT 1>,
> > +							 <&CPU2 THERMAL_NO_LIMIT 1>,
> > +							 <&CPU3 THERMAL_NO_LIMIT 1>;
> > +				};
> 
> With IPA this doesn't really limit throttling to the boost
> frequency. Not sure if it has a negative impact, some other platforms
> with a thermal configuration that targets IPA only have a cooling map
> entry for the 'desired/target' temperature.
> 
> Cheers
> 
> Matthias
