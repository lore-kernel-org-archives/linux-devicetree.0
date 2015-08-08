From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] MAX6675 IIO temperature driver
Date: Sat, 8 Aug 2015 12:36:24 +0100
Message-ID: <55C5E9B8.5030404@kernel.org>
References: <1438635410-3757-1-git-send-email-mporter@konsulko.com>
 <897A4C3B-DF7E-4AEE-A117-00CCB510F4DD@jic23.retrosnub.co.uk>
 <20150804173417.GN15004@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150804173417.GN15004@beef>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jonathan Cameron <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>
Cc: Linux IIO List <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/08/15 18:34, Matt Porter wrote:
> On Tue, Aug 04, 2015 at 05:52:17PM +0100, Jonathan Cameron wrote:
>>
>>
>> On 3 August 2015 21:56:47 BST, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>> This series adds a driver for the MAX6675 SPI thermocouple converter.
>>> The device supports temperature measurements via type-K thermocouples
>>> and implements cold-junction compensation within the part. The
>>> datasheet
>>> can be found at http://datasheets.maximintegrated.com/en/ds/MAX6675.pdf
>> For a device like this where perhaps it's position wrt iio/hwmon boundary is unclear
>> I want to see an argument for why IIO makes more sense in the cover letter + cc
>>  at least the hwmon MAINTAINERS if not the list...
> 
> Will do. Just to summarize here, the typical use case for this type of
> thermocouple converter involves sample rates that are relatively high
> compared to what the hwmon interface can support. The upcoming hrtimer
> trigger will match up well with this to support fine-grained
> periodic samples. I'll add this in the v2 cover latter.
Fair enough - will want a least an OK from Jean / Guenter that they accept
this reasoning before I take the driver though.  Best to avoid stepping
one peoples toes!
> 
> -Matt
> 
>>> Matt Porter (3):
>>>  iio: temperature: add max6675 dt binding
>>>  iio: temperature: add max6675 thermocouple converter driver
>>>  MAINTAINERS: add max6675 driver
>>>
>>> .../bindings/iio/temperature/max6675.txt           |  19 +++
>>> MAINTAINERS                                        |   7 +
>>> drivers/iio/temperature/Kconfig                    |  11 ++
>>> drivers/iio/temperature/Makefile                   |   1 +
>>> drivers/iio/temperature/max6675.c                  | 155
>>> +++++++++++++++++++++
>>> 5 files changed, 193 insertions(+)
>>> create mode 100644
>>> Documentation/devicetree/bindings/iio/temperature/max6675.txt
>>> create mode 100644 drivers/iio/temperature/max6675.c
>>
>> -- 
>> Sent from my Android device with K-9 Mail. Please excuse my brevity.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
