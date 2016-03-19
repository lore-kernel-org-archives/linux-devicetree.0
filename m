From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Fri, 18 Mar 2016 21:31:05 -0700
Message-ID: <CAJAp7OgUjN+Ymh+vM8g9Wex0JDRSOFkvpTKHm8fXYkDgTQ+0Tw@mail.gmail.com>
References: <1456756829-2277-1-git-send-email-ldewangan@nvidia.com>
	<20160229174751.GQ21240@tuxbot>
	<20160301022326.GC18327@sirena.org.uk>
	<56D5111E.6090606@nvidia.com>
	<20160302033833.GV18327@sirena.org.uk>
	<56D65F7E.3090907@nvidia.com>
	<20160302043506.GC18327@sirena.org.uk>
	<56E81103.8010903@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56E81103.8010903@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 15, 2016 at 6:41 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
> On Wednesday 02 March 2016 10:05 AM, Mark Brown wrote:
>>
>> * PGP Signed by an unknown key
>>
>> On Wed, Mar 02, 2016 at 09:05:26AM +0530, Laxman Dewangan wrote:
>>>
>>> On Wednesday 02 March 2016 09:08 AM, Mark Brown wrote:
>>>>
>>>> You're not trying to scale the value here, you're trying to replace the
>>>> value because the PMIC is incapable of delivering the advertised ramp
>>>> rate.  Trying to express this as a multiple of the advertised ramp rate
>>>> is just adding complexity.
>>>
>>> So should we provide absolute ramp value here for platform specific?
>>
>> Yes, otherwise if the PMIC vendor respecifies their ramp rates to
>> reflect reality and the driver is updated then your DT will be broken.
>>
>>> Or any other suggestion to handle this situation as this is very common
>>> and
>>> almost all our boards have this slowness on ramp.
>>
>> Perhaps time to have a chat with your PMIC vendors...
>>
>
> I had discussion with our HW team to get more information about this
> variation.
> They said that Maxim advertise the ramp time with given condition in
> interface i.e. capacitance etc which is very generic.
> We did the experiment with Maxim recommendation about the rail and its
> capacitance (2.2uF) and found that measured value is same as what they
> advertise in datasheet.
>
> When chip team use this PMIC with Tegra hardware specs and did the circuit
> simulation to ensures how our boards should be designed for signal integrity
> they suggested that the rail capacitance should be more than what Maxim
> recommending in general to work with our silicon. So here condition get
> changed and hence the effective ramp time.
>
> So here we will need two parameters:
> advertised-ramp-delay for PMIC configurations and
> ramp-delay which is measured one.
>
> Most of time, advertised-ramp-delay is same as ramp-delay and hence one
> value from DT will be sufficient.
> If there is difference then both value can be provided and
> advertised-ramp-delay  will be used for PMIC configuration and rest of
> calculation about delay will be from ramp-delay.
>

Generally the device driver should describe the PMIC and the device
tree should describe the board. So the Maxim's numbers should (if
specified at all) go into the driver and the measures/calculated
characteristics for your board should be specified in the dt.

The ramp properties in the generic regulator binding is used to inform
the OS about the board's ramp properties.


If I understand you correctly the Maxim PMIC can be configured to
drive the change at different speed, this should be configured through
a Maxim specific property. It should not reuse the generic properties
for ramp delays.

Regards,
Bjorn
