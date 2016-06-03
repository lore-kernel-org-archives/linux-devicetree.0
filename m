From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/3] iio: adc: ina3221: Add DT binding details
Date: Fri, 3 Jun 2016 17:51:53 +0530
Message-ID: <57517661.8090205@nvidia.com>
References: <1464784454-7988-1-git-send-email-ldewangan@nvidia.com> <20160603020759.GA23947@rob-hp-laptop> <433b182c-fe43-df5c-ac6a-20a024630514@kernel.org> <57516E71.8080506@nvidia.com> <c5a10e77-d326-9fd5-7c5f-2f5593295b1e@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c5a10e77-d326-9fd5-7c5f-2f5593295b1e@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>
Cc: corbet@lwn.net, lars@metafoo.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Friday 03 June 2016 05:41 PM, Jonathan Cameron wrote:
> On 03/06/16 12:48, Laxman Dewangan wrote:
>> On Friday 03 June 2016 03:49 PM, Jonathan Cameron wrote:
>>>>> +
>>>>> +enable-power-monitor:        Boolean, Enable power monitoring of the device.
>>> Is this the power good stuff?  description should be more detailed.
>> If there is no shunt resistance then we can not enable power monitor
>> on that rail. Device does not mandate to have shunt and so this is
>> based on platforms.
> The voltage shunt also becomes meaningless (unless you have other very
> small voltage drops to measure!). So drop that channel as well.
> Either it is there to do current measurement or it isn't.

OK. understood.


>>>>> +
>>>>> +enable-continuous-mode:        Boolean. Device support oneshot and continuous
>>>>> +                mode for the channel data conversion. Presence
>>>>> +                of this property will enable the continuous
>>>>> +                mode from boot.
>>> Is the difference between driver load time and the point where usespace can
>>> set it up significant enough to justify this?
>> We change the mode dynamically. If we have more core then goto the
>> continuous mode so that we can apply throttling if power consumption
>> is going more than requirement. If we are running single core then
>> change to oneshot mode.
> That's definitely a usespace or firmware decision, not a kernel one
> to my mind - unless I guess you an enforcing bringing this device up
> before firing up the additional cores?
>
> Then it's nasty but I can start to see some justification.

Yaah, this is FW decision. Our need on some platform was that start the 
driver with the continuous mode.
But I think that may be specific need. I can remove this and let user 
space can enable the continuous mode.
