From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC 02/11] dt-bindings: power: amlogic, meson-gx-pwrc: Add SM1 bindings
Date: Tue, 20 Aug 2019 07:45:39 +0200
Message-ID: <CAFBinCCubjTCvzFWA-JJeGPJ_29O5az3=-99G3dvcnBNZGt+gw@mail.gmail.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
 <20190701104705.18271-3-narmstrong@baylibre.com> <CAFBinCAT1JaK6ksD9OzCK_wEEWJdaZL2vLzGeCzVVbz9V67btQ@mail.gmail.com>
 <7h1rxgvgyj.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7h1rxgvgyj.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Kevin,

On Tue, Aug 20, 2019 at 2:06 AM Kevin Hilman <khilman@baylibre.com> wrote:
[...]
> >> +ao_sysctrl: sys-ctrl@0 {
> >> +       compatible = "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd";
> >> +       reg =  <0x0 0x0 0x0 0x100>;
> >> +
> >> +       pwrc: power-controller {
> >> +               compatible = "amlogic,meson-sm1-pwrc";
> >> +               #power-domain-cells = <1>;
> >> +               amlogic,hhi-sysctrl = <&hhi>;
> >> +       };
> >> +};
> >
> > I'm not sure that we want to mix HHI and AO power domains in one driver again
>
> We're not mixing here. These are all EE domains.  They just have some
> control registers in the AO memory region.
looking at patch 04/11 I see what you mean
(I'm describing it in my own words to make sure I got it right)
we are controlling the EE power domains with this binding.
each power domain has 1 bit in the HHI registers and 2 more bits
("sleep" and "isolation") in the AO region

then it makes sense to describe this together

> > back in March I asked a few questions about modelling the power
> > domains and Kevin explained that we can implement them hierarchical:
> > [0]
> > unfortunately I didn't have the time to work on this - however, now
> > that we implement a new driver: should we follow this hierarchical
> > approach?
>
> The more I look at this, I don't think we have a commpelling need to
> model them hierarchically.  The main reason being is that of the 3
> top-level domains I listed[0], we can only managing the EE domains in the
> kernel.  It doesn't make sense to model/manage AO domains because, well,
> they are always-on (AO).  The CPU domains are managed my the PSCI
> firmware, and we don't/won't have any control over that.
agreed, this is the same for the 32-bit SoCs except that we manage the
CPU domains in arch/arm/mach-meson/platsmp.c instead of PSCI firmware
(no problem here, I'm just mentioning it to get a complete picture)

> For that reason, I think it makes the most sense to have a generic
> driver that handles all the EE domains.
>
> IMO, the SM1 driver that Neil wrote in patch 4 of this series is 80%
> there.  If we generalize that little more, it can be quite easily used
> for all the EE domains.
with your description above I agree.

for the 32-bit SoCs it would be beneficial if the register layout in
the bindings was swapped:
- have the power controller as child of HHI
- pass the AO syscon

my main points for this are:
- it seems that for some power domains there are no AO register bits,
for example the Ethernet Memory PD (GXBB datasheet [0] section 18.3 on
page 48 and Meson8b datasheet [1] section 5.4 on page 17)
- less confusion: if it's a power domain controller for the EE region
then it should be located there, even if it has additional bits
elsewhere
- (weakest argument though) on the 32-bit SoCs we currently don't have
a "big AO syscon" (and I don't see that we actually need it), but we
do have a "amlogic,meson8b-pmu", "syscon" binding which covers
AO_RTI_GEN_PWR_SLEEP0 (I should probably extend it so it covers
AO_RTI_GEN_PWR_ISO0 as well, that just extra 4 bytes)

What do you think?


Martin


[0] https://dn.odroid.com/S905/DataSheet/S905_Public_Datasheet_V1.1.4.pdf
[1] https://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
