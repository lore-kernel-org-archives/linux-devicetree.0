From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Wed, 30 Mar 2016 18:59:07 +0530
Message-ID: <56FBD4A3.7080208@nvidia.com>
References: <1456756829-2277-1-git-send-email-ldewangan@nvidia.com>	<20160229174751.GQ21240@tuxbot>	<20160301022326.GC18327@sirena.org.uk>	<56D5111E.6090606@nvidia.com>	<20160302033833.GV18327@sirena.org.uk>	<56D65F7E.3090907@nvidia.com>	<20160302043506.GC18327@sirena.org.uk>	<56E81103.8010903@nvidia.com> <CAJAp7OgUjN+Ymh+vM8g9Wex0JDRSOFkvpTKHm8fXYkDgTQ+0Tw@mail.gmail.com> <56ED0F58.7060005@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56ED0F58.7060005@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: Mark Brown <broonie@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Saturday 19 March 2016 02:05 PM, Laxman Dewangan wrote:
>
> On Saturday 19 March 2016 10:01 AM, Bjorn Andersson wrote:
>> On Tue, Mar 15, 2016 at 6:41 AM, Laxman Dewangan 
>> <ldewangan@nvidia.com> wrote:
>>>
>>>
>> Generally the device driver should describe the PMIC and the device
>> tree should describe the board. So the Maxim's numbers should (if
>> specified at all) go into the driver and the measures/calculated
>> characteristics for your board should be specified in the dt.
>>
>> The ramp properties in the generic regulator binding is used to inform
>> the OS about the board's ramp properties.
>>
>>
>> If I understand you correctly the Maxim PMIC can be configured to
>> drive the change at different speed, this should be configured through
>> a Maxim specific property. It should not reuse the generic properties
>> for ramp delays.
>>
>
> Ramp delay configurations are seen on other vendor's PMIC devices also.
> Therefore, I like o me generic property rather than specific to Maxim. 
> Parsing can be done in the core framework and applied during setting 
> machine constraints.

Any comment on this approach?

Like to add property as "regulator-device-ramp-delay" which will be used 
for PMIC configuration and regulator-ramp-delay will be used for delay 
calculation. This is case when advertised ramp delay does not match with 
the platform measured ramp delay.

If regulator-device-ramp-delay is not provided from platform then 
regulator-ramp-delay will be used for PMIC configuration as well as for 
the delay calculation. This is case when advertised ramp delay match 
with the platform measured ramp delay.
