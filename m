From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Tue, 19 Apr 2016 15:31:11 +0530
Message-ID: <571601E7.2000901@nvidia.com>
References: <20160331185945.GT2350@sirena.org.uk> <56FD7379.2000307@nvidia.com> <20160331192227.GU2350@sirena.org.uk> <56FD7F07.7010404@nvidia.com> <20160331203942.GV2350@sirena.org.uk> <56FE2009.4020302@nvidia.com> <20160401161121.GZ2350@sirena.org.uk> <570370E5.3070901@nvidia.com> <20160412010226.GO3351@sirena.org.uk> <570CF822.4050002@nvidia.com> <20160413065310.GK14664@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160413065310.GK14664@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn@kryo.se>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Wednesday 13 April 2016 12:23 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Tue, Apr 12, 2016 at 06:59:06PM +0530, Laxman Dewangan wrote:
>
>> I have put my understanding based on datasheet and observation but i=
t seems
>> I am missing some important information which is making difficult to
>> understand further here.
>> We are not crossing the maximum limit of the load on the rail per da=
tasheet.
>> We just changed the output capacitor in the platforms and saw deviat=
ion.
> Well, we might be hitting an inrush limit as we attempt to ramp the
> voltage up.

Yes, and Maxim said that once this is there, there is no way to=20
calculate the actual ramp time. It just say that ramp will not meet the=
=20
advertised value but there is no equation or anything to get the actual=
=20
ramp time. :-(



>
>> I think I need to go again to Vendor to find out that why changing o=
f
>> capacitor making the deviation in ramp delay and what is the relatio=
n.
>> Probably, that may help here.
> Possibly.  It did also occur to me last night that having a Maxim
> specific property which lets you specify a raw register value to
> configure in cases where the board goes out of spec (as opposed to a
> time which could be left specified as the real value) might solve the
> problem without being too terrible from an interface point of view,
> though something that's directly obvious from the schematic would be
> much better.

We had discussion with maxim and he pointed us the datasheet for=20
descriptions and helped on some query:

/*
Note 20. During a soft-start event or a DVS transition, the regulators=20
output current will increase by COUT*dV/dt. In the event that the load=20
current plus the additional current imposed by the soft-start or DVS=20
transition, reach the regulator=C2=92s current limit, the current limit=
 will=20
be enforced. When the current limit is enforced, the advertised=20
transition rate (dV/dt) will not occur.
---
13.4 Soft-Start and Dynamic Voltage Scaling
The linear regulators have a programmable soft-start rate. When a linea=
r=20
regulator is enabled, the output voltage ramps to its final voltage at =
a=20
slew rate of either 5mV/=C2=B5s or 100mV/=C2=B5s, depending on the stat=
e of the=20
SS_Lx bit.
The 5mV/=C2=B5s ramp rate limits the input inrush current to around 10m=
A on a=20
300mA regulator with a 2.2=C2=B5F output capacitor and no load. The 100=
mV/=C2=B5s=20
ramp rate results in a 200mA inrush current on a 300mA regulator with a=
=20
2.2=C2=B5F output capacitor and no load, but achieves regulation within=
 50=C2=B5s.=20
The soft-start ramp rate is also the rate of change at the output when=20
changing dynamically between two output voltages while enabled (dynamic=
=20
voltage scaling: DVS).
The LDO soft-start circuitry supports starting into a pre-biased output=
=2E=20
=46or example, if the output capacitor has an initial voltage of 0.4V w=
hen=20
the regulator is enabled, the regulator gracefully increases the=20
capacitor voltage to the required target voltage such as 1.2V. This is=20
unlike other regulators without the start into pre-bias feature where=20
they may force the output capacitor voltage to 0V before the soft-start=
=20
ramp begins.
During a soft-start event or a DVS transition, the regulators output=20
current will increase by COUT*dV/dt. In the event that the load current=
=20
plus the additional current imposed by the soft-start or DVS transition=
,=20
reach the regulator=C2=92s current limit, the current limit will be enf=
orced.=20
When the current limit is enforced, the advertised transition rate=20
(dV/dt) will not occur.
*/

We have more capacitance on the board and this increases the current at=
=20
power up. If we are within the specs for the LDO current then you will=20
notice that Maxim specs are guaranteed. However, Maxim does not=20
guarantee the timings in case current exceeds the LDO specs. In this=20
case because of the larger capacitances the currents seen by the LDO is=
=20
much more and hence Maxim device enforces current limit. When the=20
current limit is enforced then the dv/dt will be different than what is=
 set.

Some more query to help SW interface:
Q: Is there any mechanism where we can derive ramp rate based on maximu=
m=20
load or capacitor or inrush current?
Ans: No. Since the LDO imposes the current limit the standard formula=20
doesn=C2=92t hold correct. That=C2=92s the reason Maxim in their datash=
eet has=20
mentioned that the advertised rate will not occur.


So based on this, when platform does not have the advertised ramp, we=20
need to have:
Maxim specific property for register configurations and do not allow ru=
n=20
time changes as this does not hold correctly.
