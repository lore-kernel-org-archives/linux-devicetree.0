From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/3] iio: adc: ina3221: Add DT binding details
Date: Fri, 3 Jun 2016 13:11:56 +0100
Message-ID: <c5a10e77-d326-9fd5-7c5f-2f5593295b1e@kernel.org>
References: <1464784454-7988-1-git-send-email-ldewangan@nvidia.com>
 <20160603020759.GA23947@rob-hp-laptop>
 <433b182c-fe43-df5c-ac6a-20a024630514@kernel.org>
 <57516E71.8080506@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <57516E71.8080506@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Rob Herring <robh@kernel.org>
Cc: corbet@lwn.net, lars@metafoo.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/06/16 12:48, Laxman Dewangan wrote:
>=20
> On Friday 03 June 2016 03:49 PM, Jonathan Cameron wrote:
>> On 03/06/16 03:07, Rob Herring wrote:
>>> On Wed, Jun 01, 2016 at 06:04:12PM +0530, Laxman Dewangan wrote:
>>>> +
>>>> +Optional properties:
>>>> +------------------
>>>> +one-shot-average-sample:    Integer, Number of sample to average =
before
>>>> +                putting in the registers in oneshot mode.
>> Pick a sensible default in the driver then leave this to userspace t=
o
>> control.
>=20
>>>> +
>>>> +one-shot-vbus-conv-time-us:    Integer in microseconds, ADC conve=
rsion time for
>>>> +                bus voltage reading in oneshot mode.
>> Hmm. This one is a little non obvious. It's really controlling the n=
oise
>> level more than anything else.  Kind of integration time I guess tho=
ugh
>> not described as such in the datasheet.
>=20
> Yes the conversion time and average time help to reduce noise on conv=
ersion and efefctively tune the conversion delay per channel based on s=
ystem need.
>=20
> From data sheet:
> The INA3221 has programmable conversion times for both the shunt and =
bus voltage measurements. The conversion times for these measurements c=
an be selected from 140 =B5s to 8.244 ms. The conversion time settings,=
 along with the programmable averaging mode, enable the INA3221 to be c=
onfigured to optimize available timing requirements in a given applicat=
ion. For example, if a system requires data to be read every 2 ms with =
all three channels monitored, the INA3221 can be configured with the co=
nversion times for the shunt and bus voltage measurements set to 332 =B5=
s. The INA3221 can also be configured with a different conversion time =
setting for the shunt and bus voltage measurements. This approach is co=
mmon in applications where the bus voltage tends to be relatively stabl=
e. This situation allows for the time focused on the bus voltage measur=
ement to be reduced relative to the shunt voltage measurement. For exam=
ple, the shunt voltage conversion time can be set to 4.156 ms with the
> bus voltage conversion time set to 588 =B5s for a 5-ms update time.
> There are trade-offs associated with conversion time settings and the=
 averaging mode used. The averaging feature can significantly improve t=
he measurement accuracy by effectively filtering the signal. This appro=
ach allows the INA3221 to reduce the amount of noise in the measurement=
 that may be caused by noise coupling into the signal. A greater number=
 of averages allows the INA3221 to be more effective in reducing the me=
asurement noise component. The trade-off to this noise reduction is tha=
t the averaged value has a longer response time to input signal changes=
=2E This aspect of the averaging feature is mitigated to some extent wi=
th the critical alert feature that compares each single conversion to d=
etermine if a measured signal (with its noise component) has exceeded t=
he maximum acceptable level.
>=20
>=20
>=20
> We have different values for these parameters for oneshot and continu=
ous mode.
>=20
>=20
>>
>> Again, I don't think this is really device tree material.
>> However, you could argue the right decision on this is hardware depe=
ndant
>> as it really depends on ripple in the voltages? Not how it's describ=
ed in
>> the datasheet though.
>=20
> The tuning is done on platform specific and hence it is from the devi=
ce tree here.
>=20
>=20
>>>> +
>>>> +one-shot-shunt-conv-time-us:    Integer in microseconds, ADC conv=
ersion time for
>>>> +                shunt voltage reading in oneshot mode.
>>>> +
>>>> +continuous-average-sample:    Integer, Number of sample to averag=
e before
>>>> +                putting in the registers in continuous mode.
>> Classic oversampling - not device tree material as it may well want
>> runtime configuration.
>=20
> Yaah, it is oversampling.
>=20
>=20
>>>> +
>>>> +continuous-vbus-conv-time-us:    Integer in microseconds, ADC con=
version time for
>>>> +                bus voltage reading in continuous mode.
>> Why should these be different from the one-shot versions?  Might be
>> separately controlled (though I don't think they are).  If one setti=
ng
>> makes sense fo the hardware in oneshot mode, surely the same setting=
 makes
>> sense in continuous mode.
>=20
> The oneshot and continuous mode get change in run time. We have diffe=
rent configuration for the continuous mode and one shot mode for the ov=
ersampling.
>=20
>>>> +
>>>> +continuous-shunt-conv-time-us:    Integer in microseconds, ADC co=
nversion time for
>>>> +                shunt voltage reading in continuous mode.
>>> These all need vendor prefix and need to state the valid range of
>>> values.
>>>
>>>> +
>>>> +enable-power-monitor:        Boolean, Enable power monitoring of =
the device.
>> Is this the power good stuff?  description should be more detailed.
>=20
> If there is no shunt resistance then we can not enable power monitor
> on that rail. Device does not mandate to have shunt and so this is
> based on platforms.
The voltage shunt also becomes meaningless (unless you have other very
small voltage drops to measure!). So drop that channel as well.
Either it is there to do current measurement or it isn't.
>=20

>=20
>>>> +
>>>> +enable-continuous-mode:        Boolean. Device support oneshot an=
d continuous
>>>> +                mode for the channel data conversion. Presence
>>>> +                of this property will enable the continuous
>>>> +                mode from boot.
>> Is the difference between driver load time and the point where usesp=
ace can
>> set it up significant enough to justify this?
>=20
> We change the mode dynamically. If we have more core then goto the
> continuous mode so that we can apply throttling if power consumption
> is going more than requirement. If we are running single core then
> change to oneshot mode.
That's definitely a usespace or firmware decision, not a kernel one
to my mind - unless I guess you an enforcing bringing this device up
before firing up the additional cores?

Then it's nasty but I can start to see some justification.

>=20

> --=20
> To unsubscribe from this list: send the line "unsubscribe linux-iio" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

