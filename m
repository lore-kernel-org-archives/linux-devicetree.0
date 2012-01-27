From: Simon Glass <sjg@chromium.org>
Subject: Re: Pinmux bindings proposal V2
Date: Fri, 27 Jan 2012 07:43:36 -0800
Message-ID: <CAPnjgZ2EkvTMsOkWyf4pfwRpvcvYs=WaKy5Gi8fdkAUQmvt=ig@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF1780DAB4CE@HQMAIL01.nvidia.com>
	<CAPnjgZ3Xhebn1x1A-Vdy78DWbDd=cp0AK6tL-R1SRzS4GdF97g@mail.gmail.com>
	<20120127022111.GK29812@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120127022111.GK29812@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Stephen Warren <swarren@nvidia.com>, Dong Aisheng-B29396 <B29396@freescale.com>, "Linus Walleij (linus.walleij@linaro.org)" <linus.walleij@linaro.org>, "Sascha Hauer (s.hauer@pengutronix.de)" <s.hauer@pengutronix.de>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "cjb@laptop.org" <cjb@laptop.org>, Dong Aisheng <dongas86@gmail.com>, "Shawn Guo (shawn.guo@linaro.org)" <shawn.guo@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, "Grant Likely (grant.likely@secretlab.ca)" <grant.likely@secretlab.ca>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Tony,

On Thu, Jan 26, 2012 at 6:21 PM, Tony Lindgren <tony@atomide.com> wrote=
:
> Hi,
>
> * Simon Glass <sjg@chromium.org> [120126 09:11]:
>>
>> On Fri, Jan 20, 2012 at 2:22 PM, Stephen Warren <swarren@nvidia.com>=
 wrote:
>>
>> 1. It doesn't seem to make full use of the device tree format. For e=
xample,
>>
>> =A0 =A0<TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
>>
>> would be better as something like
>>
>> =A0 =A0 drive-strength =3D <5>;
>>
>> if we could arrange it. It also reduces the need for these
>> TEGRA_PMX_CONF_DRIVE_STRENGTH defines.
>
> I agree. This is something that most pinmux/pinconf drivers need to
> implement, so it's best done in a generic way.
>
>> In tegra20.dtsi:
>>
>> / {
>> =A0 =A0 =A0 &tegra_pmx {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* This is the first option for SDIO1.=
 It comes out
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* on pin groups DTA and DTD. Boards c=
an simply use this
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* phandle in the driver node to get t=
his option. Any options
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* not used could potentially be dropp=
ed from the device tree
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* blob for space-constrained boot loa=
ders.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pmx_sdhci1_dta_dtd: sdhci1-dta-dtd@0 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 label =3D "SDIO1 on DTA,=
 DTD (4-bit)";
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Here are the pin gr=
oups needed for this option.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* First DTA, then DTD=
=2E
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pmx@dta {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D =
<PG_DTA>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mux =3D =
<PMX_MUX_SDIO1>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 drive-st=
rengh =3D <5>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 slew-rat=
e =3D <4>;
>
> Using reg for the register offsets here makes sense to me. But doesn'=
t that
> mean that now we're back to having a node for each pin? And that is s=
omething
> we're trying to avoid because of the bloat as most systems have one r=
egister
> per pin, so this is not efficient for listing multiple pins.

Yes it does add a lot of overhead - I am responding to what I see as a
lot of effort to 'work around' the device tree format but turning
everything into property numbers rather than using properties more as
intended by the format. Using the device fully makes things
considerably easier to read.

The cost of the pmx@dta node is about 12 bytes for the header (it
depends on the length of the name), and each of the properties above
is 16 bytes. So in total this node is 76 bytes. If we have 250 pins
being muxed as Tegra3 then this is about 20KB (including a bit of
slack for longer names). My point about being able to 'optimise out'
some of these remains, though, but probably not for the kernel.

Stephen's 'mux' property uses 12 bytes plus 8 bytes per pin/group (I
am removing the prefixes):

                       mux =3D
                               <PG_DTA   MUX_SDIO1>
                               <PG_DTD   MUX_SDIO1>;

so 28 bytes. What I proposed would use (12 + 2 * 16) per pin/group, or
44 bytes (60% bigger):

>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pmx@dta {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D =
<PG_DTA>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mux =3D =
<PMX_MUX_SDIO1>;
>
> So maybe we should just use what Stephen suggested for the array of r=
egisters
> here:
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mux =3D=
 <MUX_OFFSET1 INITIAL_MUX_VALUE1
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 MUX_OFFSET2 INITIAL_MUX_VALUE2>;

Yes I think it does the job, it's just not very pretty. It would be
worth putting together an example for both and see how much larger the
'node-per-pin' binding becomes.

My main concern is with the 'pinctrl-entries' property which specifies
the size of the 2-dimensional pinctrl property. Perhaps that at least
could use the device tree hierarchy without much overhead, since it is
only one per device. Also I really like the idea of the board being
able to just specify a single simple 'pmux =3D <&phandle>' to get its
pinmux for a peripheral.

Looking at the config:

                       config =3D
                               <PG_DTA   DRIVE_STRENGTH   5>
                               <PG_DTD   DRIVE_STRENGTH   5>
                               <PG_DTA   SLEW_RATE   4>
                               <PG_DTD   SLEW_RATE   8>;

This is 12 bytes + 12 * 4 =3D 60 bytes. If we do things as:

>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 drive-st=
rengh =3D <5>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 slew-rat=
e =3D <4>;

this costs 16 bytes per property instead of 12 (33% bigger). This is
64 bytes if you have already paid the node overhead, perhaps 96 if you
haven't.

(Also remember my point about the ease of chopping back the fdt for
constrained systems).

>
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* We =
support two states here, active
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* and=
 standby. Properties in these child
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* nod=
es can override the ones at this level.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Dri=
vers can move between states just by
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* mak=
ing the changes in these nodes.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 state-ac=
tive {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 reg =3D <PMX_CONF_ACTIVE>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 tristate =3D <0>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 state-st=
andby {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 reg =3D <PMX_CONF_STANDBY>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 tristate =3D <1>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 drive-strengh =3D <2>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>
> This seems like a qood way to represent the alternative mux states fo=
r
> the muxes that need them. This is assuming the states have standard
> bindings and not some random names. I still don't know if we need the=
m
> though. And again when we have multiple registers, we'd have to have
> either multiple entries for each pin, or use the array instead of reg=
=2E
>
> Maybe we need two bindings: A minimal subset of what Stephen is sugge=
sting
> that can handle 95% of the muxes with minimal overhead, then what you=
're
> suggesting for the few muxes that need multiple states?

Perhaps that would work, it certainly deals nicely with making the
rare cases less ugly if indeed they are rare. Of course a single
binding that is not too ugly and still reasonably efficient would be
best.

I will have a think about this a bit more and see if anything leaps
out. It's quite an interesting problem...

Regards,
Simon

>
> Regards,
>
> Tony
