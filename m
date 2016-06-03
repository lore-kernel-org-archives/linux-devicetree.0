From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/3] iio: adc: ina3221: Add DT binding details
Date: Fri, 3 Jun 2016 14:32:38 +0530
Message-ID: <575147AE.30209@nvidia.com>
References: <1464784454-7988-1-git-send-email-ldewangan@nvidia.com> <20160603020759.GA23947@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20160603020759.GA23947@rob-hp-laptop>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: jic23@kernel.org, corbet@lwn.net, lars@metafoo.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Friday 03 June 2016 07:37 AM, Rob Herring wrote:
> On Wed, Jun 01, 2016 at 06:04:12PM +0530, Laxman Dewangan wrote:
>> +
>> +enable-power-monitor:		Boolean, Enable power monitoring of the device.
>> +
>> +enable-continuous-mode:		Boolean. Device support oneshot and continuous
>> +				mode for the channel data conversion. Presence
>> +				of this property will enable the continuous
>> +				mode from boot.
>> +
>> +enable-warning-alert:		Boolean, Enable the alert signal when shunt
>> +				current cross the warning threshold on any of
>> +				the channel. Absence of this property will not
>> +				enable the warning alert.
>> +
>> +enable-critical-alert:		Boolean, Enable the alert signal when shunt
>> +				current cross the critical threshold on any
>> +				of the channel. Absence of this property will
>> +				not enable the critical alert.
> Seems like these would be a user decision.

In some of platform, we want this to be from driver init itself. That's 
why it is there.

But I will move this to sysfs if this is something user level policy.



