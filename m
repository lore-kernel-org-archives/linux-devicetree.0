Return-Path: <SRS0=KaV4=TY=essensium.com=charles-antoine.couret@kernel.org>
Subject: Re: [PATCH v2 3/6] iio: ad7949: Support configuration read-back
References: <1556813672-49861-1-git-send-email-adam.michaelis@rockwellcollins.com>
 <1556813672-49861-3-git-send-email-adam.michaelis@rockwellcollins.com>
 <20190505154227.1735b1b2@archlinux>
 <CALMrGWV6rtYQShtm7uBQygtdOpPW30mLnKMxb2Jk8pY68B6yyw@mail.gmail.com>
From: Couret Charles-Antoine <charles-antoine.couret@essensium.com>
Message-ID: <154f2b5c-91e1-41dc-e7c5-a5ec35ca1c05@essensium.com>
Date: Fri, 24 May 2019 14:02:35 +0200
MIME-Version: 1.0
In-Reply-To: <CALMrGWV6rtYQShtm7uBQygtdOpPW30mLnKMxb2Jk8pY68B6yyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: Adam Michaelis <adam.michaelis@collins.com>, Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, lars@metafoo.de, michael.hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, Brandon Maier <brandon.maier@rockwellcollins.com>, Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
List-ID: <devicetree@vger.kernel.org>

Le 07/05/2019 à 21:53, Adam Michaelis a écrit :
> On Sun, May 5, 2019 at 9:42 AM Jonathan Cameron <jic23@kernel.org> wrote:
>> On Thu,  2 May 2019 11:14:29 -0500
>> Adam Michaelis <adam.michaelis@rockwellcollins.com> wrote:
>>
>>> Adds device tree parameter to set the configuration read-back bit
>>> in the configuration register to tell the AD7949 to include the value of
>>> the configuration register at the time the current sample was acquired
>>> when reading from the part.
>>>
>>> Further work must be done to make read-back information available to
>>> consumer.
>> This needs some explanation of why it is useful at all. I'm certainly unclear
>> on why it would be useful to configure this at boot time.
>>
>> Code looks fine.
>>
>> Jonathan
>>
> The configuration read-back feature is being maintained from the
> original version of this driver. Before adding the device tree entry,
> there was no way to change this setting other than debugfs raw access
> to the SPI interface, and there is still no access to the returned
> configuration data should the feature be enabled. I would be willing
> to remove the feature altogether, but wanted to tread softly on
> existing features.

Hi,

I added this feature for debug purpose but it is not used in our case 
anymore because the driver and the device are working as expected.

But maybe we can use it the check if the config is correctly applied? I 
don't know, it is probably useless to keep this feature here.

Regards,

Charles-Antoine Couret
