From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/3] iio: adc: ina3221: Add DT binding details
Date: Fri, 3 Jun 2016 17:18:01 +0530
Message-ID: <57516E71.8080506@nvidia.com>
References: <1464784454-7988-1-git-send-email-ldewangan@nvidia.com> <20160603020759.GA23947@rob-hp-laptop> <433b182c-fe43-df5c-ac6a-20a024630514@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <433b182c-fe43-df5c-ac6a-20a024630514@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>
Cc: corbet@lwn.net, lars@metafoo.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Friday 03 June 2016 03:49 PM, Jonathan Cameron wrote:
> On 03/06/16 03:07, Rob Herring wrote:
>> On Wed, Jun 01, 2016 at 06:04:12PM +0530, Laxman Dewangan wrote:
>>> +
>>> +Optional properties:
>>> +------------------
>>> +one-shot-average-sample:	Integer, Number of sample to average befo=
re
>>> +				putting in the registers in oneshot mode.
> Pick a sensible default in the driver then leave this to userspace to
> control.

>>> +
>>> +one-shot-vbus-conv-time-us:	Integer in microseconds, ADC conversio=
n time for
>>> +				bus voltage reading in oneshot mode.
> Hmm. This one is a little non obvious. It's really controlling the no=
ise
> level more than anything else.  Kind of integration time I guess thou=
gh
> not described as such in the datasheet.

Yes the conversion time and average time help to reduce noise on=20
conversion and efefctively tune the conversion delay per channel based=20
on system need.

 From data sheet:
The INA3221 has programmable conversion times for both the shunt and bu=
s=20
voltage measurements. The conversion times for these measurements can b=
e=20
selected from 140 =B5s to 8.244 ms. The conversion time settings, along=
=20
with the programmable averaging mode, enable the INA3221 to be=20
configured to optimize available timing requirements in a given=20
application. For example, if a system requires data to be read every 2=20
ms with all three channels monitored, the INA3221 can be configured wit=
h=20
the conversion times for the shunt and bus voltage measurements set to=20
332 =B5s. The INA3221 can also be configured with a different conversio=
n=20
time setting for the shunt and bus voltage measurements. This approach=20
is common in applications where the bus voltage tends to be relatively=20
stable. This situation allows for the time focused on the bus voltage=20
measurement to be reduced relative to the shunt voltage measurement. Fo=
r=20
example, the shunt voltage conversion time can be set to 4.156 ms with=20
the bus voltage conversion time set to 588 =B5s for a 5-ms update time.
There are trade-offs associated with conversion time settings and the=20
averaging mode used. The averaging feature can significantly improve th=
e=20
measurement accuracy by effectively filtering the signal. This approach=
=20
allows the INA3221 to reduce the amount of noise in the measurement tha=
t=20
may be caused by noise coupling into the signal. A greater number of=20
averages allows the INA3221 to be more effective in reducing the=20
measurement noise component. The trade-off to this noise reduction is=20
that the averaged value has a longer response time to input signal=20
changes. This aspect of the averaging feature is mitigated to some=20
extent with the critical alert feature that compares each single=20
conversion to determine if a measured signal (with its noise component)=
=20
has exceeded the maximum acceptable level.



We have different values for these parameters for oneshot and continuou=
s=20
mode.


>
> Again, I don't think this is really device tree material.
> However, you could argue the right decision on this is hardware depen=
dant
> as it really depends on ripple in the voltages? Not how it's describe=
d in
> the datasheet though.

The tuning is done on platform specific and hence it is from the device=
=20
tree here.


>>> +
>>> +one-shot-shunt-conv-time-us:	Integer in microseconds, ADC conversi=
on time for
>>> +				shunt voltage reading in oneshot mode.
>>> +
>>> +continuous-average-sample:	Integer, Number of sample to average be=
fore
>>> +				putting in the registers in continuous mode.
> Classic oversampling - not device tree material as it may well want
> runtime configuration.

Yaah, it is oversampling.


>>> +
>>> +continuous-vbus-conv-time-us:	Integer in microseconds, ADC convers=
ion time for
>>> +				bus voltage reading in continuous mode.
> Why should these be different from the one-shot versions?  Might be
> separately controlled (though I don't think they are).  If one settin=
g
> makes sense fo the hardware in oneshot mode, surely the same setting =
makes
> sense in continuous mode.

The oneshot and continuous mode get change in run time. We have=20
different configuration for the continuous mode and one shot mode for=20
the oversampling.

>>> +
>>> +continuous-shunt-conv-time-us:	Integer in microseconds, ADC conver=
sion time for
>>> +				shunt voltage reading in continuous mode.
>> These all need vendor prefix and need to state the valid range of
>> values.
>>
>>> +
>>> +enable-power-monitor:		Boolean, Enable power monitoring of the dev=
ice.
> Is this the power good stuff?  description should be more detailed.

If there is no shunt resistance then we can not enable power monitor on=
=20
that rail. Device does not mandate to have shunt and so this is based o=
n=20
platforms.



>>> +
>>> +enable-continuous-mode:		Boolean. Device support oneshot and conti=
nuous
>>> +				mode for the channel data conversion. Presence
>>> +				of this property will enable the continuous
>>> +				mode from boot.
> Is the difference between driver load time and the point where usespa=
ce can
> set it up significant enough to justify this?

We change the mode dynamically. If we have more core then goto the=20
continuous mode so that we can apply throttling if power consumption is=
=20
going more than requirement. If we are running single core then change=20
to oneshot mode.


